import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class AnswerInputCard extends StatelessWidget {
  const AnswerInputCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 220,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFFE9EAEC),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: const Color(0xFFD6D8DC),
            width: 1,
          ),
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
            Row(
              children: [
                const Icon(
                  Icons.edit_note,
                  color: AppTheme.headingNavy,
                  size: 19,
                ),
                const SizedBox(width: 6),
                Text(
                  'Tulis Jawaban Kamu',
                  style: AppTheme.button(
                    fontSize: 12,
                    color: AppTheme.headingNavy,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Container(
              height: 112,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.whiteCard,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Berikan solusi atau tips\ntambahan...',
                  style: AppTheme.body(fontSize: 12).copyWith(
                    color: const Color(0xFFB0B9C8),
                    height: 1.4,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primaryOrange,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33FC8127),
                      blurRadius: 12,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: Text(
                  'Kirim Jawaban',
                  style: AppTheme.button(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


