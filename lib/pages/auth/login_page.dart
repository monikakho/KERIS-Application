import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
// ignore: unused_import
import '../../services/auth_service.dart';
import 'register_page.dart';
import '../../core/theme/app_theme.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _showErrorDialog(String title, String message, Color color) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(title, style: AppTheme.sectionTitle(fontSize: 20, color: color)),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK", style: AppTheme.button(color: AppTheme.primaryBlue)),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogin() async {
    if (usernameController.text.trim().isEmpty || passwordController.text.trim().isEmpty) {
      _showErrorDialog("Peringatan", "Username dan Kata Sandi tidak boleh kosong!", Colors.orange);
      return;
    }

    setState(() => _isLoading = true);

    try {
      final authService = ref.read(authServiceProvider);
      await authService.loginWithUsername(
        usernameController.text.trim(),
        passwordController.text.trim(),
      );
      // Jika sukses, main.dart StreamBuilder akan otomatis me-redirect ke MainNavigation.
      // JANGAN navigasi manual di sini!
    } catch (e) {
      if (mounted) {
        _showErrorDialog("Gagal Masuk", e.toString().replaceAll("Exception: ", ""), Colors.red);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final obscureText = ref.watch(obscureTextProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // LOGO
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/image/logo_keris.png',
                      height: 50, 
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "KERIS",
                      style: AppTheme.pageTitle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Selamat Datang\nKembali",
                style: AppTheme.pageTitle(fontSize: 32),
              ),
              const SizedBox(height: 30),
              _buildLabel("Username"),
              _buildTextField("admin", false, Icons.person_outlined, usernameController),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLabel("KATA SANDI"),
                  Text("Lupa Kata Sandi?", style: AppTheme.label(fontSize: 11, color: Colors.redAccent)),
                ],
              ),
              _buildTextField("********", obscureText, Icons.lock_outline, passwordController),
              const SizedBox(height: 40),
              // TOMBOL MASUK
              ElevatedButton(
                onPressed: _isLoading ? null : _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 24, width: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                      )
                    : Text("Masuk", style: AppTheme.button(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 25),
              // DIVIDER
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Atau masuk dengan", style: AppTheme.body(fontSize: 12, color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),
              const SizedBox(height: 25),
              // GOOGLE SIGN IN
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(color: Colors.grey[200]!),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.g_mobiledata, color: Colors.blue, size: 40),
                    const SizedBox(width: 5),
                    Text("Sign in With Google", style: AppTheme.button(color: Colors.black87, fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // LINK DAFTAR
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
                  child: RichText(
                    text: TextSpan(
                      text: "Belum punya akun? ",
                      style: AppTheme.body(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Daftar di sini",
                          style: AppTheme.label(color: AppTheme.primaryBlue, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- HELPER WIDGETS ---

  Widget _buildLabel(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(text, style: AppTheme.label(fontSize: 11, color: AppTheme.primaryBlue)),
  );

  Widget _buildTextField(String hint, bool isPass, IconData icon, TextEditingController controller) {
    final obscureText = ref.watch(obscureTextProvider);
    return TextField(
      controller: controller,
      obscureText: isPass ? obscureText : false,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[50],
        prefixIcon: Icon(icon, size: 20, color: Colors.grey),
        suffixIcon: isPass
            ? IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey, size: 20),
                onPressed: () => ref.read(obscureTextProvider.notifier).state = !obscureText,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: AppTheme.primaryOrange),
        ),
      ),
    );
  }
}