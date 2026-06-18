import 'package:flutter/material.dart';
// Pastikan path ini sesuai dengan lokasi file TimelineStep Anda
import '../../widgets/timeline_step.dart'; 
import '../../core/theme/app_theme.dart';

class Level1Page extends StatelessWidget {
  const Level1Page({super.key});

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
          "IT Roadmap Level 1",
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
              "LEVEL 1",
              style: AppTheme.label(fontSize: 14, color: AppTheme.primaryOrange),
            ),
            const SizedBox(height: 6),
            Text(
              "Beginner Web",
              style: AppTheme.pageTitle(fontSize: 36),
            ),
            const SizedBox(height: 12),
            Text(
              "Kurikulum terstruktur untuk menguasai fondasi pengembangan web modern dengan pendekatan editorial.",
              style: AppTheme.body(fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Timeline Steps Section
            const TimelineStep(
              stepNumber: 1,
              isOrange: true,
              title: "Brief Klien &\nWireframe",
              iconTitle: Icons.storage,
              subtitle: "ARCHITECTURAL PARADIGM",
              description:
                  "Mastering NoSQL schema design, document embedding, and optimization for high-performance reading.",
              bulletPoints: ["Aggregation Pipelines", "Indexing Strategies"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 2,
              isOrange: false,
              title: "Styling dan\nBranding (CSS)",
              subtitle: "NODE.JS & EXPRESS ECOSYSTEM",
              description:
                  "Implementasi desain sistem dan estetika editorial profesional.",
              tags: ["Middleware", "RESTful Design", "Error handling"],
              extraLabel: "SEDANG DIPELAJARI",
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 3,
              isOrange: true,
              title: "Interaktif Ringan\n(JS)",
              iconTitle: Icons.lock,
              subtitle: "DATA & RELATIONS PROTOCOL",
              description:
                  "Membangun logika dasar dan interaksi dinamis pada antarmuka.",
              hasStatsCard: true,
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 4,
              isOrange: false,
              title: "Responsivitas\nMobile",
              subtitle: "SOCKET.IO WEBSOCKETS",
              hasStreamingCard: true,
              streamingTitle: "Bidirectional Streaming",
              streamingDesc:
                  "Memastikan pengalaman yang konsisten di seluruh perangkat",
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 5,
              isOrange: true,
              title: "Deployment &\nHandover",
              iconTitle: Icons.hub_outlined,
              subtitle: "CAPSTONE: END-TO-END ORCHESTRATION",
              description:
                  "The ultimate phase where frontend and backend harmonize. Connect your complex backend logic with reactive interfaces for a seamless user experience.",
              hasDeployButton: true,
              buttonText: "Deploy",
              isLast: true,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
      // BAGIAN DI BAWAH INI DIHAPUS
      // bottomNavigationBar: const MainNavigation(), 
    );
  }
}