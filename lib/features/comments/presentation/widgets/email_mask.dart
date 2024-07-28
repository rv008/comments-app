import 'package:comments_app/features/comments/presentation/provider/email_mask.dart';
import 'package:comments_app/features/comments/presentation/widgets/label_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailMaskWidget extends ConsumerWidget {
  const EmailMaskWidget({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var maskedEmail = ref.watch(maskedEmailProvider(email));
    return maskedEmail.when(
      data: (masked) {
        return LabelValueText(
          label: 'Email : ',
          value: masked,
        );
      },
      loading: () => const LabelValueText(
        label: 'Email : ',
        value: '...',
      ),
      error: (error, stack) => const LabelValueText(
        label: 'Email : ',
        value: '...',
      ),
    );
  }
}
