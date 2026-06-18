import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

import '../models/forum_comment_model.dart';

class ForumCommentCard extends StatelessWidget {
  final ForumCommentModel comment;

  const ForumCommentCard({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxCardWidth = screenWidth * 0.68;

    final card = Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 16, 16),
      decoration: BoxDecoration(
        color: AppTheme.whiteCard,
        borderRadius: BorderRadius.circular(15),
        border: comment.alignRight
            ? null
            : const Border(
                left: BorderSide(
                  color: AppTheme.primaryOrange,
                  width: 3,
                ),
              ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x07000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: AppTheme.cardTitle(fontSize: 13).copyWith(
              height: 1.15,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            comment.time,
            style: AppTheme.body(fontSize: 10).copyWith(
              height: 1.2,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            comment.comment,
            style: AppTheme.body(fontSize: 12).copyWith(
              height: 1.45,
            ),
          ),
          if (comment.code != null) ...[
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: comment.lightCode
                    ? const Color(0xFFEFF3F8)
                    : AppTheme.headingNavy,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                comment.code!,
                style: AppTheme.body(fontSize: 10).copyWith(
                  color:
                      comment.lightCode ? AppTheme.headingNavy : Colors.white,
                  height: 1.35,
                ),
              ),
            ),
          ],
          const SizedBox(height: 13),
          Row(
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 13,
                color: AppTheme.categoryBrown,
              ),
              const SizedBox(width: 4),
              Text(
                '${comment.likes}',
                style: AppTheme.navbar(fontSize: 10).copyWith(
                  color: AppTheme.categoryBrown,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 14),
              const Icon(
                Icons.reply,
                size: 13,
                color: AppTheme.bodyGrey,
              ),
              const SizedBox(width: 4),
              Text(
                'Balas',
                style: AppTheme.navbar(fontSize: 10).copyWith(
                  color: AppTheme.bodyGrey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CommentAvatar(imagePath: comment.imagePath),
        const SizedBox(width: 14),
        Expanded(
          child: Align(
            alignment:
                comment.alignRight ? Alignment.center : Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxCardWidth,
              ),
              child: card,
            ),
          ),
        ),
      ],
    );
  }
}

class _CommentAvatar extends StatelessWidget {
  final String imagePath;

  const _CommentAvatar({
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(9),
      child: Container(
        width: 32,
        height: 32,
        color: AppTheme.headingNavy,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.person,
              color: Colors.white,
              size: 18,
            );
          },
        ),
      ),
    );
  }
}


