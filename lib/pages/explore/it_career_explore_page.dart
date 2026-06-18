// lib/pages/explore/it_career_explorer_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Import file-file baru yang tadi kita bahas
import '../../providers/career_provider.dart';
import 'career_detail_page.dart';
import '../../core/theme/app_theme.dart';

class ItCareerExplorerPage extends ConsumerWidget {
  const ItCareerExplorerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Color navyBlue = AppTheme.primaryBlue;
    // Ambil data dari provider
    final careers = ref.watch(careerListProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: navyBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "IT Career Explorer",
          style: AppTheme.sectionTitle(color: navyBlue, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Eksplorasi Karir",
              style: AppTheme.pageTitle(fontSize: 26),
            ),
            const SizedBox(height: 8),
            Text(
              "Temukan jalur karir impianmu di dunia teknologi hari ini.",
              style: AppTheme.body(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 25),

            // Search Bar
            _buildSearchBar(),

            const SizedBox(height: 25),

            // List Karir (Dinamis dari Provider)
            // Bagian Utama
            ...careers.take(8).map((career) => _CareerItem(career: career)),

            const SizedBox(height: 25),
            Text(
              "ADVANCED TECH",
              style: AppTheme.label(fontSize: 12, color: const Color(0xFF8B4513)),
            ),
            const SizedBox(height: 15),

            // Bagian Advanced (Sisanya)
            ...careers.skip(8).map((career) => _CareerItem(career: career)),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: "Cari karir...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class _CareerItem extends ConsumerWidget {
  final dynamic career; // Menggunakan CareerModel dari provider

  const _CareerItem({required this.career});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Color navyBlue = AppTheme.primaryBlue;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        leading: Icon(career.icon, color: navyBlue),
        title: Text(
          career.title,
          style: AppTheme.sectionTitle(
            color: navyBlue,
            fontSize: 14,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        onTap: () {
          // 1. Simpan data yang diklik ke selectedCareerProvider
          ref.read(selectedCareerProvider.notifier).state = career;

          // 2. Navigasi ke halaman detail tunggal
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CareerDetailPage()),
          );
        },
      ),
    );
  }
}