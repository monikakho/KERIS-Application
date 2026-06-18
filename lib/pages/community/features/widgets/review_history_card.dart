import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class ReviewHistoryCard extends StatelessWidget {
  const ReviewHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 26),
      decoration: BoxDecoration(
        color: AppTheme.whiteCard,
        borderRadius: BorderRadius.circular(20),
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
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFFE8E9EB),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Icon(
              Icons.history_edu_outlined,
              color: AppTheme.headingNavy,
              size: 26,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Riwayat Review',
            style: AppTheme.cardTitle(fontSize: 18).copyWith(
              color: AppTheme.primaryBlue,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Lihat kembali catatan dan rekaman dari\nsesi review sebelumnya untuk memperkuat\npemahamanmu.',
            style: AppTheme.body(fontSize: 13.5),
          ),

          const SizedBox(height: 24),

          Row(
            children: [
              Text(
                'Buka Arsip',
                style: AppTheme.button(
                  fontSize: 13,
                  color: AppTheme.headingNavy,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.open_in_new,
                color: AppTheme.headingNavy,
                size: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


