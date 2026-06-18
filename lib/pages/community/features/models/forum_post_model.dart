class ForumPostModel {
  final String category;
  final String title;
  final String description;
  final String time;
  final int replies;
  final int likes;
  final int views;

  const ForumPostModel({
    required this.category,
    required this.title,
    required this.description,
    required this.time,
    required this.replies,
    required this.likes,
    this.views = 0,
  });
}


