import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../providers/enroll_provider.dart';
import 'learning_page.dart';
import 'main_roadmap.dart';
import 'main_gamified.dart';
import '../../widgets/web_only_dialog.dart';
import '../../widgets/keris_app_bar.dart';

class RuangBelajarPage extends ConsumerWidget {
  const RuangBelajarPage({super.key});

  void _openWebDialog(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (context) => WebOnlyDialog(featureName: name),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTrack = ref.watch(selectedTrackProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const KerisAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "RUANG BELAJAR",
              style: AppTheme.label(color: AppTheme.primaryOrange, fontSize: 12),
            ),
            const SizedBox(height: 8),
            Text(
              "Tentukan\nMasa Depanmu.",
              style: AppTheme.pageTitle(fontSize: 32),
            ),
            const SizedBox(height: 30),

            // 1. Kartu IT Roadmap
            _buildMenuCard(
              title: "$selectedTrack Roadmap",
              subtitle: "Peta jalan komprehensif dari dasar hingga mahir",
              icon: Icons.alt_route,
              color: AppTheme.primaryBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoadmapPage()),
                );
              },
            ),

            // 2. Kartu Gamified Quest[cite: 7]
            _buildMenuCard(
              title: "Gamified Quest",
              subtitle: "Tantangan interaktif untuk pengalaman belajar yang seru.",
              icon: Icons.military_tech,
              color: AppTheme.primaryOrange,
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => const MainGamifiedPage()),
                );
              },
            ),

            // 3. KARTU LEARNING MODULES[cite: 7]
            _buildMenuCard(
              title: "Learning Modules",
              subtitle: "Temukan Skill IT mu!",
              icon: Icons.menu_book,
              color: AppTheme.primaryBlue,
              onTap: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(builder: (context) => const LearningPage()),
                );
              },
            ),

            // 4. Kartu Project Dashboard (Web Only)[cite: 7]
            _buildMenuCard(
              title: "Project Dashboard",
              subtitle: "Kelola portofolio dan progres proyek mandiri Anda.",
              icon: Icons.explore,
              color: AppTheme.primaryOrange,
              onTap: () => _openWebDialog(context, "Project Dashboard"),
            ),

            // 5. Kartu Project Submission (Web Only)[cite: 7]
            _buildMenuCard(
              title: "Project Submission",
              subtitle: "Kumpulkan hasil karya Anda",
              icon: Icons.assignment_turned_in,
              color: AppTheme.primaryBlue,
              onTap: () => _openWebDialog(context, "Project Submission"),
            ),
          ],
        ),
      ),
      // bottomNavigationBar dihapus karena sudah dihandle oleh MainNavigation
    );
  }

  Widget _buildMenuCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 40),
            Text(
              title,
              style: AppTheme.cardTitle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: AppTheme.body(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}