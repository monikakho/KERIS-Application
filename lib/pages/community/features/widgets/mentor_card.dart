import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../models/mentor_model.dart';

class MentorCard extends StatelessWidget {
  final MentorModel mentor;

  const MentorCard({
    super.key,
    required this.mentor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
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
        children: [
          Row(
            children: [
              _MentorImage(
                imagePath: mentor.imagePath,
                isAvailable: mentor.isAvailable,
              ),

              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mentor.status,
                      style: AppTheme.label(
                        fontSize: 9.5,
                        color: mentor.isAvailable
                            ? AppTheme.success
                            : AppTheme.warning,
                      ).copyWith(
                        letterSpacing: 1.1,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      mentor.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.cardTitle(fontSize: 20).copyWith(
                        color: AppTheme.primaryBlue,
                        height: 1.05,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      mentor.role,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.body(fontSize: 12.5).copyWith(
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: mentor.skills.map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6E8EC),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Text(
                    skill,
                    style: AppTheme.label(
                      fontSize: 9.5,
                      color: AppTheme.headingNavy,
                    ).copyWith(
                      letterSpacing: 0.2,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 24),

          Container(
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Jadwalkan Sesi',
                style: AppTheme.button(
                  fontSize: 13.5,
                  color: mentor.isAvailable
                      ? const Color(0xFF252525)
                      : const Color(0xFFA0A0A0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MentorImage extends StatelessWidget {
  final String imagePath;
  final bool isAvailable;

  const _MentorImage({
    required this.imagePath,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            width: 66,
            height: 66,
            color: const Color(0xFFE8E9EB),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.person,
                  color: AppTheme.headingNavy,
                  size: 38,
                );
              },
            ),
          ),
        ),

        Positioned(
          right: -2,
          bottom: -2,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: isAvailable ? AppTheme.success : AppTheme.warning,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppTheme.whiteCard,
                width: 3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


