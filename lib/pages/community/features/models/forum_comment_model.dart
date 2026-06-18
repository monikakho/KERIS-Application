class ForumCommentModel {
  final String name;
  final String time;
  final String comment;
  final String? code;
  final int likes;
  final bool alignRight;
  final bool lightCode;
  final String imagePath;

  const ForumCommentModel({
    required this.name,
    required this.time,
    required this.comment,
    this.code,
    required this.likes,
    required this.imagePath,
    this.alignRight = false,
    this.lightCode = false,
  });
}


