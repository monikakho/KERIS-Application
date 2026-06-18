import 'package:flutter/material.dart';
import 'ai_talent_scout.dart';
import 'it_career_explore_page.dart';
import '../../widgets/keris_app_bar.dart';
import '../../core/theme/app_theme.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color navyBlue = AppTheme.primaryBlue;
    const Color orangeColor = AppTheme.primaryOrange;
    const Color lightGrey = AppTheme.background;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KerisAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header Text
            Text(
              "Jelajahi Jalur\nPembelajaranmu",
              style: AppTheme.pageTitle(fontSize: 28),
            ),
            const SizedBox(height: 8),
            Text(
              "Di sini kamu dapat menemukan masa depan\nyang cocok untuk anda.",
              style: AppTheme.body(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Card AI Talent Scout (Vertical Stack)
            _buildMainCard(
              title: "AI Talent Scout",
              desc: "Temukan Skill IT mu!",
              icon: Icons.psychology_alt,
              color: navyBlue,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AiTalentScoutPage())),
            ),

            const SizedBox(height: 20),

            // Card IT Career Explorer (Vertical Stack)
            _buildMainCard(
              title: "IT Career Explorer",
              desc: "Jelajahi Karier di Bidang IT",
              icon: Icons.explore_outlined,
              color: orangeColor,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ItCareerExplorerPage())),
            ),

            const SizedBox(height: 30),

            // Karier Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Karier yang Banyak\nDiminati",
                  style: AppTheme.sectionTitle(fontSize: 16, color: navyBlue),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("LIHAT SEMUA", style: AppTheme.label(color: orangeColor, fontSize: 12)),
                )
              ],
            ),
            const SizedBox(height: 15),

            // Grid Karier (Web Dev, Data Science, dll)
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.5,
              children: [
                _buildSmallCard(Icons.code, "Web Dev", lightGrey, navyBlue),
                _buildSmallCard(Icons.storage, "Data Science", lightGrey, navyBlue),
                _buildSmallCard(Icons.security, "Cyber\nSecurity", lightGrey, navyBlue),
                _buildSmallCard(Icons.cloud_outlined, "Cloud\nComputing", lightGrey, navyBlue),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Widget untuk Kartu Utama (Besar)
  Widget _buildMainCard({required String title, required String desc, required IconData icon, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 180,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 35),
            const Spacer(),
            Text(title, style: AppTheme.cardTitle(fontSize: 22, color: Colors.white)),
            const SizedBox(height: 5),
            Text(desc, style: AppTheme.body(color: Colors.white70, fontSize: 14)),
            const Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.arrow_forward, color: Colors.white70, size: 28),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk Kartu Kecil (Grid di bawah)
  Widget _buildSmallCard(IconData icon, String label, Color bgColor, Color iconColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: AppTheme.label(color: iconColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}