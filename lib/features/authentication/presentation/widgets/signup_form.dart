import 'package:comments_app/features/authentication/presentation/provider/signup.dart';
import 'package:comments_app/utils/validator.dart';
import 'package:comments_app/widgets/loader.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupForm extends HookConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final obscureText = useState(true);

    final signupStatus = ref.watch(signupNotifierProvider);

    return Form(
      key: formKey,
      child: Column(
        children: [
          const Spacer(flex: 1),
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.words,
            validator: Validator.validateEmpty,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validator.validateEmail,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: obscureText.value,
            validator: Validator.validatePassword,
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
            onPressed: signupStatus.isLoading
                ? () {}
                : () {
                    if (formKey.currentState!.validate()) {
                      ref.read(signupNotifierProvider.notifier).signup(
                            nameController.text.trim(),
                            emailController.text.trim(),
                            passwordController.text.trim(),
                          );
                    }
                  },
            child: signupStatus.isLoading
                ? const WhiteLoadingWidget()
                : const Text('Signup'),
          ),
          const SizedBox(height: 10),
          const LoginText(),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(fontSize: 16),
        children: [
          const TextSpan(text: 'Already have an account? '),
          TextSpan(
            text: 'Login',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context).pop();
              },
          ),
        ],
      ),
    );
  }
}
