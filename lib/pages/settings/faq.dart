// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';

class HelpSupportPage extends ConsumerWidget { // Diubah menjadi ConsumerWidget
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Menambahkan WidgetRef
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
          'Bantuan & Dukungan',
          style: AppTheme.sectionTitle(color: AppTheme.primaryBlue, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Besar (Desain Asli)
            Text(
              'Ada yang bisa\nkami bantu?',
              style: AppTheme.pageTitle(fontSize: 34),
            ),
            const SizedBox(height: 20),
            // Deskripsi
            Text(
              'Tim dukungan kami berdedikasi untuk memastikan perjalanan belajar Anda di KERIS berjalan dengan mulus. Temukan solusi atau hubungi kami secara langsung.',
              style: AppTheme.body(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 35),

            // Kartu Hubungi via Email (Desain Asli)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.mail_outline,
                    color: AppTheme.primaryOrange,
                    size: 32,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Hubungi via Email',
                    style: AppTheme.cardTitle(fontSize: 24, color: AppTheme.primaryBlue),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Punya pertanyaan teknis atau kendala akun? Kirimkan pesan Anda dan tim kami akan merespons dalam waktu 24 jam.',
                    style: AppTheme.body(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'kerissupport@gmail.com',
                    style: AppTheme.sectionTitle(fontSize: 16, color: AppTheme.primaryOrange).copyWith(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Bagian Header FAQ
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FAQ',
                  style: AppTheme.cardTitle(fontSize: 22, color: AppTheme.primaryBlue),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 45,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryOrange,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Lihat Semua FAQ',
                      style: AppTheme.label(fontSize: 13, color: AppTheme.primaryOrange),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward,
                      color: AppTheme.primaryOrange,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // List Item FAQ
            _buildFaqCard('01', 'Bagaimana cara mengakses Ruang Belajar?'),
            _buildFaqCard('02', 'Lupa kata sandi atau kendala login?'),
            _buildFaqCard('03', 'Informasi sertifikat dan penyelesaian kursus'),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget helper tetap sama
  Widget _buildFaqCard(String number, String question) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Text(
          number,
          style: AppTheme.sectionTitle(fontSize: 18, color: AppTheme.primaryOrange),
        ),
        title: Text(
          question,
          style: AppTheme.sectionTitle(fontSize: 15, color: AppTheme.primaryBlue),
        ),
        trailing: const Icon(Icons.add, color: Colors.grey, size: 24),
      ),
    );
  }
}