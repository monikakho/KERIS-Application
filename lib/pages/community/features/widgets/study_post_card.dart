import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../models/forum_post_model.dart';

class StudyPostCard extends StatelessWidget {
  final ForumPostModel post;
  final bool highlighted;
  final bool compact;
  final VoidCallback? onTap;

  const StudyPostCard({
    super.key,
    required this.post,
    this.highlighted = false,
    this.compact = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (highlighted) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.whiteCard,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color(0x10000000),
                blurRadius: 22,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 202,
                decoration: const BoxDecoration(
                  color: AppTheme.divider,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 22, 20, 20),
                  child: _HighlightedContent(post: post),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          compact ? 20 : 22,
          compact ? 22 : 24,
          compact ? 20 : 22,
          0,
        ),
        decoration: BoxDecoration(
          color: AppTheme.whiteCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0B000000),
              blurRadius: 16,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.category.toUpperCase(),
              style: AppTheme.label(
                fontSize: compact ? 10 : 10.5,
                color: AppTheme.categoryBrown,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              post.title,
              style: AppTheme.cardTitle(
                fontSize: compact ? 15.5 : 17,
              ).copyWith(
                height: 1.33,
                letterSpacing: -0.25,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              post.description,
              style: AppTheme.body(
                fontSize: compact ? 12.3 : 13.2,
              ).copyWith(
                height: 1.48,
              ),
            ),
            const SizedBox(height: 20),
            _StatsRow(
              replies: post.replies,
              likes: post.likes,
              showAvatars: false,
            ),
            const SizedBox(height: 18),
            Container(
              height: 1,
              width: double.infinity,
              color: const Color(0xFFE9EAEC),
            ),
          ],
        ),
      ),
    );
  }
}

class _HighlightedContent extends StatelessWidget {
  final ForumPostModel post;

  const _HighlightedContent({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 13,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFDCE2FF),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Text(
                post.category.toUpperCase(),
                style: AppTheme.label(
                  fontSize: 9.5,
                  color: const Color(0xFF294A87),
                ).copyWith(
                  letterSpacing: 0.6,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                post.time,
                overflow: TextOverflow.ellipsis,
                style: AppTheme.body(fontSize: 12).copyWith(
                  color: AppTheme.bodyGrey,
                  height: 1.2,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 19),
        Text(
          post.title,
          style: AppTheme.cardTitle(fontSize: 20).copyWith(
            height: 1.25,
            letterSpacing: -0.45,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          post.description,
          style: AppTheme.body(fontSize: 13.2).copyWith(
            height: 1.45,
          ),
        ),
        const SizedBox(height: 19),
        _StatsRow(
          replies: post.replies,
          likes: post.likes,
          showAvatars: true,
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  final int replies;
  final int likes;
  final bool showAvatars;

  const _StatsRow({
    required this.replies,
    required this.likes,
    required this.showAvatars,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.chat_bubble_outline,
          color: Color(0xFF6E83A3),
          size: 20,
        ),
        const SizedBox(width: 6),
        Text(
          '$replies',
          style: AppTheme.navbar(fontSize: 12.5).copyWith(
            color: const Color(0xFF6E83A3),
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(width: 18),
        const Icon(
          Icons.favorite_border,
          color: Color(0xFF6E83A3),
          size: 21,
        ),
        const SizedBox(width: 6),
        Text(
          '$likes',
          style: AppTheme.navbar(fontSize: 12.5).copyWith(
            color: const Color(0xFF6E83A3),
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        if (showAvatars) const _AvatarStack(),
      ],
    );
  }
}

class _AvatarStack extends StatelessWidget {
  const _AvatarStack();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 32,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            child: _SmallAvatar(
              imagePath: 'assets/image/joshua.png',
            ),
          ),
          const Positioned(
            left: 20,
            child: _SmallAvatar(
              imagePath: 'assets/image/jonathan.png',
            ),
          ),
          Positioned(
            left: 40,
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFE8EBF0),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  '+5',
                  style: AppTheme.navbar(fontSize: 10.5).copyWith(
                    color: AppTheme.headingNavy,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallAvatar extends StatelessWidget {
  final String imagePath;

  const _SmallAvatar({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 31,
      height: 31,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


