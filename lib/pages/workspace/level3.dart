import 'package:flutter/material.dart';
// Menggunakan MainNavigation untuk sinkronisasi state navigasi global
//import '../../widgets/main_navigation.dart'; 
// Mengacu pada file komponen timeline terbaru[cite: 9, 10]
import '../../widgets/timeline_step.dart'; 
import '../../core/theme/app_theme.dart';

class Level3Page extends StatelessWidget {
  const Level3Page({super.key});

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
          "IT Roadmap Level 3",
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
              "LEVEL 3",
              style: AppTheme.label(fontSize: 14, color: AppTheme.primaryOrange),
            ),
            const SizedBox(height: 6),
            Text(
              "Expert Web",
              style: AppTheme.pageTitle(fontSize: 36),
            ),
            const SizedBox(height: 12),
            Text(
              "Master the complex architecture of fullstack development. Move beyond basic CRUD to build scalable, secure, and real-time distributed systems.",
              style: AppTheme.body(fontSize: 14),
            ),
            const SizedBox(height: 30),

            // Timeline Steps Section[cite: 9, 13]
            const TimelineStep(
              stepNumber: 1,
              isOrange: true,
              title: "Perancangan Database\n(MongoDB)",
              iconTitle: Icons.storage,
              subtitle: "ARCHITECTURAL FOUNDATION",
              description:
                  "Mastering NoSQL schema design, document embedding, and optimization for high-performance reading.",
              bulletPoints: ["Aggregation Pipelines", "Indexing Strategies"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 2,
              isOrange: false,
              title: "Membangun 'Mesin'\nBackends",
              iconTitle: Icons.candlestick_chart_outlined,
              subtitle: "NODE.JS & EXPRESS ECOSYSTEM",
              description:
                  "Developing modular, asynchronous server logic that can handle thousands of concurrent requests efficiently.",
              tags: ["Middleware", "RESTful Design", "Error handling"],
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 3,
              isOrange: true,
              title: "Sistem Keamanan &\nAutentikasi",
              iconTitle: Icons.lock_outlined,
              subtitle: "JWT & SECURE PROTOCOLS",
              description:
                  "Implementing enterprise-grade security. Beyond logins: focusing on session management, encryption, and protection against common vulnerabilities.",
              hasStatsCard: true,
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 4,
              isOrange: false,
              title: "Komunikasi Real-Time",
              iconTitle: Icons.bolt,
              subtitle: "SOCKET.IO WEBSOCKETS",
              hasStreamingCard: true,
              streamingTitle: "Bidirectional Streaming",
              streamingDesc:
                  "Enable instant updates, live chat, and collaborative tools using persistent WebSocket connections.",
              isLast: false,
            ),

            const TimelineStep(
              stepNumber: 5,
              isOrange: true,
              title: "Integrasi Menyeluruh",
              iconTitle: Icons.hub_outlined,
              subtitle: "CAPSTONE: END-TO-END ORCHESTRATION",
              description:
                  "The ultimate phase where frontend and backend harmonize. Connect your complex backend logic with reactive interfaces for a seamless user experience.",
              hasDeployButton: true,
              buttonText: "Launch Project",
              isLast: true,
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
      // Integrasi navigasi Riverpod melalui MainNavigation
      //bottomNavigationBar: const MainNavigation(),
    );
  }
}