enum ModuleStatus { selesai, sedangBerjalan, belumMulai }
enum ModuleType { video, pdf } // Tambahkan tipe materi

class Module {
  final String id;
  final String title;
  final String description;
  final String fullContent;
  final String duration;
  final ModuleStatus status;
  final ModuleType type; // Tambahkan field tipe
  final int progress;
  final String moduleNumber;
  final String insight; 
  final String nextTitle;
  final String nextSubtitle;

  const Module({
    required this.id,
    required this.title,
    required this.description,
    required this.fullContent,
    required this.duration,
    required this.status,
    required this.type, // Wajib diisi
    required this.moduleNumber,
    this.progress = 0,
    this.insight = "",
    this.nextTitle = "",
    this.nextSubtitle = "",
  });

  Module copyWith({ModuleStatus? status, int? progress}) {
    return Module(
      id: id,
      title: title,
      description: description,
      fullContent: fullContent,
      duration: duration,
      status: status ?? this.status,
      type: type, // Tipe tetap sama
      progress: progress ?? this.progress,
      moduleNumber: moduleNumber,
      insight: insight, 
      nextTitle: nextTitle, 
      nextSubtitle: nextSubtitle,
    );
  }
}