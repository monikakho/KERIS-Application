import 'package:flutter/material.dart';

class TimelineStep extends StatelessWidget {
  final int stepNumber;
  final bool isOrange;
  final String title;
  final String? subtitle;
  final String? streamingTitle;
  final String? streamingDesc;
  final IconData? iconTitle;
  final String? description;
  final String? buttonText;
  final List<String>? bulletPoints;
  final List<String>? tags;
  final String? extraLabel;
  final bool hasStatsCard;
  final bool hasStreamingCard;
  final bool hasDeployButton;
  final bool isLast;
  // Menambahkan callback opsional untuk tombol jika ingin digunakan nanti
  final VoidCallback? onButtonPressed;

  const TimelineStep({
    super.key,
    required this.stepNumber,
    required this.isOrange,
    required this.title,
    this.subtitle,
    this.streamingTitle,
    this.streamingDesc,
    this.iconTitle,
    this.description,
    this.bulletPoints,
    this.tags,
    this.extraLabel,
    this.buttonText,
    this.hasStatsCard = false,
    this.hasStreamingCard = false,
    this.hasDeployButton = false,
    required this.isLast,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Menentukan warna utama berdasarkan status isOrange[cite: 10]
    final Color circleColor = isOrange
        ? const Color(0xFFEA580C)
        : const Color(0xFF0D285F);
    final Color accentColor = isOrange
        ? const Color(0xFFEA580C)
        : const Color(0xFF0D285F);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kolom Timeline (Lingkaran Angka + Garis Vertikal)[cite: 10]
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: circleColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "$stepNumber",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                // Garis vertikal penghubung antar step[cite: 10]
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: const Color(0xFFE5E7EB)),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Kolom Konten (Card Utama)[cite: 10]
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label Status (Contoh: "SEDANG DIPELAJARI")[cite: 10]
                  if (extraLabel != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF47B20).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6, height: 6,
                            decoration: const BoxDecoration(color: Color(0xFFF47B20), shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            extraLabel!,
                            style: const TextStyle(
                              color: Color(0xFFF47B20),
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],

                  // Judul dan Icon[cite: 10]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFF0D285F),
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            height: 1.3,
                          ),
                        ),
                      ),
                      if (iconTitle != null)
                        Icon(iconTitle, color: accentColor, size: 20),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // Subtitle[cite: 10]
                  if (subtitle != null)
                    Text(
                      subtitle!,
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        letterSpacing: 1,
                      ),
                    ),
                  const SizedBox(height: 10),

                  // Deskripsi Teks[cite: 10]
                  if (description != null)
                    Text(
                      description!,
                      style: const TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),

                  // Daftar Poin (Bullet Points)[cite: 10]
                  if (bulletPoints != null) ...[
                    const SizedBox(height: 12),
                    ...bulletPoints!.map(
                      (point) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          children: [
                            Icon(Icons.circle, size: 6, color: accentColor.withOpacity(0.5)),
                            const SizedBox(width: 8),
                            Text(
                              point,
                              style: const TextStyle(color: Color(0xFF374151), fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],

                  // Kartu Statistik Audit (JWT/Auth)[cite: 10]
                  if (hasStatsCard) ...[
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7ED),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFFED7AA)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36, height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEA580C).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.security, color: Color(0xFFEA580C), size: 20),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Stateless Auth",
                                  style: TextStyle(color: Color(0xFF0D285F), fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                                const SizedBox(height: 2),
                                Text("JWT & Refresh Token Strategies", style: TextStyle(color: Colors.grey[500], fontSize: 11)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Kartu Streaming (GRPC/Streaming)[cite: 10]
                  if (hasStreamingCard) ...[
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D285F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            streamingTitle!,
                            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            streamingDesc!,
                            style: TextStyle(color: Colors.grey[300], fontSize: 14, height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Label Kategori (Tags)[cite: 10]
                  if (tags != null) ...[
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8, runSpacing: 8,
                      children: tags!.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF002366).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(color: Color(0xFF002366), fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                        );
                      }).toList(),
                    ),
                  ],

                  // Tombol Aksi (Deploy/Mulai)[cite: 10]
                  if (hasDeployButton) ...[
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onButtonPressed ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0D285F),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          elevation: 0,
                        ),
                        child: Text(
                          buttonText!,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}