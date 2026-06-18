import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupQuest extends StatelessWidget {
  final bool isCorrect;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;

  const PopupQuest({
    super.key,
    required this.isCorrect,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: const Offset(0.0, 4.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Agar dialog menyesuaikan isi
        children: <Widget>[
          // Ilustrasi Status (Check/Cancel)
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Icon(
                isCorrect ? Icons.check_circle : Icons.cancel,
                color: isCorrect ? const Color(0xFF22C55E) : const Color(0xFFEF4444),
                size: 100,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          
          // Judul Popup
          Text(
            isCorrect ? 'Luar Biasa,\nJawaban Kamu\nBenar!' : 'Oops, Jawaban\nKurang Tepat!',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF0D285F),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16.0),
          
          // Deskripsi[cite: 10]
          Text(
            isCorrect 
                ? 'Kamu berhasil menyelesaikan tantangan ini. Klik tombol di bawah untuk membuka Clue Card rahasia kamu.'
                : 'Jangan menyerah! Coba pelajari kembali dokumentasi atau gunakan petunjuk lain untuk membantu kamu.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13.0,
              color: const Color(0xFF6B7280),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32.0),
          
          // Tombol Utama (Buka Clue Card / Coba Lagi)[cite: 10]
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPrimaryButtonPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF47B20),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isCorrect) ...[
                    const Icon(Icons.lock_outline, color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    isCorrect ? 'Buka Clue Card' : 'Coba Lagi',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Tombol Sekunder (Kembali ke Halaman Utama)[cite: 10]
          if (!isCorrect) ...[
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: onSecondaryButtonPressed ?? () => Navigator.of(context).pop(),
              child: Text(
                'Kembali ke Halaman Utama',
                style: GoogleFonts.poppins(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0D285F),
                ),
              ),
            ),
          ] else ...[
             const SizedBox(height: 8.0),
          ]
        ],
      ),
    );
  }
}