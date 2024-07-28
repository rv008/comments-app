import 'package:comments_app/provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommentScreen extends ConsumerWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const Center(
        child: Text('Comment'),
      ),
    );
  }
}
