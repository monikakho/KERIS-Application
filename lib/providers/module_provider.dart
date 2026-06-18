import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/module_model.dart';
import 'enroll_provider.dart';

class ModuleNotifier extends StateNotifier<List<Module>> {
  ModuleNotifier({required String track}) : super(_getInitialModules(track));

  static List<Module> _getInitialModules(String track) {
    if (track == 'Mobile Development') {
      return _mobileModules;
    } else if (track == 'Artificial Intelligence') {
      return _aiModules;
    }
    return _webModules;
  }

  static final _webModules = [
    Module(
      id: 'w1',
      moduleNumber: "01",
      title: "Pengenalan HTML",
      description: "Fondasi utama dalam membangun struktur halaman web yang semantik dan aksesibel.",
      fullContent: "HTML adalah dasar dari semua website. Di modul ini, kamu akan belajar struktur dasar HTML seperti heading, paragraf, dan elemen penting lainnya.",
      duration: "30 Menit",
      status: ModuleStatus.sedangBerjalan,
      type: ModuleType.video,
      progress: 65,
      insight: "Struktur HTML yang baik membuat website lebih rapi dan nyaman digunakan.",
      nextTitle: "Pengenalan CSS",
      nextSubtitle: "Materi Video • 25 Menit",
    ),
    Module(
      id: 'w2',
      moduleNumber: "02",
      title: "Pengenalan CSS",
      description: "Seni menata visual dan layout menggunakan Cascading Style Sheets.",
      fullContent: "CSS digunakan untuk mengontrol tampilan dan tata letak halaman web.",
      duration: "25 Menit",
      status: ModuleStatus.belumMulai,
      type: ModuleType.video,
      insight: "CSS memungkinkan pemisahan antara konten dan desain visual.",
      nextTitle: "Pengenalan React",
      nextSubtitle: "Materi Video • 50 Menit",
    ),
    Module(
      id: 'w3',
      moduleNumber: "03",
      title: "Pengenalan React",
      description: "Pelajari library JavaScript paling populer untuk antarmuka pengguna.",
      fullContent: "React adalah pustaka JavaScript untuk membangun antarmuka pengguna yang reaktif.",
      duration: "50 Menit",
      status: ModuleStatus.belumMulai,
      type: ModuleType.video,
      insight: "React adalah cara berpikir tentang bagaimana data mengalir dalam aplikasi.",
      nextTitle: "Panduan Frontend Dasar",
      nextSubtitle: "Materi PDF • 10 MB",
    ),
    Module(
      id: 'w4',
      moduleNumber: "04",
      title: "Panduan Frontend Dasar",
      description: "Dokumentasi komprehensif alur kerja frontend developer.",
      fullContent: "Panduan lengkap praktik terbaik dan referensi untuk frontend developer.",
      duration: "10 MB",
      status: ModuleStatus.belumMulai,
      type: ModuleType.pdf,
      insight: "Dokumentasi ini mencakup standar industri untuk penulisan kode.",
      nextTitle: "Selesai",
      nextSubtitle: "Selamat! Kamu telah menyelesaikan kurikulum ini.",
    ),
  ];

