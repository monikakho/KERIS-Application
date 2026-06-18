import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import '../../providers/auth_provider.dart'; 
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';

class OnboardingParent extends ConsumerStatefulWidget {
  const OnboardingParent({super.key});

  @override
  ConsumerState<OnboardingParent> createState() => _OnboardingParentState();
}

class _OnboardingParentState extends ConsumerState<OnboardingParent> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = ref.watch(onboardingIndexProvider);
    const Color orangeColor = Color(0xFFFF852D);

    return Scaffold(
      // Menggunakan warna background yang sama dengan PageOne agar seamless
      backgroundColor: const Color(0xFFF8F9FA), 
      body: Column(
        children: [
          // Header "KERIS" sudah dihapus dari sini karena dipindah ke dalam PageOne/Two/Three
          
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                ref.read(onboardingIndexProvider.notifier).state = index;
              },
              children: const [
                PageOne(), 
                PageTwo(), 
                PageThree()
              ],
            ),
          ),

          // Indikator Titik (Ditempatkan di atas tombol)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => _buildDot(index, currentIndex)),
          ),

          const SizedBox(height: 20),

          // Tombol Navigasi
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
            child: ElevatedButton(
              onPressed: () {
                if (currentIndex < 2) {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  ref.read(isFirstTimeProvider.notifier).state = false;
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: orangeColor,
                minimumSize: const Size(double.infinity, 60),
                elevation: 5, // Memberikan sedikit bayangan seperti di gambar
                shadowColor: orangeColor.withOpacity(0.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    currentIndex == 2 ? "Masuk" : "Selanjutnya",
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 18, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  if (currentIndex < 2) ...[
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index, int activeIndex) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 8,
      width: activeIndex == index ? 24 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: activeIndex == index ? const Color(0xFFFF852D) : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}