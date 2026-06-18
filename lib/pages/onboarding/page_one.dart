import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    // Definisi warna agar konsisten
    const Color navyBlue = Color(0xFF001F54); 
    const Color orangeColor = Color(0xFFFF8A00);

    return Scaffold(
      // Kita set backgroundColor di sini agar bersih
      backgroundColor: const Color(0xFFF8F9FA), 
      body: SafeArea( // Menggunakan SafeArea agar teks KERIS tidak tertutup notch/status bar
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                // Header KERIS (Hanya satu ini saja)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "KERIS",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900, // Gunakan w900 agar tebal maksimal
                      color: navyBlue,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Gambar dengan Container Shadow
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/image/onboarding1.png',
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Judul bertumpuk
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 32, 
                      fontWeight: FontWeight.bold,
                      color: navyBlue,
                      height: 1.1,
                    ),
                    children: [
                      TextSpan(text: "Temukan "),
                      TextSpan(
                        text: "Skill\n",
                        style: TextStyle(color: orangeColor),
                      ),
                      TextSpan(text: "Terbaikmu\ndengan "),
                      TextSpan(
                        text: "AI",
                        style: TextStyle(color: orangeColor),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Deskripsi
                const Text(
                  "AI akan membantu kamu menentukan minat dan jalur belajar yang paling cocok.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}