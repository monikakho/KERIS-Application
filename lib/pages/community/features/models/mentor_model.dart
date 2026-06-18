class MentorModel {
  final String name;
  final String role;
  final String status;
  final bool isAvailable;
  final List<String> skills;
  final String imagePath;

  const MentorModel({
    required this.name,
    required this.role,
    required this.status,
    required this.isAvailable,
    required this.skills,
    required this.imagePath,
  });
}


