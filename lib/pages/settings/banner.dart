import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import '../../providers/user_provider.dart'; 
import '../../core/theme/app_theme.dart';

class BannerPage extends ConsumerWidget { // Diubah menjadi ConsumerWidget
  const BannerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // Menambahkan WidgetRef
    // Anda bisa memantau data user jika ingin menyesuaikan status 'Locked' secara otomatis
    //final user = ref.watch(userProvider); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Banner',
          style: AppTheme.sectionTitle(color: AppTheme.primaryBlue, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PENCAPAIAN\nDIGITAL.',
              style: AppTheme.pageTitle(fontSize: 32),
            ),
            const SizedBox(height: 16),
            Text(
              'Kurasi eksklusif lencana dan banner pencapaian akademis Anda. Setiap elemen mewakili dedikasi, keahlian, dan pengakuan formal dari kurikulum KERIS.',
              style: AppTheme.body(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            _buildSectionTitle('Sistem Verified'),
            const SizedBox(height: 16),

            // PEMANGGILAN CARD (Desain Tetap Sama)[cite: 8]
            _buildAchievementCard(
              'Web Beginner',
              'LEVEL 1',
              'VERIFIED',
              'assets/image/banner_begin.png',
              const Color(0xFFE3F2FD),
              isLocked: false,
            ),
            _buildAchievementCard(
              'Web Professional',
              'LEVEL 2',
              'VERIFIED',
              'assets/image/banner_prof.png',
              const Color(0xFFE3F2FD),
              isLocked: false,
            ),
            _buildAchievementCard(
              'Web Expert',
              'LEVEL 3',
              'LOCKED',
              'assets/image/banner_expert.png',
              Colors.grey[200]!,
              isLocked: true,
            ),

            const SizedBox(height: 32),
            _buildSectionTitle('Mentor Verified'),
            const SizedBox(height: 16),
            _buildAchievementCard(
              'Web Signature Beginner',
              'LEVEL 1',
              'VERIFIED',
              'assets/image/web_sig.png',
              const Color(0xFFF3E5F5),
              isLocked: false,
            ),
            _buildAchievementCard(
              'Web Signature Professional',
              'LEVEL 2',
              'VERIFIED',
              'assets/image/web_sig_prof.png',
              const Color(0xFFF3E5F5),
              isLocked: false,
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGET HELPERS (Desain 100% Sesuai Source) ---[cite: 8]

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.sectionTitle(fontSize: 18, color: AppTheme.primaryBlue),
        ),
        const SizedBox(height: 4),
        Container(width: 40, height: 3, color: AppTheme.primaryOrange),
      ],
    );
  }

  Widget _buildAchievementCard(
    String title,
    String level,
    String status,
    String imagePath,
    Color bgColor, {
    bool isLocked = false,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Opacity(
            opacity: isLocked ? 0.4 : 1.0,
            child: Container(
              height: 80,
              width: 180,
              decoration: BoxDecoration(
                color: isLocked ? Colors.grey[300] : bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.workspace_premium,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            level,
            style: AppTheme.label(fontSize: 10, color: Colors.grey[500]),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTheme.sectionTitle(fontSize: 16, color: AppTheme.primaryBlue),
          ),
          const SizedBox(height: 12),
          isLocked
              ? const Icon(Icons.lock_outline, color: Colors.grey, size: 20)
              : Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8EFFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: AppTheme.label(fontSize: 10, color: AppTheme.primaryBlue),
                  ),
                ),
        ],
      ),
    );
  }
}