import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class CommunityFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String actionText;
  final IconData actionIcon;
  final bool isPrimary;
  final VoidCallback? onTap;

  const CommunityFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.actionText,
    required this.actionIcon,
    required this.isPrimary,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isPrimary ? AppTheme.primaryBlue : AppTheme.whiteCard;

    final titleColor = isPrimary ? Colors.white : AppTheme.headingNavy;

    final descriptionColor =
        isPrimary ? const Color(0xFFD6DFF2) : AppTheme.bodyGrey;

    final actionColor = isPrimary ? Colors.white : AppTheme.categoryBrown;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          isPrimary ? 22 : 24,
          isPrimary ? 24 : 26,
          22,
          24,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isPrimary
              ? const [
                  BoxShadow(
                    color: Color(0x22002366),
                    blurRadius: 22,
                    offset: Offset(0, 12),
                  ),
                ]
              : const [
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
            Text(
              title,
              style: AppTheme.cardTitle(
                fontSize: isPrimary ? 24 : 25,
              ).copyWith(
                color: titleColor,
                height: 1.16,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              description,
              style: AppTheme.body(fontSize: 13).copyWith(
                color: descriptionColor,
                height: 1.45,
              ),
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Text(
                  actionText,
                  style: AppTheme.button(
                    fontSize: 12.5,
                    color: actionColor,
                  ),
                ),
                const SizedBox(width: 7),
                Icon(
                  actionIcon,
                  color: actionColor,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


