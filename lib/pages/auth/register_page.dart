import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import '../../core/theme/app_theme.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final obs1 = ref.watch(obscureTextProvider);
    final obs2 = ref.watch(obscureConfirmTextProvider);

    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    void showStatusDialog(String title, String message, Color color) {
      showDialog(
        context: context,
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                 children: [
                    Image.asset(
                    'assets/image/logo_keris.png',
                    height: 50,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => 
                        const Icon(Icons.broken_image, size: 30, color: Colors.grey),
                    ),
                    const SizedBox(width: 10), // Memberi jarak antara logo dan teks
                    Text(
                      "KERIS",
                      style: AppTheme.pageTitle(fontSize: 24),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              Text("Buat Akun\nBaru",
                  style: AppTheme.pageTitle(fontSize: 32)),
              const SizedBox(height: 10),
              Text(
                  "Lengkapi data diri Anda untuk memulai perjalanan karir IT Anda",
                  style: AppTheme.body(fontSize: 14, color: Colors.grey[600])),
              const SizedBox(height: 30),
              
              _buildInp("USERNAME", "Masukkan username", Icons.person_outline, usernameController),
              _buildInp("EMAIL", "nama@gmail.com", Icons.email_outlined, emailController),
              _buildPassInp(ref, "KATA SANDI", obs1, passwordController,
                  () => ref.read(obscureTextProvider.notifier).state = !obs1),
              _buildPassInp(ref, "KONFIRMASI KATA SANDI", obs2, confirmPasswordController,
                  () => ref.read(obscureConfirmTextProvider.notifier).state = !obs2),
              
              const SizedBox(height: 30),

              // TOMBOL DAFTAR
              ElevatedButton(
                onPressed: () async {
                  if (usernameController.text.trim().isEmpty || 
                      emailController.text.trim().isEmpty || 
                      passwordController.text.trim().isEmpty) {
                    showStatusDialog("Peringatan", "Semua field harus diisi!", Colors.orange);
                    return;
                  }
                  if (passwordController.text != confirmPasswordController.text) {
                    showStatusDialog("Peringatan", "Kata sandi tidak cocok!", Colors.orange);
                    return;
                  }

                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => const Dialog(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.primaryOrange),
                        ),
                      ),
                    ),
                  );

                  try {
                    await authService.registerWithEmail(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                      usernameController.text.trim(),
                    );
                    
                    if (context.mounted) {
                      Navigator.pop(context); // Tutup loading
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Pendaftaran Berhasil!")),
                      );
                      Navigator.pop(context); // Kembali ke Login
                    }
                  } catch (e) {
                    if (context.mounted) {
                      Navigator.pop(context); // Tutup loading
                      showStatusDialog("Gagal Mendaftar", e.toString().replaceAll("Exception: ", ""), Colors.red);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryOrange,
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Text("Daftar Sekarang", // Diubah menjadi lebih simpel sesuai gambar
                    style: AppTheme.button(color: Colors.white, fontSize: 18)),
              ),

              const SizedBox(height: 25),
              Center(child: Text("Atau daftar dengan", style: AppTheme.body(color: Colors.grey))),
              const SizedBox(height: 25),

              // TOMBOL GOOGLE
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, size: 30, color: AppTheme.primaryBlue),
                label: Text("Sign in With Google", 
                  style: AppTheme.button(color: AppTheme.primaryBlue, fontSize: 16)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              ),

              const SizedBox(height: 30),

              // TEKS MASUK DI SINI
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun? ",
                      style: AppTheme.body(color: Colors.grey)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Kembali ke Login
                    },
                    child: Text(
                      "Masuk di sini",
                      style: AppTheme.label(color: AppTheme.primaryBlue, fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Helper (Sama seperti sebelumnya) ---

  Widget _buildInp(String label, String hint, IconData icon, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTheme.label(fontSize: 11, color: AppTheme.primaryBlue)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 20, color: Colors.grey),
            hintText: hint,
            filled: true,
            fillColor: Colors.grey[50],
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppTheme.primaryOrange)),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget _buildPassInp(WidgetRef ref, String label, bool obs, TextEditingController controller, VoidCallback tap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppTheme.label(fontSize: 11, color: AppTheme.primaryBlue)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obs,
          decoration: InputDecoration(
            prefixIcon:
                const Icon(Icons.lock_outline, size: 20, color: Colors.grey),
            suffixIcon: IconButton(
                icon: Icon(obs ? Icons.visibility_off : Icons.visibility,
                    size: 20, color: Colors.grey),
                onPressed: tap),
            hintText: "********",
            filled: true,
            fillColor: Colors.grey[50],
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey.shade200)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppTheme.primaryOrange)),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}