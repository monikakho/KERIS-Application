import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart'; // Pastikan path benar
import '../providers/enroll_provider.dart'; // Pastikan path benar
import '../pages/home_page.dart';
import '../pages/explore/explore_page.dart';
import '../pages/workspace/input_kode.dart';
import '../pages/workspace/ruang_belajar_page.dart'; // Import halaman tujuan
import '../pages/community/features/pages/community_page.dart';
import '../pages/settings/settings_page.dart';

class MainNavigation extends ConsumerWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(mainNavIndexProvider);
    final isEnrolled = ref.watch(isEnrolledProvider); // Pantau status enroll

    // List halaman yang akan ditampilkan
    final List<Widget> _pages = [
      const HomePage(),                             // Index 0
      const ExplorePage(),                          // Index 1
      // Logic Switch: Jika sudah enroll tampilkan RuangBelajarPage[cite: 3, 4]
      isEnrolled ? const RuangBelajarPage() : const InputKodePage(), 
      const CommunityPage(),                        // Index 3
      const SettingsPage(),                         // Index 4
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF852D),
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(mainNavIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: "Jelajah"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined), label: "Ruang Belajar"),
          BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: "Komunitas"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Profil"),
        ],
      ),
    );
  }
}