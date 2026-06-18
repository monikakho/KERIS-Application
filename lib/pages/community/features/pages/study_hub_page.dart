import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../../core/widgets/custom_app_bar.dart';
//import '../../core/widgets/custom_bottom_navbar.dart';
import '../data/community_dummy_data.dart';
import '../widgets/study_hub_tabs.dart';
import '../widgets/study_post_card.dart';
import 'forum_detail_page.dart';

class StudyHubPage extends StatefulWidget {
  const StudyHubPage({super.key});

  @override
  State<StudyHubPage> createState() => _StudyHubPageState();
}

class _StudyHubPageState extends State<StudyHubPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final posts = selectedTab == 2
        ? [
            communityForumPosts[1],
            communityForumPosts[2],
            communityForumPosts[3],
            communityForumPosts[1],
            communityForumPosts[2],
            communityForumPosts[3],
          ]
        : communityForumPosts;

    return Scaffold(
      backgroundColor: AppTheme.background,
      //bottomNavigationBar: const CustomBottomNavbar(currentIndex: 3),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(
              title: 'Study Hub',
              onBack: () => Navigator.pop(context),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 34, 24, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Study Hub',
                      style: AppTheme.pageTitle(fontSize: 36),
                    ),

                    const SizedBox(height: 14),

                    Text(
                      'Temukan solusi, berbagi ilmu, dan\nberkolaborasi dengan sesama pelajar\ndi ekosistem KERIS.',
                      style: AppTheme.body(fontSize: 13.5),
                    ),

                    const SizedBox(height: 34),

                    StudyHubTabs(
                      selectedIndex: selectedTab,
                      onChanged: (index) {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                    ),

                    const SizedBox(height: 28),

                    ...List.generate(posts.length, (index) {
                      final post = posts[index];
                      final isHighlighted = index == 0 && selectedTab != 2;
                      final isCompact = selectedTab == 2;

                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: isHighlighted ? 24 : 22,
                        ),
                        child: StudyPostCard(
                          post: post,
                          highlighted: isHighlighted,
                          compact: isCompact,
                          onTap: isHighlighted
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
          ],
        ),
      ),
    );
  }
}


