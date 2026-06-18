import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../models/forum_post_model.dart';

class ForumPreviewCard extends StatelessWidget {
  final ForumPostModel post;
  final VoidCallback? onTap;

  const ForumPreviewCard({
    super.key,
    required this.post,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
        decoration: BoxDecoration(
          color: AppTheme.whiteCard,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x08000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  post.category.toUpperCase(),
                  style: AppTheme.label(
                    fontSize: 10,
                    color: AppTheme.categoryBrown,
                  ).copyWith(
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(width: 22),

                Expanded(
                  child: Text(
                    post.time.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.label(
                      fontSize: 10,
                      color: AppTheme.inactiveText,
                    ).copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 13),

            Text(
              post.title,
              style: AppTheme.cardTitle(fontSize: 17.5).copyWith(
                height: 1.28,
                letterSpacing: -0.25,
              ),
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${post.replies}',
                      style: AppTheme.cardTitle(fontSize: 17).copyWith(
                        color: AppTheme.headingNavy,
                        height: 1.0,
                      ),
                    ),

                    const SizedBox(height: 3),

                    Text(
                      'RESPON',
                      style: AppTheme.label(
                        fontSize: 9,
                        color: AppTheme.inactiveText,
                      ).copyWith(
                        letterSpacing: 1.0,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 36),

                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFFCDD5E1),
                  size: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


