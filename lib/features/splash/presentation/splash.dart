import 'package:comments_app/features/authentication/presentation/login.dart';
import 'package:comments_app/features/comments/presentation/comment.dart';
import 'package:comments_app/features/splash/presentation/provider/auth_stream.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var stream = ref.watch(authStreamProvider);

    return stream.when(
      data: (status) {
        return status ? const CommentScreen() : const LoginScreen();
      },
      error: (e, s) => const SplashLoader(),
      loading: () => const SplashLoader(),
    );
  }
}

class SplashLoader extends StatelessWidget {
  const SplashLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 80,
        ),
      ),
    );
  }
}