  static final _mobileModules = [
    Module(
      id: 'm1',
      moduleNumber: "01",
      title: "Pengenalan Dart",
      description: "Pahami dasar bahasa Dart sebelum masuk ke Flutter.",
      fullContent: "Dart adalah bahasa utama untuk membuat aplikasi Flutter. Modul ini membahas sintaks dan fitur dasar Dart.",
      duration: "40 Menit",
      status: ModuleStatus.sedangBerjalan,
      type: ModuleType.video,
      progress: 50,
      insight: "Menguasai Dart sangat krusial untuk membuat aplikasi Flutter yang optimal.",
      nextTitle: "Dasar UI Flutter",
      nextSubtitle: "Materi Video • 45 Menit",
    ),
    Module(
      id: 'm2',
      moduleNumber: "02",
      title: "Dasar UI Flutter",
      description: "Membuat tampilan antarmuka interaktif dengan widget Flutter.",
      fullContent: "Pelajari cara kerja Widget, Row, Column, dan Container di Flutter.",
      duration: "45 Menit",
      status: ModuleStatus.belumMulai,
      type: ModuleType.video,
      insight: "Everything in Flutter is a Widget!",
      nextTitle: "State Management",
      nextSubtitle: "Materi Video • 60 Menit",
    ),
    Module(
      id: 'm3',
      moduleNumber: "03",
      title: "State Management",
      description: "Manajemen state aplikasi menggunakan Riverpod.",
      fullContent: "State management penting untuk memisahkan UI dan logika bisnis.",
      duration: "60 Menit",
      status: ModuleStatus.belumMulai,
      type: ModuleType.video,
      insight: "Riverpod membuat manajemen state menjadi lebih aman dan dapat diprediksi.",
      nextTitle: "API Integration",
      nextSubtitle: "Materi PDF • 5 MB",
    ),
    Module(
      id: 'm4',
      moduleNumber: "04",
      title: "API Integration",
      description: "Menghubungkan aplikasi Flutter dengan REST API.",
      fullContent: "Panduan lengkap menghubungkan aplikasi mobile dengan backend.",
      duration: "5 MB",
      status: ModuleStatus.belumMulai,
      type: ModuleType.pdf,
      insight: "Aplikasi mobile modern membutuhkan data yang dinamis dari server.",
      nextTitle: "Selesai",
      nextSubtitle: "Selamat! Kamu telah menyelesaikan kurikulum ini.",
    ),
  ];

  static final _aiModules = [
    Module(
      id: 'a1',
      moduleNumber: "01",
      title: "Pengenalan Python",
      description: "Bahasa pemrograman paling populer di bidang Data Science dan AI.",
      fullContent: "Pelajari fundamental Python, struktur data dasar, dan sintaks utama.",
      duration: "40 Menit",
      status: ModuleStatus.sedangBerjalan,
      type: ModuleType.video,
      progress: 30,
      insight: "Python mudah dibaca dan memiliki ekosistem AI yang paling lengkap.",
      nextTitle: "Data Science Dasar",
      nextSubtitle: "Materi Video • 50 Menit",
    ),
    Module(
      id: 'a2',
      moduleNumber: "02",
      title: "Data Science Dasar",
      description: "Eksplorasi data menggunakan Pandas dan NumPy.",
      fullContent: "Belajar cara membersihkan, memanipulasi, dan memvisualisasikan data.",
      duration: "50 Menit",
      status: ModuleStatus.belumMulai,
      type: ModuleType.video,
      insight: "Data yang bersih adalah kunci utama dari Machine Learning yang akurat.",
      nextTitle: "Machine Learning",
      nextSubtitle: "Materi Video • 60 Menit",
    ),
    Module(
      id: 'a3',
      moduleNumber: "03",
      title: "Machine Learning",
      description: "Algoritma pembelajaran mesin dengan Scikit-Learn.",
      fullContent: "Memahami Supervised dan Unsupervised Learning.",
      duration: "60 Menit",
      status: ModuleStatus.belumMulai,
      type: ModuleType.video,
      insight: "Machine Learning memberdayakan komputer untuk belajar tanpa diprogram secara eksplisit.",
      nextTitle: "Deep Learning Intro",
      nextSubtitle: "Materi PDF • 15 MB",
    ),
    Module(
      id: 'a4',
      moduleNumber: "04",
      title: "Deep Learning Intro",
      description: "Pengenalan Jaringan Saraf Tiruan dengan TensorFlow.",
      fullContent: "Panduan dasar neural network untuk pengenalan citra dan teks.",
      duration: "15 MB",
      status: ModuleStatus.belumMulai,
      type: ModuleType.pdf,
      insight: "Deep Learning adalah fondasi dari AI modern seperti ChatGPT.",
      nextTitle: "Selesai",
      nextSubtitle: "Selamat! Kamu telah menyelesaikan kurikulum ini.",
    ),
  ];

  void markAsComplete(String moduleId) {
    int index = state.indexWhere((m) => m.id == moduleId);
    if (index != -1) {
      List<Module> newList = [...state];
      
      newList[index] = newList[index].copyWith(status: ModuleStatus.selesai, progress: 100);
      
      if (index + 1 < newList.length) {
        newList[index + 1] = newList[index + 1].copyWith(status: ModuleStatus.sedangBerjalan);
      }
      
      state = newList;
    }
  }
}

final moduleProvider = StateNotifierProvider<ModuleNotifier, List<Module>>((ref) {
  final track = ref.watch(selectedTrackProvider);
  return ModuleNotifier(track: track);
});