import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/enroll_provider.dart';
import 'cluecard_1.dart';
import 'quest_2.dart';
import '../../core/theme/app_theme.dart';

class MainGamifiedPage extends ConsumerWidget {
  const MainGamifiedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final track = ref.watch(selectedTrackProvider);

    List<Map<String, String>> quests = [
      {"title": "Fundamental HTML", "desc": "Membangun struktur semantik web."},
      {"title": "Styling Dasar", "desc": "Eksplorasi layout dengan CSS."},
      {"title": "Manipulasi DOM", "desc": "Membuat web interaktif dengan JavaScript."},
      {"title": "Integrasi API", "desc": "Menghubungkan frontend ke backend."},
    ];

    if (track == 'Mobile Development') {
      quests = [
        {"title": "Fundamental Dart", "desc": "Sintaks dasar dan konsep OOP di Dart."},
        {"title": "Widget & Layout", "desc": "Membangun tampilan aplikasi dengan Flutter."},
        {"title": "State & Navigasi", "desc": "Berpindah halaman dan manajemen state dasar."},
        {"title": "HTTP & API", "desc": "Mengambil data dari server REST."},
      ];
    } else if (track == 'Artificial Intelligence') {
      quests = [
        {"title": "Python Basics", "desc": "Sintaks dasar Python untuk Data Science."},
        {"title": "Data Wrangling", "desc": "Eksplorasi dataset menggunakan Pandas."},
        {"title": "Data Visualization", "desc": "Membuat grafik dengan Matplotlib."},
        {"title": "Model Training", "desc": "Melatih model Machine Learning sederhana."},
      ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0D285F)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "$track Quest",
          style: AppTheme.sectionTitle(fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Color(0xFF0D285F)),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DASHBOARD BELAJAR",
              style: AppTheme.label(fontSize: 12, color: AppTheme.primaryOrange),
            ),
            const SizedBox(height: 8),
            Text(
              "Halo, Farhan!\nLanjutkan\nPetualanganmu.",
              style: AppTheme.pageTitle(fontSize: 36),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    Icons.local_fire_department,
                    "12",
                    "STREAK",
                    const Color(0xFFEA580C),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    Icons.lightbulb,
                    "5",
                    "PETUNJUK",
                    const Color(0xFF0D285F),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            _buildTantanganSelesai(context, "Tantangan 1", quests[0]['title']!, quests[0]['desc']!),
            const SizedBox(height: 16),

            _buildTantanganBerjalan(context, "Tantangan 2", quests[1]['title']!, quests[1]['desc']!),
            const SizedBox(height: 16),

            _buildTantanganTersedia("Tantangan 3", quests[2]['title']!, quests[2]['desc']!),
            const SizedBox(height: 16),

            _buildTantanganTerkunci("Tantangan 4", quests[3]['title']!, quests[3]['desc']!),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label, Color color) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                Icon(icon, color: color, size: 32),
                const SizedBox(height: 4),
                Text(value, style: AppTheme.pageTitle(fontSize: 32)),
                const SizedBox(height: 4),
                Text(label, style: AppTheme.label(fontSize: 10, color: const Color(0xFF64748B))),
              ],
            ),
          ),
          Container(height: 5, decoration: BoxDecoration(color: color, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)))),
        ],
      ),
    );
  }

  Widget _buildTantanganSelesai(BuildContext context, String qNum, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10, offset: const Offset(0, 2))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(children: [Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 16), SizedBox(width: 6), Text("SELESAI", style: TextStyle(color: Color(0xFF22C55E), fontWeight: FontWeight.bold, fontSize: 11))]),
              Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFFF0F4FF), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.history_edu, color: Color(0xFF0D285F), size: 20)),
            ],
          ),
          const SizedBox(height: 12),
          Text(qNum, style: AppTheme.sectionTitle(fontSize: 20)),
          const SizedBox(height: 6),
          Text("$title: $desc", style: AppTheme.body(fontSize: 13, color: const Color(0xFF6B7280))),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const ClueCard1Page())),
              style: OutlinedButton.styleFrom(backgroundColor: const Color(0xFFF0F4FF), side: const BorderSide(color: Color(0xFFD1D5DB)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(vertical: 18)),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Lihat Petunjuk", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0D285F))), SizedBox(width: 6), Icon(Icons.visibility_outlined, size: 16, color: Color(0xFF0D285F))]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTantanganBerjalan(BuildContext context, String qNum, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(gradient: const LinearGradient(colors: [Color(0xFFFFF7ED), Color(0xFFFFFBF5)]), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xFFFED7AA))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xFFEA580C), shape: BoxShape.circle)), const SizedBox(width: 6), const Text("SEDANG BERJALAN", style: TextStyle(color: Color(0xFFEA580C), fontWeight: FontWeight.bold, fontSize: 11))]),
              Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFFFEE2CC), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.person, color: Color(0xFFEA580C), size: 20)),
            ],
          ),
          const SizedBox(height: 12),
          Text(qNum, style: AppTheme.sectionTitle(fontSize: 20)),
          const SizedBox(height: 6),
          Text("$title: $desc", style: AppTheme.body(fontSize: 13, color: const Color(0xFF6B7280))),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(builder: (context) => const Quest2Page())),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEA580C), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), padding: const EdgeInsets.symmetric(vertical: 18), elevation: 0),
              child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Lanjut", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)), SizedBox(width: 6), Icon(Icons.chevron_right, size: 20, color: Colors.white)]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTantanganTersedia(String qNum, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(children: [Icon(Icons.grid_view_rounded, color: Color(0xFF9CA3AF), size: 14), SizedBox(width: 6), Text("TERSEDIA", style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.bold, fontSize: 11))]),
              Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.auto_fix_high, color: Color(0xFF6B7280), size: 20)),
            ],
          ),
          const SizedBox(height: 12),
          Text(qNum, style: AppTheme.sectionTitle(fontSize: 20)),
          const SizedBox(height: 6),
          Text("$title: $desc", style: AppTheme.body(fontSize: 13, color: const Color(0xFF6B7280))),
          const SizedBox(height: 16),
          Center(child: OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFFD1D5DB)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18)), child: const Text("Lihat Petunjuk", style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0D285F))))),
        ],
      ),
    );
  }

  Widget _buildTantanganTerkunci(String qNum, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(children: [Icon(Icons.lock_outline, color: Color(0xFF9CA3AF), size: 14), SizedBox(width: 6), Text("TERKUNCI", style: TextStyle(color: Color(0xFF9CA3AF), fontWeight: FontWeight.bold, fontSize: 11))]),
              Container(width: 36, height: 36, decoration: BoxDecoration(color: const Color(0xFFE5E7EB), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.lock, color: Color(0xFF9CA3AF), size: 20)),
            ],
          ),
          const SizedBox(height: 12),
          Text(qNum, style: AppTheme.sectionTitle(fontSize: 20, color: const Color(0xFF9CA3AF))),
          const SizedBox(height: 6),
          Text("$title: $desc", style: AppTheme.body(fontSize: 13, color: const Color(0xFFB0B5BF))),
          const SizedBox(height: 16),
          const Center(child: Text("Selesaikan Tantangan Sebelumnya", style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)))),
        ],
      ),
    );
  }
}