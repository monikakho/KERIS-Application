import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/theme/app_theme.dart';
import '../models/program_model.dart';
import '../providers/enroll_provider.dart';
import 'explore/ai_talent_scout.dart';
import 'home/program_detail_page.dart';
import 'workspace/main_roadmap.dart';
import 'workspace/input_kode.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // Warna mengikuti AppTheme
  Color get primaryBlue => AppTheme.primaryBlue;
  Color get accentOrange => AppTheme.primaryOrange;
  Color get bgLight => AppTheme.background;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: bgLight,
      appBar: _buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          _buildSkillDashboard(), // Sekarang berbentuk Lingkaran
          const SizedBox(height: 25),
          _buildSkillBar("FRONTEND", 0.95, "95%"),
          _buildSkillBar("BACKEND", 0.88, "88%"),
          _buildSkillBar("DESAIN", 1.0, "100%", isOrange: true),
          const SizedBox(height: 30),
          _buildSectionTitle("Proyek Saat Ini", Icons.rocket_launch),
          const SizedBox(height: 15),
          _buildProjectCard("assets/image/home_proyek.png"),
          const SizedBox(height: 30),
          Text(
            "Aksi Cepat",
            style: AppTheme.sectionTitle(fontSize: 18),
          ),
          const SizedBox(height: 15),
          // Aksi Cepat yang sudah diperbesar
          _buildQuickAction(
            Icons.search,
            "AI Talent Scout",
            "Temukan kecocokan skill",
            accentOrange,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AiTalentScoutPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildQuickAction(
            Icons.map_outlined,
            "IT Roadmap",
            "Jalur menuju penguasaan",
            primaryBlue,
            () {
              final isEnrolled = ref.read(isEnrolledProvider);
              if (isEnrolled) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RoadmapPage()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputKodePage(),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 30),
          _buildProgramItem(context, ProgramModel.webDevelopment),
          const SizedBox(height: 15),
          _buildProgramItem(context, ProgramModel.artificialIntelligence),
          const SizedBox(height: 15),
          _buildProgramItem(context, ProgramModel.mobileDevelopment),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // --- COMPONENT: APPBAR ---
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 22,
            backgroundColor: Color(0xFFE0E0E0),
            backgroundImage: const AssetImage('assets/image/farhan_kebab.png'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Halo! Farhan",
                style: AppTheme.sectionTitle(fontSize: 16),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: accentOrange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "PRO",
                      style: AppTheme.label(fontSize: 9, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "KERIS Profesional",
                    style: AppTheme.body(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_outlined, color: primaryBlue),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  // --- COMPONENT: SKILL DASHBOARD (Updated to Circle) ---
  Widget _buildSkillDashboard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // 1. Lingkaran Progres (Sekarang di paling atas)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 12,
                  backgroundColor: Colors.white10,
                  valueColor: AlwaysStoppedAnimation<Color>(accentOrange),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "100%",
                    style: AppTheme.pageTitle(fontSize: 32).copyWith(color: Colors.white),
                  ),
                  Text(
                    "TERCAPAI",
                    style: AppTheme.label(fontSize: 10, color: Colors.white.withOpacity(0.7)),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 25,
          ), // Jarak antara lingkaran dan teks di bawahnya
          // 2. Judul Dashboard (Sekarang di bawah sesuai permintaan)
          Text(
            "Skill Dashboard",
            style: AppTheme.sectionTitle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // --- HELPER WIDGETS ---
  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: accentOrange, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTheme.sectionTitle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _buildSkillBar(
    String title,
    double val,
    String percent, {
    bool isOrange = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheme.label(fontSize: 11, color: primaryBlue),
              ),
              Text(
                percent,
                style: AppTheme.label(fontSize: 11, color: isOrange ? accentOrange : primaryBlue),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: val,
              color: isOrange ? accentOrange : primaryBlue,
              backgroundColor: const Color(0xFFE0E0E0),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  // UPDATED: Quick Action diperbesar agar tidak pipih
  Widget _buildQuickAction(
    IconData icon,
    String title,
    String sub,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 90,
        ), // Memaksa tinggi minimal agar tidak pipih
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTheme.sectionTitle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sub,
                    style: AppTheme.body(fontSize: 12, color: Colors.white70),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(String imgPath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                errorBuilder: (c, e, s) => Container(
                  color: Colors.grey[200],
                  child: const Icon(Icons.image, color: Colors.grey, size: 40),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "E-Learning Platform",
                      style: AppTheme.sectionTitle(fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "AKTIF",
                        style: AppTheme.label(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: 0.74,
                  color: accentOrange,
                  backgroundColor: const Color(0xFFF0F0F0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgramItem(BuildContext context, ProgramModel program) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProgramDetailPage(program: program),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFEEEEEE)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.asset(
                  program.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (c, e, s) => Container(
                    height: 150,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, color: Colors.grey, size: 40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    program.title,
                    style: AppTheme.sectionTitle(fontSize: 15),
                  ),
                  Icon(Icons.arrow_forward, color: program.accentColor, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
