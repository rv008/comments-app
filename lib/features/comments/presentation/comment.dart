import 'package:comments_app/features/comments/domain/entity/comment_entity.dart';
import 'package:comments_app/features/comments/presentation/widgets/comment_card.dart';
import 'package:comments_app/features/comments/presentation/provider/comment.dart';
import 'package:comments_app/provider.dart';
import 'package:comments_app/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentScreen extends ConsumerWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var comments = ref.watch(commentNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('Comments'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(firebaseAuthServiceProvider).signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: comments.when(
        data: (data) => CommentListView(comments: data),
        error: (e, s) => const Center(child: Text('Failed to load comments')),
        loading: () => const LoadingWidget(),
      ),
    );
  }
}

class CommentListView extends StatelessWidget {
  const CommentListView({super.key, required this.comments});

  final List<CommentEntity> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final CommentEntity comment = comments[index];
        return CommentCard(comment: comment);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15),
    );
  }
}
