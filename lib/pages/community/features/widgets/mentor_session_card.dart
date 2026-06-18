import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class MentorSessionCard extends StatelessWidget {
  const MentorSessionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(26, 26, 26, 26),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF002366),
            Color(0xFF061849),
            Color(0xFF3A3A63),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18002366),
            blurRadius: 18,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 112,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.primaryOrange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                '12/12/2026',
                style: AppTheme.button(
                  fontSize: 11.5,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'Deep Dive:\nArsitektur Cloud\nNative untuk\nSkalabilitas Global',
            style: AppTheme.pageTitle(fontSize: 26).copyWith(
              color: Colors.white,
              height: 1.25,
              letterSpacing: -0.8,
            ),
          ),

          const SizedBox(height: 30),

          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: Color(0xFF9EB2D4),
              ),
              const SizedBox(width: 7),
              Text(
                'Hari ini, 20:00 WIB',
                style: AppTheme.body(fontSize: 11.5).copyWith(
                  color: const Color(0xFF9EB2D4),
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 18),
              const Icon(
                Icons.person_outline,
                size: 14,
                color: Color(0xFF9EB2D4),
              ),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  'Budi Python',
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.body(fontSize: 11.5).copyWith(
                    color: const Color(0xFF9EB2D4),
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Container(
            width: 118,
            height: 52,
            decoration: BoxDecoration(
              color: AppTheme.primaryOrange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Gabung',
                style: AppTheme.button(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


