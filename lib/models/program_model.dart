import 'package:flutter/material.dart';

class ProgramModel {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final Color accentColor;
  final String duration;
  final String level;
  final String projects;
  final List<String> highlights;
  final List<LearningModule> modules;
  final List<String> tools;
  final String mentorName;
  final String mentorRole;
  final String mentorImage;

  const ProgramModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.accentColor,
    required this.duration,
    required this.level,
    required this.projects,
    required this.highlights,
    required this.modules,
    required this.tools,
    required this.mentorName,
    required this.mentorRole,
    required this.mentorImage,
  });

  static List<ProgramModel> allPrograms = [
    webDevelopment,
    artificialIntelligence,
    mobileDevelopment,
  ];

  static const webDevelopment = ProgramModel(
    title: "Web Development",
    subtitle: "Bangun website modern dari nol hingga deploy",
    description:
        "Program ini dirancang untuk membekali kamu dengan kemampuan membangun website profesional. "
        "Mulai dari dasar HTML, CSS, JavaScript hingga framework modern seperti React dan Node.js. "
        "Kamu akan belajar membangun aplikasi web full-stack yang siap digunakan di dunia nyata.",
    imagePath: "assets/image/home_web.jpg",
    accentColor: Color(0xFF3B82F6),
    duration: "6 Bulan",
    level: "Beginner - Advanced",
    projects: "12+ Proyek",
    highlights: [
      "Memahami fundamental web: HTML, CSS, JavaScript",
      "Menguasai React.js untuk membangun UI modern",
      "Belajar backend dengan Node.js & Express",
      "Database management dengan PostgreSQL & MongoDB",
      "RESTful API design & implementation",
      "Deployment & hosting di cloud platform",
    ],
    modules: [
      LearningModule(
        title: "Web Fundamentals",
        description: "HTML5, CSS3, JavaScript ES6+",
        weekRange: "Minggu 1-4",
        icon: Icons.language,
      ),
      LearningModule(
        title: "Frontend Framework",
        description: "React.js, State Management, Routing",
        weekRange: "Minggu 5-10",
        icon: Icons.widgets_outlined,
      ),
      LearningModule(
        title: "Backend Development",
        description: "Node.js, Express, REST API",
        weekRange: "Minggu 11-16",
        icon: Icons.dns_outlined,
      ),
      LearningModule(
        title: "Database & Deployment",
        description: "PostgreSQL, MongoDB, CI/CD, Cloud",
        weekRange: "Minggu 17-24",
        icon: Icons.cloud_outlined,
      ),
    ],
    tools: ["HTML5", "CSS3", "JavaScript", "React", "Node.js", "PostgreSQL", "Git", "VS Code"],
    mentorName: "Budi Santoso",
    mentorRole: "Senior Full-Stack Developer",
    mentorImage: "assets/image/mentor_budi.png",
  );

  static const mobileDevelopment = ProgramModel(
    title: "Mobile Development",
    subtitle: "Ciptakan aplikasi mobile lintas platform",
    description:
        "Pelajari cara membangun aplikasi mobile modern menggunakan Flutter & Dart. "
        "Program ini mencakup UI design, state management, integrasi API, hingga deployment ke "
        "Google Play Store dan App Store. Cocok untuk kamu yang ingin menjadi Mobile Developer profesional.",
    imagePath: "assets/image/home_mobile.png",
    accentColor: Color(0xFF10B981),
    duration: "6 Bulan",
    level: "Beginner - Advanced",
    projects: "10+ Proyek",
    highlights: [
      "Menguasai bahasa pemrograman Dart",
      "Membangun UI responsif dengan Flutter",
      "State management dengan Riverpod & Bloc",
      "Integrasi REST API & Firebase",
      "Local storage & offline-first approach",
      "Publishing ke Play Store & App Store",
    ],
    modules: [
      LearningModule(
        title: "Dart Programming",
        description: "Fundamental Dart, OOP, Async",
        weekRange: "Minggu 1-3",
        icon: Icons.code,
      ),
      LearningModule(
        title: "Flutter UI Mastery",
        description: "Widgets, Layouts, Animations, Theming",
        weekRange: "Minggu 4-10",
        icon: Icons.phone_android,
      ),
      LearningModule(
        title: "State & Backend",
        description: "Riverpod, API Integration, Firebase",
        weekRange: "Minggu 11-18",
        icon: Icons.sync_alt,
      ),
      LearningModule(
        title: "Advanced & Publishing",
        description: "Testing, Performance, Deployment",
        weekRange: "Minggu 19-24",
        icon: Icons.rocket_launch_outlined,
      ),
    ],
    tools: ["Dart", "Flutter", "Firebase", "Riverpod", "Figma", "Android Studio", "Git", "VS Code"],
    mentorName: "Gilang Pratama",
    mentorRole: "Lead Mobile Developer",
    mentorImage: "assets/image/mentor_gilang.png",
  );

  static const artificialIntelligence = ProgramModel(
    title: "Artificial Intelligence",
    subtitle: "Kuasai dunia AI & Machine Learning",
    description:
        "Masuki dunia Artificial Intelligence dari dasar hingga mahir. "
        "Kamu akan mempelajari konsep Machine Learning, Deep Learning, Natural Language Processing, "
        "dan Computer Vision. Program ini menggunakan Python dan library populer seperti TensorFlow & PyTorch.",
    imagePath: "assets/image/home_ai.png",
    accentColor: Color(0xFF8B5CF6),
    duration: "8 Bulan",
    level: "Intermediate - Advanced",
    projects: "8+ Proyek",
    highlights: [
      "Fundamental Python untuk Data Science",
      "Statistik & Matematika untuk AI",
      "Machine Learning: Supervised & Unsupervised",
      "Deep Learning dengan Neural Networks",
      "Natural Language Processing (NLP)",
      "Computer Vision & Image Recognition",
    ],
    modules: [
      LearningModule(
        title: "Python & Data Science",
        description: "Python, NumPy, Pandas, Visualisasi",
        weekRange: "Minggu 1-6",
        icon: Icons.analytics_outlined,
      ),
      LearningModule(
        title: "Machine Learning",
        description: "Supervised, Unsupervised, Evaluation",
        weekRange: "Minggu 7-14",
        icon: Icons.psychology_outlined,
      ),
      LearningModule(
        title: "Deep Learning",
        description: "Neural Networks, CNN, RNN, Transformers",
        weekRange: "Minggu 15-24",
        icon: Icons.hub_outlined,
      ),
      LearningModule(
        title: "AI Applications",
        description: "NLP, Computer Vision, Model Deployment",
        weekRange: "Minggu 25-32",
        icon: Icons.smart_toy_outlined,
      ),
    ],
    tools: ["Python", "TensorFlow", "PyTorch", "Jupyter", "Pandas", "Scikit-learn", "Git", "Google Colab"],
    mentorName: "Rudi Hartono",
    mentorRole: "AI Research Engineer",
    mentorImage: "assets/image/mentor_rudi.png",
  );
}

class LearningModule {
  final String title;
  final String description;
  final String weekRange;
  final IconData icon;

  const LearningModule({
    required this.title,
    required this.description,
    required this.weekRange,
    required this.icon,
  });
}
