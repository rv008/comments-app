import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';
import 'package:comments_app/features/comments/presentation/widgets/email_mask.dart';
import 'package:comments_app/features/comments/presentation/widgets/label_text.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({super.key, required this.comment});

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Text((comment.name?[0] ?? '').toUpperCase()),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelValueText(label: 'Name : ', value: '${comment.name}'),
                EmailMaskWidget(email: '${comment.email}'),
                const SizedBox(height: 3),
                Text(
                  '${comment.body}',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
