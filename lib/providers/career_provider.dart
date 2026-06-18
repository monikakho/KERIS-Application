import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/career_model.dart'; 

// Provider untuk menyimpan karir yang sedang dipilih (untuk halaman detail)
final selectedCareerProvider = StateProvider<CareerModel?>((ref) => null);

final careerListProvider = Provider<List<CareerModel>>((ref) {
  return [
    CareerModel(
      title: "AI Engineer",
      icon: Icons.psychology,
      description: "AI Engineer bertugas membangun, menguji, dan menerapkan sistem kecerdasan buatan dalam skala besar.",
      salary: "Rp 11.000.000 - Rp 28.000.000",
      tasks: [
        "Membangun infrastruktur untuk mengeksekusi model AI.",
        "Mengoperasikan model prediksi ke lingkungan production.",
        "Memantau dan meningkatkan performa model AI secara berkala.",
        "Mengotomatisasi proses pengiriman data untuk kebutuhan AI.",
      ],
      skills: ["NLP", "Python", "Machine Learning", "Cloud AI (AWS/GCP)", "API Deployment", "Tableau"],
      careerPath: [
        CareerStep(num: "01", title: "Junior AI Developer", desc: "Fokus pada pengembangan AI dan feature engineering."),
        CareerStep(num: "02", title: "Senior AI Engineer", desc: "Fokus pada pengembangan sistem AI yang lebih kompleks dan efisien."),
        CareerStep(num: "03", title: "Lead AI Architect", desc: "Berfokus pada perancangan arsitektur AI dan strategi teknologi."),
      ],
    ),
    CareerModel(
      title: "Android Developer",
      icon: Icons.android,
      description: "Spesialis yang fokus pada sistem operasi Android untuk menciptakan aplikasi native yang optimal.",
      salary: "Rp 7.000.000 - Rp 14.000.000",
      tasks: [
        "Menulis kode native Android yang efisien.",
        "Membangun UI sesuai panduan Material Design.",
        "Mengatasi fragmentasi layar di berbagai perangkat.",
        "Mengoptimalkan performa aplikasi pada perangkat spesifikasi rendah.",
      ],
      skills: ["Flutter", "Java", "Dart", "Android Studio", "Kotlin", "Jetpack Compose", "Appwrite"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Android Dev", desc: "Fokus pada pengembangan aplikasi mobile dasar."),
        CareerStep(num: "02", title: "Senior Android Dev", desc: "Fokus pada pengembangan aplikasi yang lebih kompleks."),
        CareerStep(num: "03", title: "Lead Android Specialist", desc: "Berfokus pada strategi teknis dan kepemimpinan tim."),
      ],
    ),
    CareerModel(
      title: "Backend Developer",
      icon: Icons.storage,
      description: "Backend Developer bertanggung jawab atas 'sisi server', database, logika bisnis, dan keamanan data.",
      salary: "Rp 7.000.000 - Rp 15.000.000",
      tasks: [
        "Membangun dan mengelola arsitektur server dan database.",
        "Membuat API yang efisien untuk dikonsumsi oleh tim Frontend.",
        "Menjamin keamanan data dan perlindungan terhadap serangan siber.",
        "Mengoptimalkan kecepatan akses data dan logika server.",
      ],
      skills: ["Node.js", "Python", "Golang", "PostgreSQL", "Redis", "Docker", "REST API"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Backend", desc: "Menangani debugging dan pembuatan API sederhana."),
        CareerStep(num: "02", title: "Senior Backend", desc: "Mengelola skalabilitas sistem dan database."),
        CareerStep(num: "03", title: "Lead Backend Architect", desc: "Menentukan arsitektur sistem skala besar."),
      ],
    ),
    CareerModel(
      title: "Data Analyst",
      icon: Icons.analytics,
      description: "Data Analyst fokus pada menjawab pertanyaan 'apa yang terjadi?' dengan memeriksa data historis.",
      salary: "Rp 6.000.000 - Rp 12.000.000",
      tasks: [
        "Mengambil data dari database menggunakan bahasa query.",
        "Membersihkan data yang kotor atau tidak lengkap.",
        "Membuat laporan harian, mingguan, atau bulanan.",
        "Mencari anomali atau tren dalam performa penjualan bisnis.",
      ],
      skills: ["Excel", "SQL", "Data Cleaning", "PowerBI", "Communication"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Analyst", desc: "Tanggung jawab mencakup pengelolaan laporan modul data dasar."),
        CareerStep(num: "02", title: "Senior Data Analyst", desc: "Fokus pada riset analisis data yang lebih mendalam."),
        CareerStep(num: "03", title: "Lead Analytics Manager", desc: "Bertanggung jawab memimpin tim analisis."),
      ],
    ),
    CareerModel(
      title: "Data Scientist",
      icon: Icons.science,
      description: "Data Scientist mengolah data mentah menjadi informasi berharga menggunakan statistik dan AI.",
      salary: "Rp 9.000.000 - Rp 22.000.000",
      tasks: [
        "Mengumpulkan dan membersihkan data dari berbagai sumber.",
        "Membangun model prediksi menggunakan machine learning.",
        "Menganalisis pola data untuk memberikan rekomendasi bisnis.",
        "Membuat visualisasi data untuk laporan pimpinan.",
      ],
      skills: ["Python", "SQL", "Scikit-Learn", "Statistics", "Pandas", "Tableau"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Scientist", desc: "Melakukan eksplorasi data dan membantu pembuatan model."),
        CareerStep(num: "02", title: "Senior Data Scientist", desc: "Merancang model prediktif canggih."),
        CareerStep(num: "03", title: "Lead Chief Data Officer", desc: "Menentukan strategi data perusahaan."),
      ],
    ),
    CareerModel(
      title: "Computer Vision Engineer",
      icon: Icons.visibility,
      description: "Ahli AI yang melatih komputer untuk memahami gambar atau video layaknya manusia.",
      salary: "Rp 10.000.000 - Rp 25.000.000",
      tasks: [
        "Mengembangkan algoritma pengolahan citra digital.",
        "Melatih model AI untuk deteksi dan klasifikasi objek.",
        "Mengoptimalkan sistem untuk pemrosesan video real-time.",
        "Mengintegrasikan sistem visi ke perangkat keras/robotika.",
      ],
      skills: ["OpenCV", "Python", "TensorFlow", "PyTorch", "Deep Learning", "C++"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Developer", desc: "Menerapkan algoritma pengolahan citra dasar."),
        CareerStep(num: "02", title: "Senior Developer", desc: "Merancang model Deep Learning untuk visi kompleks."),
        CareerStep(num: "03", title: "Lead Developer (Skala AI)", desc: "Memimpin strategi pengembangan AI."),
      ],
    ),
    CareerModel(
      title: "Frontend Web Developer",
      icon: Icons.code,
      description: "Frontend Developer berfokus pada visual, tata letak, dan navigasi website agar mulus di semua perangkat.",
      salary: "Rp 6.000.000 - Rp 13.000.000",
      tasks: [
        "Mengimplementasikan desain visual menjadi kode (Slicing).",
        "Mengoptimalkan performa website agar cepat.",
        "Memastikan kompatibilitas tampilan di berbagai browser.",
        "Membangun komponen UI yang dapat digunakan kembali.",
      ],
      skills: ["React.js", "Vue.js", "Tailwind CSS", "SASS", "Typescript", "Browser DevTools"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Frontend", desc: "Fokus pada pembuatan tampilan dan UI dasar."),
        CareerStep(num: "02", title: "Senior Frontend", desc: "Merancang strategi pengalaman pengguna tingkat tinggi."),
        CareerStep(num: "03", title: "Lead Frontend Architect", desc: "Menentukan visi produk dan memimpin tim."),
      ],
    ),
    CareerModel(
      title: "Full Stack Developer",
      icon: Icons.layers,
      description: "Spesialis yang menguasai Frontend dan Backend untuk membangun aplikasi utuh dari nol.",
      salary: "Rp 9.000.000 - Rp 18.000.000",
      tasks: [
        "Merancang arsitektur aplikasi secara menyeluruh.",
        "Menangani integrasi antarmuka pengguna dengan database.",
        "Melakukan troubleshooting di semua lapisan teknologi.",
        "Mengelola siklus pengembangan produk.",
      ],
      skills: ["MERN Stack", "Next.js", "PHP/Laravel", "SQL", "Cloud Hosting", "DevOps Basics"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Full Stack Dev", desc: "Membangun dasar-dasar pengembangan aplikasi."),
        CareerStep(num: "02", title: "Senior Full Stack Dev", desc: "Fokus pada pengembangan sistem dan skalabilitas."),
        CareerStep(num: "03", title: "Lead CTO / Tech Lead", desc: "Mengimplementasikan fitur unggulan dan strategi teknis."),
      ],
    ),
    CareerModel(
      title: "iOS Developer",
      icon: Icons.apple,
      description: "Spesialis pengembang aplikasi untuk ekosistem Apple (iPhone/iPad) dengan standar kualitas tinggi.",
      salary: "Rp 8.000.000 - Rp 16.000.000",
      tasks: [
        "Mengembangkan aplikasi native menggunakan bahasa Swift.",
        "Mengimplementasikan desain sesuai Human Interface Guidelines.",
        "Menjamin keamanan dan privasi data pengguna iOS.",
        "Mengintegrasikan fitur khusus Apple (iCloud, Apple Pay).",
      ],
      skills: ["Swift", "Xcode", "SwiftUI", "Cocoa Touch", "Core Data", "App Store Connect"],
      careerPath: [
        CareerStep(num: "01", title: "Junior iOS Dev", desc: "Membangun fitur aplikasi mobile dasar Apple."),
        CareerStep(num: "02", title: "Senior iOS Dev", desc: "Mengembangkan arsitektur aplikasi yang kompleks."),
        CareerStep(num: "03", title: "Lead iOS Architect", desc: "Kepemimpinan tim mobile Apple."),
      ],
    ),
    CareerModel(
      title: "Machine Learning Engineer",
      icon: Icons.settings_suggest,
      description: "Spesialis yang membuat algoritma agar mesin dapat 'belajar' dari data secara mandiri.",
      salary: "Rp 10.000.000 - Rp 25.000.000",
      tasks: [
        "Merancang algoritma belajar mandiri (Machine Learning).",
        "Mengolah dataset besar untuk pelatihan model.",
        "Melakukan eksperimen akurasi algoritma.",
        "Mengubah hasil riset menjadi sistem siap pakai.",
      ],
      skills: ["Deep Learning", "Python", "Neural Networks", "Mathematics", "Keras"],
      careerPath: [
        CareerStep(num: "01", title: "Junior ML Specialist", desc: "Fokus pada riset dasar dan model sederhana."),
        CareerStep(num: "02", title: "Senior ML Engineer", desc: "Fokus pada optimalisasi model kompleks."),
        CareerStep(num: "03", title: "Lead Scientist", desc: "Riset strategi pengembangan machine learning."),
      ],
    ),
    
    CareerModel(
      title: "Mobile Developer",
      icon: Icons.smartphone,
      description: "Mobile Developer mengembangkan aplikasi khusus untuk perangkat genggam (smartphone/tablet). Fokusnya adalah mobilitas, efisiensi penggunaan baterai, dan performa aplikasi di jaringan seluler.",
      salary: "Rp 7.000.000 - Rp 15.000.000",
      tasks: [
        "Mengembangkan fitur aplikasi mobile yang responsif.",
        "Mengintegrasikan sensor HP (GPS, Kamera, dll) ke dalam aplikasi.",
        "Memastikan aplikasi berjalan stabil di berbagai versi OS.",
        "Mengelola proses rilis di Play Store atau App Store.",
      ],
      skills: ["Flutter", "React Native", "Dart", "API Integration", "State Management"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Mobile Dev", desc: "Membangun tampilan layar dan navigasi dasar."),
        CareerStep(num: "02", title: "Senior Mobile Dev", desc: "Mengoptimalkan performa aplikasi dan integrasi kompleks."),
        CareerStep(num: "03", title: "Lead Mobile Tech", desc: "Memimpin tim mobile dan strategi teknis aplikasi."),
      ],
    ),

    // 2. UI/UX Designer
    CareerModel(
      title: "UI/UX Designer",
      icon: Icons.design_services,
      description: "UI/UX Designer bertugas menciptakan pengalaman pengguna yang nyaman dan tampilan yang indah. Mereka melakukan riset untuk memahami apa yang diinginkan pengguna sebelum menuangkannya dalam desain visual.",
      salary: "Rp 6.000.000 - Rp 14.000.000",
      tasks: [
        "Melakukan riset pengguna dan membuat user persona.",
        "Membuat wireframe dan prototype interaktif.",
        "Merancang desain visual akhir (High-fidelity) yang estetik.",
        "Mengadakan pengujian kegunaan (Usability Testing).",
      ],
      skills: ["User Research", "Visual Design", "Prototyping", "Design System", "Wireframing", "Interaction Design"],
      careerPath: [
        CareerStep(num: "01", title: "Junior UI/UX", desc: "Fokus pada pembuatan desain detail dan konstruksi kebutuhan pengguna."),
        CareerStep(num: "02", title: "Senior UI/UX", desc: "Menganalisis kebutuhan bisnis dan menciptakan pengalaman yang lebih kompleks."),
        CareerStep(num: "03", title: "Lead UI/UX Designer", desc: "Berperan strategis bagi desain dan arah produk."),
      ],
    ),

    // 3. Web Developer
    CareerModel(
      title: "Web Developer",
      icon: Icons.language,
      description: "Web Developer adalah profesi yang bertanggung jawab dalam merancang, mengembangkan, dan memelihara website atau aplikasi berbasis web. Mereka memastikan tampilan antarmuka menarik dan sistem berjalan baik.",
      salary: "Rp 5.000.000 - Rp 12.000.000",
      tasks: [
        "Menulis kode yang efisien, teruji, dan dapat dipelihara menggunakan praktik terbaik.",
        "Berkolaborasi dengan desainer untuk mengimplementasikan antarmuka visual.",
        "Melakukan integrasi API dan layanan pihak ketiga untuk fungsionalitas web.",
      ],
      skills: ["HTML", "CSS", "JavaScript", "React.js", "Git & Github", "Tailwind CSS"],
      careerPath: [
        CareerStep(num: "01", title: "Junior Developer", desc: "Fokus pada pembuatan fitur UI dan memperbaiki bug."),
        CareerStep(num: "02", title: "Senior Developer", desc: "Merancang arsitektur aplikasi dan membimbing tim junior."),
        CareerStep(num: "03", title: "Lead Developer", desc: "Bertanggung jawab penuh atas teknis dan arah proyek."),
      ],
    ),
  ];
});
  