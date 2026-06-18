import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/enroll_provider.dart';
import 'level1.dart';
import 'level2.dart';
import 'level3.dart';
import '../../widgets/keris_app_bar.dart';

class RoadmapPage extends ConsumerWidget {
  const RoadmapPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = ref.watch(selectedTrackProvider);

    String titleDesc = "Mulai perjalanan karir Web Development Anda. Sesuaikan intensitas belajar dengan pengalaman yang Anda miliki saat ini.";
    List<Map<String, dynamic>> levels = [
      {
        "color": const Color(0xFF3B82F6),
        "title": "Level 1: Beginner Web",
        "desc": "Landasan fundamental pengembangan web. Anda akan menguasai struktur HTML, estetika CSS modern, dan logika dasar JavaScript.",
        "bullets": ["HTML5 & CSS Layouting", "Modern Web Semantics", "JS Syntax Fundamentals"],
        "image": 'assets/image/Roadmap_level_1.png',
      },
      {
        "color": const Color(0xFFF59E0B),
        "title": "Level 2: Professional Web",
        "desc": "Membangun aplikasi web interaktif yang dinamis. Fokus pada React Ecosystem, manajemen state, dan integrasi API pihak ketiga.",
        "bullets": ["React, JS Hooks & Context", "Tailwind CSS Mastery", "REST API Integration"],
        "image": 'assets/image/Roadmap_level_2.png',
      },
      {
        "color": const Color(0xFFEF4444),
        "title": "Level 3: Expert Web",
        "desc": "Arsitektur skala enterprise. Mempelajari Next.js, Serverless Functions, Testing, dan optimasi performa web tingkat lanjut.",
        "bullets": ["Next.js SSR & ISR", "Automated Testing (Cypress)", "CI/CD & Cloud Deployment"],
        "image": 'assets/image/Roadmap_level_3.png',
      }
    ];

    if (track == 'Mobile Development') {
      titleDesc = "Mulai perjalanan karir Mobile Development Anda. Menguasai pembuatan aplikasi lintas platform dari satu codebase.";
      levels = [
        {
          "color": const Color(0xFF3B82F6),
          "title": "Level 1: Beginner Mobile",
          "desc": "Landasan fundamental pengembangan mobile dengan Dart. Anda akan menguasai sintaks dasar, UI komponen Flutter, dan state sederhana.",
          "bullets": ["Dart Syntax Fundamentals", "Flutter UI Widgets", "Stateless & Stateful"],
          "image": 'assets/image/Roadmap_level_1.png',
        },
        {
          "color": const Color(0xFFF59E0B),
          "title": "Level 2: Professional Mobile",
          "desc": "Membangun aplikasi mobile interaktif. Fokus pada state management Riverpod, navigasi kompleks, dan integrasi API.",
          "bullets": ["Riverpod State Management", "GoRouter Navigation", "REST API & JSON Parsing"],
          "image": 'assets/image/Roadmap_level_2.png',
        },
        {
          "color": const Color(0xFFEF4444),
          "title": "Level 3: Expert Mobile",
          "desc": "Arsitektur skala enterprise. Mempelajari pemrosesan background, akses native platform (kamera/GPS), dan rilis ke App Store/Play Store.",
          "bullets": ["Native Platform Channels", "Clean Architecture", "App Deployment & CI/CD"],
          "image": 'assets/image/Roadmap_level_3.png',
        }
      ];
    } else if (track == 'Artificial Intelligence') {
      titleDesc = "Mulai perjalanan karir Artificial Intelligence Anda. Belajar memproses data hingga melatih model Machine Learning.";
      levels = [
        {
          "color": const Color(0xFF3B82F6),
          "title": "Level 1: Beginner AI",
          "desc": "Landasan fundamental Data Science. Menguasai sintaks dasar Python dan penggunaan library analisis data dasar.",
          "bullets": ["Python Fundamentals", "Pandas Data Manipulation", "Data Visualization (Matplotlib)"],
          "image": 'assets/image/Roadmap_level_1.png',
        },
        {
          "color": const Color(0xFFF59E0B),
          "title": "Level 2: Professional AI",
          "desc": "Algoritma Machine Learning. Fokus pada melatih model prediksi, regresi, dan klasifikasi menggunakan Scikit-Learn.",
          "bullets": ["Supervised Learning", "Unsupervised Learning", "Model Evaluation & Tuning"],
          "image": 'assets/image/Roadmap_level_2.png',
        },
        {
          "color": const Color(0xFFEF4444),
          "title": "Level 3: Expert AI",
          "desc": "Deep Learning dan NLP. Mempelajari jaringan saraf tiruan, pemrosesan citra, dan pemrosesan bahasa alami dengan TensorFlow.",
          "bullets": ["Neural Networks Basics", "Computer Vision (CNN)", "Natural Language Processing (NLP)"],
          "image": 'assets/image/Roadmap_level_3.png',
        }
      ];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const KerisAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              "$track Roadmap",
              style: AppTheme.pageTitle(fontSize: 26),
            ),
            const SizedBox(height: 8),
            Text(
              titleDesc,
              style: AppTheme.body(fontSize: 14),
            ),
            const SizedBox(height: 30),

            ...levels.asMap().entries.map((entry) {
              int index = entry.key;
              var lvl = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _buildLevelCard(
                  context: context,
                  levelNumber: index + 1,
                  levelColor: lvl['color'],
                  title: lvl['title'],
                  description: lvl['desc'],
                  bulletPoints: List<String>.from(lvl['bullets']),
                  bulletColor: lvl['color'],
                  imagePath: lvl['image'],
                ),
              );
            }),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelCard({
    required BuildContext context,
    required int levelNumber,
    required Color levelColor,
    required String title,
    required String description,
    required List<String> bulletPoints,
    required Color bulletColor,
    required String imagePath,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.sectionTitle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: AppTheme.body(fontSize: 13),
                ),
                const SizedBox(height: 16),
                ...bulletPoints.map(
                  (point) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: bulletColor.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            size: 12,
                            color: bulletColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            point,
                            style: AppTheme.body(fontSize: 13, color: const Color(0xFF374151)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Widget targetPage;
                      if (levelNumber == 1) {
                        targetPage = const Level1Page();
                      } else if (levelNumber == 2) {
                        targetPage = const Level2Page();
                      } else {
                        targetPage = const Level3Page();
                      }

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => targetPage),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE5E7EB), width: 1.5),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(
                      "Lihat Roadmap",
                      style: AppTheme.button(color: AppTheme.primaryBlue, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}