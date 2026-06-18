import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../../core/widgets/custom_app_bar.dart';
//import '../../core/widgets/custom_bottom_navbar.dart';
import '../data/community_dummy_data.dart';
import '../widgets/answer_input_card.dart';
import '../widgets/forum_comment_card.dart';
import '../widgets/forum_stat_card.dart';

class ForumDetailPage extends StatelessWidget {
  const ForumDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final post = communityForumPosts.first;

    return Scaffold(
      backgroundColor: AppTheme.background,
      //bottomNavigationBar: const CustomBottomNavbar(currentIndex: 3),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(
              title: 'Cara deploy aplikasi...',
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 28, 18, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFD9C5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'BACKEND',
                            style: AppTheme.label(
                              fontSize: 9,
                              color: AppTheme.headingNavy,
                            ).copyWith(
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Ditanyakan 2 jam yang lalu',
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.body(fontSize: 12).copyWith(
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    Text(
                      'Cara deploy aplikasi\nReact',
                      style: AppTheme.pageTitle(fontSize: 34).copyWith(
                        height: 1.18,
                        letterSpacing: -0.75,
                      ),
                    ),

                    const SizedBox(height: 18),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.whiteCard,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x07000000),
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(22),
                            child: Container(
                              width: 42,
                              height: 42,
                              color: AppTheme.headingNavy,
                              child: Image.asset(
                                'assets/image/farhan_kebab.png',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 22,
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Farhan Kebab',
                                  style: AppTheme.cardTitle(
                                    fontSize: 14,
                                  ).copyWith(
                                    height: 1.15,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Web Development • Beginner',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.body(fontSize: 12)
                                      .copyWith(
                                    height: 1.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    ForumStatCard(
                      number: '${post.replies}',
                      label: 'JAWABAN',
                      isDark: true,
                    ),

                    const SizedBox(height: 12),

                    ForumStatCard(
                      number: '${post.views}',
                      label: 'DILIHAT',
                      isDark: false,
                    ),

                    const SizedBox(height: 26),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(20, 26, 20, 20),
                      decoration: BoxDecoration(
                        color: AppTheme.whiteCard,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x07000000),
                            blurRadius: 12,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo teman-teman, saya baru\nsaja menyelesaikan proyek React\npertama saya. Saya bingung\nbagaimana cara menampilkannya\nsecara online agar bisa diakses\norang lain. Apakah ada platform\nyang gratis dan mudah digunakan\nuntuk pemula?',
                            style: AppTheme.body(fontSize: 15.5).copyWith(
                              height: 1.55,
                            ),
                          ),

                          const SizedBox(height: 20),

                          Row(
                            children: [
                              const Icon(
                                Icons.thumb_up_alt_outlined,
                                size: 17,
                                color: AppTheme.headingNavy,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Bantu Up (14)',
                                style: AppTheme.button(
                                  fontSize: 12,
                                  color: AppTheme.headingNavy,
                                ),
                              ),
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.share_outlined,
                                size: 17,
                                color: AppTheme.headingNavy,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'Bagikan',
                                style: AppTheme.button(
                                  fontSize: 12,
                                  color: AppTheme.headingNavy,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    Row(
                      children: [
                        Text(
                          'Diskusi (3)',
                          style: AppTheme.sectionTitle(fontSize: 20),
                        ),
                        const Spacer(),
                        Text(
                          'Terpopuler',
                          style: AppTheme.button(
                            fontSize: 12,
                            color: AppTheme.categoryBrown,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.categoryBrown,
                          size: 16,
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    ...List.generate(forumComments.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: ForumCommentCard(
                          comment: forumComments[index],
                        ),
                      );
                    }),

                    const SizedBox(height: 8),

                    const AnswerInputCard(),
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


