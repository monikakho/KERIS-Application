import 'package:flutter/material.dart';

class WebOnlyDialog extends StatelessWidget {
  final String featureName;

  const WebOnlyDialog({super.key, required this.featureName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon Lingkaran Laptop/Devices
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.devices, color: Colors.orange, size: 40),
            ),
            const SizedBox(height: 25),

            // Judul
            Text(
              "$featureName hanya\nbisa dibuka melalui web.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D285F),
              ),
            ),
            const SizedBox(height: 15),

            // Deskripsi
            const Text(
              "Silakan lanjutkan akses dari browser untuk melihat fitur ini.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 30),

            // Tombol Utama
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.open_in_new, color: Colors.white, size: 18),
                label: const Text("Buka di Browser", 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),

            // Tombol Kembali
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali", style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}