import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';

class PrivacyPolicyPage extends ConsumerWidget { // Diubah menjadi ConsumerWidget
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Menambahkan WidgetRef[cite: 8]
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
          'Kebijakan Privasi',
          style: AppTheme.sectionTitle(color: AppTheme.primaryBlue, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Besar (Desain Asli)
            RichText(
              text: TextSpan(
                style: AppTheme.pageTitle(fontSize: 36),
                children: [
                  TextSpan(
                    text: 'Privasi Anda\nAdalah ',
                    style: AppTheme.pageTitle(fontSize: 36).copyWith(color: AppTheme.primaryBlue),
                  ),
                  TextSpan(
                    text: 'Prioritas',
                    style: AppTheme.pageTitle(fontSize: 36).copyWith(color: AppTheme.primaryOrange),
                  ),
                  TextSpan(
                    text: '\nKami.',
                    style: AppTheme.pageTitle(fontSize: 36).copyWith(color: AppTheme.primaryBlue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Paragraf 1
            _buildContentText(
              'Kami menghargai dan melindungi privasi setiap pengguna aplikasi ini. Informasi yang dikumpulkan hanya digunakan untuk mendukung pengalaman belajar yang lebih baik dan tidak akan dibagikan kepada pihak ketiga tanpa persetujuan pengguna.',
            ),
            const SizedBox(height: 24),

            // Paragraf 2
            _buildContentText(
              'Data yang dikumpulkan dapat meliputi aktivitas penggunaan aplikasi, progress pembelajaran, serta interaksi dengan fitur yang tersedia. Data tersebut digunakan untuk meningkatkan kualitas layanan, memberikan rekomendasi materi, dan mengembangkan fitur yang lebih relevan.',
            ),
            const SizedBox(height: 24),

            // Paragraf 3
            _buildContentText(
              'Kami berkomitmen untuk menjaga keamanan data pengguna dengan menerapkan langkah-langkah perlindungan yang sesuai. Dengan menggunakan aplikasi ini, pengguna dianggap telah memahami dan menyetujui kebijakan privasi yang berlaku.',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // Widget helper tetap sama
  Widget _buildContentText(String text) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: AppTheme.body(fontSize: 15, color: Colors.grey[700]),
    );
  }
}