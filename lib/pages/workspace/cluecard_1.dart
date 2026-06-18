import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ClueCard1Page extends StatelessWidget {
  const ClueCard1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0D285F)),
          onPressed: () => Navigator.of(context).pop(), // Kembali secara normal
        ),
        title: Text(
          "Tantangan 1",
          style: AppTheme.sectionTitle(fontSize: 18),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "KUIS SELESAI",
              style: AppTheme.label(fontSize: 12, color: AppTheme.primaryOrange),
            ),
            const SizedBox(height: 10),
            Text(
              "Selamat! Kamu\nMendapat Petunjuk\nBaru",
              textAlign: TextAlign.center,
              style: AppTheme.pageTitle(fontSize: 32),
            ),
            const SizedBox(height: 28),

            // CARD PETUNJUK
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 48, height: 48,
                        decoration: const BoxDecoration(color: Color(0xFF1E293B), shape: BoxShape.circle),
                        child: const Icon(Icons.terminal, color: Colors.white, size: 24),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("TYPE: TECHNICAL", style: AppTheme.label(fontSize: 11, color: const Color(0xFF9CA3AF))),
                          const SizedBox(height: 2),
                          Text("Level 02", style: AppTheme.sectionTitle(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // KODE UNLOCK
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8F0),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFFFE4CC)),
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontFamily: 'monospace', fontSize: 15, height: 1.8),
                        children: [
                          TextSpan(text: '<div class="hidden-\n    path">', style: TextStyle(color: Color(0xFFEA580C))),
                          TextSpan(text: '\n  Unlock_Key: ', style: TextStyle(color: Color(0xFF374151))),
                          TextSpan(text: 'KR-\n    2024', style: TextStyle(color: Color(0xFF0D285F), fontWeight: FontWeight.bold)),
                          TextSpan(text: '\n</div>', style: TextStyle(color: Color(0xFFEA580C))),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text("Petunjuk Digital", style: AppTheme.sectionTitle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text(
                    "Gunakan fragmen kode di atas pada terminal di halaman Ruang Belajar untuk membuka akses ke modul eksklusif.",
                    style: AppTheme.body(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // TOMBOL KEMBALI
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(), // Kembali ke halaman Quest
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF47B20),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: Text("Kembali ke Quest", style: AppTheme.button(color: Colors.white, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      // bottomNavigationBar dihapus karena menyebabkan looping navigasi
    );
  }
}