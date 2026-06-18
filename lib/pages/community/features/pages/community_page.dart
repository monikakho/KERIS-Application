import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

//import '../../core/widgets/custom_bottom_navbar.dart';
import '../data/community_dummy_data.dart';
import '../widgets/community_feature_card.dart';
import '../widgets/forum_preview_card.dart';
import 'forum_detail_page.dart';
import 'study_hub_page.dart';
import '../../../../widgets/keris_app_bar.dart';
import '../../../../widgets/under_development_dialog.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const KerisAppBar(),
      //bottomNavigationBar: const CustomBottomNavbar(currentIndex: 3),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 18, 24, 92),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 18),

              Text(
                'Komunitas',
                style: AppTheme.pageTitle(fontSize: 36),
              ),

              const SizedBox(height: 8),

              Text(
                'Bangun koneksi, perluas wawasan, dan\ndiskusikan ide-ide brilian bersama kurator\ndan sesama pelajar.',
                style: AppTheme.body(fontSize: 13.5),
              ),

              const SizedBox(height: 38),

              CommunityFeatureCard(
                title: 'Study Hub',
                description:
                    'Ruang diskusi interaktif untuk\nmemecahkan masalah akademis\nsecara kolektif.',
                actionText: 'MULAI DISKUSI',
                actionIcon: Icons.arrow_forward,
                isPrimary: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const StudyHubPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              CommunityFeatureCard(
                title: 'Private Mentor\nSession',
                description:
                    'Sesi tatap wajah langsung dengan\nmentor ahli untuk bimbingan\npersonal.',
                actionText: 'JADWALKAN SESI',
                actionIcon: Icons.calendar_today_outlined,
                isPrimary: false,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const UnderDevelopmentDialog(
                      featureName: 'Private Mentor Session',
                    ),
                  );
                },
              ),

              const SizedBox(height: 50),

              Text(
                'Topik Forum Terbaru',
                style: AppTheme.sectionTitle(fontSize: 20),
              ),

              const SizedBox(height: 10),

              Container(
                width: 58,
                height: 3,
                color: AppTheme.divider,
              ),

              const SizedBox(height: 30),

              ...List.generate(communityForumPosts.length, (index) {
                final post = communityForumPosts[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 22),
                  child: ForumPreviewCard(
                    post: post,
                    onTap: index == 0
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const ForumDetailPage(),
                              ),
                            );
                          }
                        : null,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}



