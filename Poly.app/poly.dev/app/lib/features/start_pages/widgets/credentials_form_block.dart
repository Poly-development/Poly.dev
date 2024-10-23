import 'package:flutter/material.dart';
import 'package:poly_dev/features/start_pages/widgets/auth_text_field.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class CredentialsFormBlock extends StatelessWidget {
  const CredentialsFormBlock({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          controller: emailController,
          hintText: 'Электронная почта',
        ),
        const SizedBox(
          height: spaceBetweenTextFields,
        ),
        AuthTextField(
          controller: passwordController,
          hintText: 'Пароль',
          obscureText: true,
        ),
      ],
    );
  }
}
