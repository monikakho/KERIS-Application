import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
        color: AppTheme.whiteCard,
        border: Border(
          bottom: BorderSide(
            color: AppTheme.borderGrey,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack ?? () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: AppTheme.headingNavy,
              size: 23,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.cardTitle(fontSize: 17).copyWith(
                color: AppTheme.headingNavy,
                letterSpacing: -0.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


