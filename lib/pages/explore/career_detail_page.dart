import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/career_provider.dart';
import '../../core/theme/app_theme.dart';

class CareerDetailPage extends ConsumerWidget {
  const CareerDetailPage({super.key});

  static const Color navyBlue = AppTheme.primaryBlue;
  static const Color orangeColor = AppTheme.primaryOrange;
  static const Color softGrey = AppTheme.background;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final career = ref.watch(selectedCareerProvider);

    if (career == null) return const Scaffold(body: Center(child: Text("Data tidak tersedia")));

    // Logika sederhana untuk memisahkan kata terakhir judul agar berwarna beda
    List<String> titleParts = career.title.split(' ');
    String firstPart = titleParts.sublist(0, titleParts.length - 1).join(' ');
    String lastPart = titleParts.last;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: navyBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(career.title, 
          style: AppTheme.sectionTitle(color: navyBlue, fontSize: 16)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined, color: navyBlue)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Besar dengan Dua Warna
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: RichText(
                text: TextSpan(
                  style: AppTheme.pageTitle(fontSize: 34),
                  children: [
                    TextSpan(text: "$firstPart ", style: AppTheme.pageTitle(fontSize: 34).copyWith(color: navyBlue)),
                    TextSpan(text: lastPart, style: AppTheme.pageTitle(fontSize: 34).copyWith(color: orangeColor)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildSectionCard("RINGKASAN", career.description),
                  const SizedBox(height: 15),
                  _buildSalaryCard(career.salary),
                ],
              ),
            ),

            // Peran & Tanggung Jawab dengan Background Abu Halus
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: softGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleWithDecoration("Peran & Tanggung Jawab"),
                  const SizedBox(height: 25),
                  ...career.tasks.map((task) => _buildCheckItem(task)),
                ],
              ),
            ),

            // Keahlian Section
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: softGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleWithDecoration("Keahlian yang\nDibutuhkan"),
                  const SizedBox(height: 20),
                  _buildSkillChips(career.skills),
                  const SizedBox(height: 20),
                  _buildSoftSkillCard(),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Jalur Karier Header
            Center(
              child: Column(
                children: [
                  Text("Jalur Karier", style: AppTheme.cardTitle(fontSize: 24, color: navyBlue)),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Evolusi peran dari perancang visual hingga pemimpin strategis dalam pengalaman pengguna.",
                      textAlign: TextAlign.center,
                      style: AppTheme.body(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            
            // Jalur Karier Steps
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: career.careerPath.map((step) => _buildCareerStep(step)).toList(),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // Helper Dekorasi Judul (Garis Coklat di samping teks)
  Widget _buildTitleWithDecoration(String title) {
    return Row(
      children: [
        Container(
          width: 5,
          height: 35,
          decoration: BoxDecoration(
            color: orangeColor,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 15),
        Text(title, style: AppTheme.sectionTitle(fontSize: 20, color: navyBlue)),
      ],
    );
  }

  Widget _buildSectionCard(String title, String content) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: Colors.white, 
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: softGrey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTheme.label(color: orangeColor, fontSize: 11)),
        const SizedBox(height: 15),
        Text(content, style: AppTheme.body(fontSize: 15, color: Colors.black87)),
      ],
    ),
  );

  Widget _buildSalaryCard(String amount) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(25),
    decoration: BoxDecoration(
      color: const Color(0xFF1D1E2C), // Warna Biru Gelap sesuai gambar
      borderRadius: BorderRadius.circular(15)
    ),
    child: Column(
      children: [
        Text("ESTIMASI PENDAPATAN", style: AppTheme.label(color: const Color(0xFFE48D41), fontSize: 10)),
        const SizedBox(height: 10),
        Text(amount, style: AppTheme.pageTitle(fontSize: 28).copyWith(color: Colors.white)),
        const SizedBox(height: 8),
        Text("Rata-rata gaji per bulan untuk level Junior hingga Mid di Indonesia", 
          textAlign: TextAlign.center,
          style: AppTheme.body(color: Colors.white60, fontSize: 11)),
      ],
    ),
  );

  Widget _buildCheckItem(String text) => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle_outline, color: orangeColor, size: 22),
        const SizedBox(width: 15),
        Expanded(child: Text(text, style: AppTheme.body(fontSize: 15, color: Colors.black87))),
      ],
    ),
  );

  Widget _buildSkillChips(List<String> skills) => Wrap(
    spacing: 10, runSpacing: 10,
    children: skills.map((s) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(s, style: AppTheme.sectionTitle(fontSize: 12, color: navyBlue)),
    )).toList(),
  );

  Widget _buildSoftSkillCard() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFFDDE1E6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User Empathy, Problem Solving, & Komunikasi", 
          style: AppTheme.sectionTitle(fontSize: 14, color: navyBlue)),
        const SizedBox(height: 5),
        Text("SOFT SKILLS", style: AppTheme.label(fontSize: 10, color: Colors.grey)),
      ],
    ),
  );

  Widget _buildCareerStep(dynamic step) => Column(
    children: [
      // Lingkaran Angka
      Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: CircleAvatar(
          radius: 25, 
          backgroundColor: step.isSpecial ? orangeColor : navyBlue, 
          child: Text(step.num, style: AppTheme.sectionTitle(fontSize: 14, color: Colors.white))
        ),
      ),
      // Card Jalur
      Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10, bottom: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        ),
        child: Column(
          children: [
            Container(
              height: 4, 
              width: double.infinity, 
              decoration: BoxDecoration(
                color: step.isSpecial ? orangeColor : navyBlue,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15))
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Text(step.title, style: AppTheme.sectionTitle(fontSize: 18, color: navyBlue)),
                  const SizedBox(height: 12),
                  Text(step.desc, textAlign: TextAlign.center, style: AppTheme.body(fontSize: 13, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}