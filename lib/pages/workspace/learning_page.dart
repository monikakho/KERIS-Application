import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/module_provider.dart';
import '../../models/module_model.dart';
import 'detail_page.dart';
import '../../widgets/keris_app_bar.dart';
import '../../core/theme/app_theme.dart';

class LearningPage extends ConsumerWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mendapatkan data modul dari Riverpod Provider
    final modules = ref.watch(moduleProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: const KerisAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "KURIKULUM AKADEMIK",
              style: AppTheme.label(fontSize: 12, color: AppTheme.primaryOrange),
            ),
            const SizedBox(height: 8),
            Text(
              "Modul Pembelajaran",
              style: AppTheme.pageTitle(fontSize: 28),
            ),
            const SizedBox(height: 20),
            _buildStatsCards(),
            const SizedBox(height: 25),

            // Render semua modul secara otomatis menggunakan data dari Riverpod[cite: 7]
            ...modules.map((m) => _buildModuleCard(context, m)).toList(),

            const SizedBox(height: 15),
          ],
        ),
      ),
      // bottomNavigationBar dihapus untuk menghentikan Infinite Loop[cite: 7]
    );
  }

  Widget _buildStatsCards() {
    return Row(
      children: [
        _statBox("15", "SELESAI", const Color(0xFFF4F6F8), Colors.orange),
        const SizedBox(width: 15),
        _statBox(
          "10",
          "TERSISA",
          const Color(0xFF0D285F),
          Colors.white,
          isDark: true,
        ),
      ],
    );
  }

  Widget _statBox(String val, String label, Color bg, Color textCol, {bool isDark = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: isDark ? null : Border(left: BorderSide(color: textCol, width: 4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              val,
              style: AppTheme.pageTitle(fontSize: 22).copyWith(color: isDark ? Colors.white : AppTheme.primaryBlue),
            ),
            Text(
              label,
              style: AppTheme.label(fontSize: 10, color: isDark ? Colors.white70 : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(BuildContext context, Module module) {
    bool isSelesai = module.status == ModuleStatus.selesai;
    bool isProgress = module.status == ModuleStatus.sedangBerjalan;
    bool isBelumMulai = module.status == ModuleStatus.belumMulai;
    bool isPdf = module.type == ModuleType.pdf;

    return InkWell(
      // Menggunakan rootNavigator: true agar DetailPage menutupi seluruh layar[cite: 7]
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => DetailPage(module: module)),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isProgress ? const Color(0xFF031E51) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isBelumMulai ? Border.all(color: Colors.grey.shade200) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isBelumMulai)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: isProgress ? Colors.white.withOpacity(0.1) : const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isProgress ? "● SEDANG BERJALAN" : "SELESAI",
                      style: AppTheme.label(fontSize: 10, color: isProgress ? Colors.orange : Colors.green),
                    ),
                  ),
                  if (isSelesai) const Icon(Icons.check_circle, color: Colors.green, size: 20),
                ],
              ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isProgress ? Colors.white.withOpacity(0.1) : (isPdf ? const Color(0xFFFFE5E5) : const Color(0xFFE3F2FD)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isPdf ? Icons.picture_as_pdf : Icons.play_circle_outline,
                    color: isProgress ? Colors.orange : (isPdf ? Colors.red : Colors.blue),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module.title,
                        style: AppTheme.sectionTitle(fontSize: 18, color: isProgress ? Colors.white : AppTheme.primaryBlue),
                      ),
                      Text(
                        isPdf ? "Dokumentasi PDF" : module.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis, // Mencegah overflow pada teks deskripsi
                        style: AppTheme.body(fontSize: 13, color: isProgress ? Colors.white70 : Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isProgress) ...[
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: module.progress / 100,
                color: Colors.orange,
                backgroundColor: Colors.white12,
              ),
            ],
          ],
        ),
      ),
    );
  }
}