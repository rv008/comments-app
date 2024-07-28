import 'package:comments_app/features/authentication/presentation/provider/login.dart';
import 'package:comments_app/features/authentication/presentation/signup.dart';
import 'package:comments_app/utils/validator.dart';
import 'package:comments_app/widgets/loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final obscureText = useState(true);

    final loginState = ref.watch(loginNotifierProvider);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Spacer(flex: 1),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validator.validateEmail,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            validator: Validator.validateEmpty,
            obscureText: obscureText.value,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText.value ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () => obscureText.value = !obscureText.value,
              ),
            ),
          ),
          const Spacer(flex: 2),
          FilledButton(
            onPressed: loginState.isLoading
                ? () {}
                : () {
                    if (formKey.currentState!.validate()) {
                      ref.read(loginNotifierProvider.notifier).login(
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                    }
                  },
            child: loginState.isLoading
                ? const WhiteLoadingWidget()
                : const Text('Login'),
          ),
          const SizedBox(height: 10),
          const SignupText(),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

class SignupText extends StatelessWidget {
  const SignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(fontSize: 16),
        children: [
          const TextSpan(text: 'New here? '),
          TextSpan(
            text: 'Signup',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
          ),
        ],
      ),
    );
  }
}
