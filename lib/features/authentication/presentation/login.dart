import 'package:comments_app/features/authentication/presentation/provider/login.dart';
import 'package:comments_app/features/authentication/presentation/widgets/login_form.dart';
import 'package:comments_app/features/comments/presentation/comment.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool?>>(loginNotifierProvider, (previous, next) {
      next.when(
        data: (loggedIn) {
          if (loggedIn == null) return;
          if (loggedIn == true) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const CommentScreen()),
              (p) => false,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid login credentials')),
            );
          }
        },
        error: (e, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString())),
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Comments',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: LoginForm(),
      ),
    );
  }
}
