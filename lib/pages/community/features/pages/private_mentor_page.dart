import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../../core/widgets/custom_app_bar.dart';
//import '../../core/widgets/custom_bottom_navbar.dart';
import '../data/community_dummy_data.dart';
import '../widgets/mentor_card.dart';
import '../widgets/mentor_session_card.dart';
import '../widgets/review_history_card.dart';

class PrivateMentorPage extends StatelessWidget {
  const PrivateMentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      //bottomNavigationBar: const CustomBottomNavbar(currentIndex: 3),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomAppBar(
              title: 'Private Mentor Review',
              onBack: () => Navigator.pop(context),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(22, 34, 22, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Private Mentor\nReview',
                      style: AppTheme.pageTitle(fontSize: 34).copyWith(
                        height: 1.15,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Akselerasi potensimu melalui bimbingan\npersonal.',
                      style: AppTheme.body(fontSize: 13.5),
                    ),

                    const SizedBox(height: 46),

                    Text(
                      'SESI MENDATANG',
                      style: AppTheme.label(
                        fontSize: 11,
                        color: AppTheme.categoryBrown,
                      ).copyWith(
                        letterSpacing: 2.4,
                      ),
                    ),

                    const SizedBox(height: 18),

                    const MentorSessionCard(),

                    const SizedBox(height: 22),

                    const ReviewHistoryCard(),

                    const SizedBox(height: 48),

                    Row(
                      children: [
                        Text(
                          'Mentor Tersedia',
                          style: AppTheme.sectionTitle(fontSize: 22)
                              .copyWith(
                            color: AppTheme.primaryBlue,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          'Filter Keahlian',
                          style: AppTheme.button(
                            fontSize: 12,
                            color: AppTheme.headingNavy,
                          ),
                        ),

                        const SizedBox(width: 4),

                        const Icon(
                          Icons.tune,
                          color: AppTheme.headingNavy,
                          size: 19,
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Container(
                      height: 1,
                      color: AppTheme.borderGrey,
                    ),

                    const SizedBox(height: 26),

                    ...List.generate(mentors.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: MentorCard(
                          mentor: mentors[index],
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


