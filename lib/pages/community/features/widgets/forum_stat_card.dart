import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class ForumStatCard extends StatelessWidget {
  final String number;
  final String label;
  final bool isDark;

  const ForumStatCard({
    super.key,
    required this.number,
    required this.label,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.headingNavy : AppTheme.whiteCard,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number,
              style: AppTheme.cardTitle(fontSize: 22).copyWith(
                color: isDark ? Colors.white : AppTheme.categoryBrown,
                height: 1.0,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: AppTheme.label(
                fontSize: 8.5,
                color: isDark ? Colors.white : AppTheme.bodyGrey,
              ).copyWith(
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


