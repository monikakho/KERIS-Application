// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../providers/user_provider.dart'; 
import '../../providers/auth_provider.dart';
import '../../core/theme/app_theme.dart';

class EditAkunPage extends ConsumerStatefulWidget {
  const EditAkunPage({super.key});

  @override
  ConsumerState<EditAkunPage> createState() => _EditAkunPageState();
}

class _EditAkunPageState extends ConsumerState<EditAkunPage> {
  // 1. Deklarasi Controller untuk menangkap input teks
  late TextEditingController nameController;
  bool _isInit = false;
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Memantau data user terbaru dari Riverpod
    final userAsync = ref.watch(userProvider);
    final userService = ref.watch(userServiceProvider);
    final authService = ref.watch(authServiceProvider);

    ref.listen(userProvider, (_, next) {
      next.whenData((user) {
        if (user != null && !_isInit) {
          nameController.text = user.username;
          _isInit = true;
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Akun',
          style: AppTheme.sectionTitle(color: AppTheme.primaryBlue, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // BAGIAN FOTO PROFIL (Desain Asli)[cite: 4]
            userAsync.when(
              data: (user) {
                if (user == null) return const SizedBox();
                return Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _imageFile != null 
                            ? FileImage(_imageFile!) as ImageProvider
                            : (user.profileImageUrl != null
                                ? NetworkImage(user.profileImageUrl!) as ImageProvider
                                : const AssetImage('assets/image/farhan_kebab.png')),
                      ),
                      // Tombol Ganti Foto (Kamera)
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: _pickImage,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppTheme.primaryOrange,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                          ),
                        ),
                      ),
                      // LINE TAMBAHAN: Tombol Hapus Foto Baru (Hanya muncul jika gambar baru dipilih)
                      if (_imageFile != null)
                        Positioned(
                          bottom: 5,
                          left: 5,
                          child: GestureDetector(
                            onTap: _removeImage, // <--- Fungsi _removeImage sekarang digunakan di sini
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.delete, color: Colors.white, size: 20),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
            const SizedBox(height: 30),

            // FORM INPUT (Desain Asli)[cite: 4]
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('INFORMASI DASAR'),
                  const SizedBox(height: 20),
                  
                  // Menggunakan Controller untuk Nama[cite: 4]
                  _buildTextField('Nama Pengguna', nameController),

                  const SizedBox(height: 30),
                  _buildSectionTitle('KEAMANAN'),
                  const SizedBox(height: 20),
                  _buildTextField(
                    'Kata Sandi',
                    TextEditingController(text: '............'),
                    isPassword: true,
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    'Konfirmasi Kata Sandi',
                    TextEditingController(text: '............'),
                    isPassword: true,
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : () async {
                        final authUser = authService.getCurrentUser();
                        if (authUser != null) {
                          setState(() { _isLoading = true; });
                          try {
                            final newName = nameController.text.trim();
                            await userService.updateUserProfile(authUser.uid, {'username': newName});
                            
                            if (_imageFile != null) {
                              await userService.uploadProfileImage(authUser.uid, _imageFile!);
                            }
                            
                            if (context.mounted) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Perubahan berhasil disimpan')),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Gagal menyimpan: $e')),
                              );
                            }
                          } finally {
                            if (mounted) setState(() { _isLoading = false; });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading 
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                          : Text(
                              'Simpan Perubahan',
                              style: AppTheme.button(color: Colors.white, fontSize: 16),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTheme.label(color: AppTheme.primaryOrange, fontSize: 12),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, { // Diubah dari String initialValue ke Controller[cite: 4]
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.sectionTitle(color: const Color(0xFF5A6B7F), fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller, // Hubungkan controller ke form[cite: 4]
          obscureText: isPassword,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFE9ECEF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
          ),
        ),
      ],
    );
  }
}