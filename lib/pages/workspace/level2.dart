import 'package:flutter/material.dart';
// Menggunakan MainNavigation untuk sinkronisasi state global
//import '../../widgets/main_navigation.dart'; 
// Pastikan path ini sesuai dengan file TimelineStep yang sudah kita perbarui
import '../../widgets/timeline_step.dart'; 
import '../../core/theme/app_theme.dart';

class Level2Page extends StatelessWidget {
  const Level2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0D285F)),
        ),
        title: Text(
          "IT Roadmap Level 2",
          style: AppTheme.sectionTitle(fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Text(
              "LEVEL 2",
              style: AppTheme.label(fontSize: 14, color: AppTheme.primaryOrange),
            ),
            const SizedBox(height: 6),
            Text(
              "Professional Web",
              style: AppTheme.pageTitle(fontSize: 36),
            ),
            const SizedBox(height: 12),
            Text(
              "Master the intricacies of React.js architecture and data management in this curated professional roadmap.",
              style: AppTheme.body(fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Timeline Steps Section[cite: 10, 13]
            const TimelineStep(
              stepNumber: 1,
              isOrange: true,
              title: "Inisialisasi Proyek &\nComponent\n(React.js)",
              iconTitle: Icons.terminal,
              subtitle: "ARCHITECTURE SETUP",
              description:
                  "Membangun pondasi aplikasi dengan struktur folder atomic design dan setup lingkungan pengembangan modern.",
              tags: ["JSX MASTER", "ATOMIC DESIGN"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 2,
              isOrange: false,
              title: "Management State &\nProps",
              iconTitle: Icons.account_tree_outlined,
              subtitle: "DATA FLOW",
              description:
                  "Aliran data antar komponen. Mempelajari pengangkatan state (Lifting State Up) dan penggunaan hooks fundamental.",
              tags: ["USE STATE", "USE EFFECT", "PROPS DRILLING FIX"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 3,
              isOrange: true,
              title: "Menyambungkan Pipa Data\n(API Fetching)",
              iconTitle: Icons.api,
              subtitle: "EXTERNAL INTEGRATION",
              description:
                  "Integrasi backend dengan frontend menggunakan Axios atau Fetch API untuk menghidupkan aplikasi.",
              tags: ["AXIOS", "ASYNC/AWAIT", "LOADING STATE"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 4,
              isOrange: false,
              title: "Logika Filter &\nPencarian",
              iconTitle: Icons.saved_search,
              subtitle: "USER EXPERIENCE LOGIC",
              hasStreamingCard: true,
              streamingTitle: "Client-side Filtering",
              streamingDesc:
                  "Menerapkan algoritma pencarian client-side dan manipulasi array untuk UX yang responsif.",
              tags: ["ARRAY METHOD", "DEBOUNCING", "QUERY PARAMS"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 5,
              isOrange: true,
              title: "Optimasi & Routing",
              iconTitle: Icons.speed,
              subtitle: "PERFORMANCE & NAVIGATION",
              description:
                  "Navigasi multi-halaman dengan React Router dan teknik optimasi performa tinggi.",
              tags: ["REACT ROUTING", "MEMOIZATION", "CODE SPLITTING"],
              isLast: true,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
      // Mengganti KerisBottomNav dengan MainNavigation agar state sinkron
      //bottomNavigationBar: const MainNavigation(),
    );
  }
}