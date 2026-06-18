import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';


class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNavbar({
    super.key,
    this.currentIndex = 3,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _BottomNavItem(Icons.home_rounded, 'Beranda'),
      _BottomNavItem(Icons.explore_rounded, 'Jelajah'),
      _BottomNavItem(Icons.article_rounded, 'Ruang Belajar'),
      _BottomNavItem(Icons.groups_rounded, 'Komunitas'),
      _BottomNavItem(Icons.settings_rounded, 'Pengaturan'),
    ];

    return Container(
      height: 68,
      padding: const EdgeInsets.only(top: 6, bottom: 6),
      decoration: const BoxDecoration(
        color: AppTheme.whiteCard,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isActive = currentIndex == index;

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap?.call(index),
            child: SizedBox(
              width: 68,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[index].icon,
                    size: 23,
                    color: isActive
                        ? AppTheme.primaryOrange
                        : AppTheme.headingNavy,
                  ),

                  const SizedBox(height: 3),

                  Text(
                    items[index].label,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.navbar(fontSize: 10).copyWith(
                      color: isActive
                          ? AppTheme.primaryOrange
                          : AppTheme.headingNavy,
                      height: 1.05,
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

class _BottomNavItem {
  final IconData icon;
  final String label;

  const _BottomNavItem(this.icon, this.label);
}


