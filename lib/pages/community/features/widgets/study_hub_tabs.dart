import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class StudyHubTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const StudyHubTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = ['Semua', 'Sedang Tren', 'Postingan Saya'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isActive = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.only(
              right: index == tabs.length - 1 ? 0 : 22,
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onChanged(index),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tabs[index],
                    style: AppTheme.button(
                      fontSize: 13.5,
                      color: isActive
                          ? AppTheme.primaryOrange
                          : AppTheme.inactiveText,
                    ).copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Container(
                    height: 3,
                    width: tabs[index] == 'Postingan Saya' ? 86 : 48,
                    decoration: BoxDecoration(
                      color: isActive ? AppTheme.primaryOrange : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}


