import 'package:flutter/material.dart';

import 'package:poly_dev/features/start_pages/widgets/auth_text_field.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class FullNameFormBlock extends StatelessWidget {
  const FullNameFormBlock({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.middleNameController,
  });

  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController middleNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          hintText: 'Фамилия',
          controller: lastNameController,
        ),
        const SizedBox(
          height: spaceBetweenTextFields,
        ),
        AuthTextField(
          hintText: 'Имя',
          controller: firstNameController,
        ),
        const SizedBox(
          height: spaceBetweenTextFields,
        ),
        AuthTextField(
          hintText: 'Отчество',
          controller: middleNameController,
        ),
      ],
    );
  }
}
