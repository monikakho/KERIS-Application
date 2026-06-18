import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/module_model.dart';
import '../../providers/module_provider.dart';
import '../../core/theme/app_theme.dart';

class DetailPage extends ConsumerWidget {
  final Module module;
  const DetailPage({super.key, required this.module});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mengecek apakah tipe modul adalah PDF untuk penyesuaian UI
    bool isPdf = module.type == ModuleType.pdf;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () => Navigator.pop(context)
        ),
        title: Text(
          module.title, 
          style: AppTheme.sectionTitle(fontSize: 16)
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.notifications_none)
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER: Area Video Player atau Preview PDF
            Container(
              height: isPdf ? 350 : 200, // Ukuran disesuaikan dengan tipe konten
              width: double.infinity,
              decoration: BoxDecoration(
                color: isPdf ? const Color(0xFFD1D5DB) : Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(isPdf 
                    ? 'https://via.placeholder.com/300x400' // Placeholder untuk PDF[cite: 8]
                    : 'https://via.placeholder.com/400x200'), // Placeholder untuk Video[cite: 8]
                  fit: BoxFit.cover,
                  opacity: isPdf ? 1.0 : 0.7,
                ),
              ),
              child: Center(
                child: isPdf 
                  ? Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white, 
                        shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.picture_as_pdf, color: Colors.red, size: 40),
                    )
                  : const Icon(Icons.play_circle_fill, color: Colors.orange, size: 60),
              ),
            ),
            const SizedBox(height: 25),
            
            // Label Nomor Modul[cite: 8]
            Text(
              "MODUL FONDASI ${module.moduleNumber}", 
              style: AppTheme.label(fontSize: 12, color: AppTheme.primaryOrange)
            ),
            
            Text(
              "Gambaran Umum", 
              style: AppTheme.sectionTitle(fontSize: 24)
            ),
            const SizedBox(height: 10),

            // INFO LABEL: Tipe Materi dan Tanggal Update[cite: 8]
            Row(
              children: [
                Icon(
                  isPdf ? Icons.description_outlined : Icons.videocam_outlined, 
                  size: 16, 
                  color: Colors.grey
                ),
                const SizedBox(width: 5),
                Text(
                  isPdf ? "PDF Document" : "Video Tutorial", 
                  style: AppTheme.body(color: Colors.grey, fontSize: 12)
                ),
                const SizedBox(width: 15),
                const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
                const SizedBox(width: 5),
                Text("Update: April 2026", style: AppTheme.body(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 20),
            
            // Konten Teks Utama Modul[cite: 8]
            Text(
              module.fullContent,
              style: AppTheme.body(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 25),

            // TOMBOL DOWNLOAD: Hanya tampil jika tipe materi adalah PDF[cite: 8]
            if (isPdf) ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // Logika untuk download file PDF[cite: 8]
                  },
                  icon: const Icon(Icons.download, color: Colors.white),
                  label: Text(
                    "Download PDF", 
                    style: AppTheme.button(color: Colors.white)
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
            
            // INSIGHT CARD: Tampil jika data insight tersedia[cite: 8]
            if (module.insight.isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF031E51), 
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lightbulb, color: Colors.orange, size: 40),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Insight Utama", 
                            style: AppTheme.sectionTitle(fontSize: 14, color: Colors.white)
                          ),
                          const SizedBox(height: 5),
                          Text(
                            module.insight, 
                            style: AppTheme.body(color: Colors.white70, fontSize: 12)
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],

            // Bagian Materi Selanjutnya[cite: 8]
            Text(
              "MATERI SELANJUTNYA", 
              style: AppTheme.label(fontSize: 10, color: AppTheme.primaryBlue)
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FB),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: const Icon(Icons.description_outlined, color: Color(0xFF0D285F)),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          module.nextTitle, 
                          style: AppTheme.sectionTitle(fontSize: 14)
                        ),
                        Text(
                          module.nextSubtitle, 
                          style: AppTheme.body(fontSize: 11, color: Colors.grey)
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),

            // BUTTON SELESAIKAN MATERI: Terhubung ke Riverpod untuk update status[cite: 8]
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF031E51),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Menggunakan ref untuk memicu fungsi markAsComplete di notifier[cite: 8]
                  ref.read(moduleProvider.notifier).markAsComplete(module.id);
                  Navigator.pop(context); // Kembali ke halaman daftar modul[cite: 8]
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Selesaikan Materi", 
                      style: AppTheme.button(color: Colors.white)
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.check_circle_outline, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}