import 'package:flutter/material.dart';
import 'package:poly_dev/features/start_pages/widgets/auth_text_field.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class InstituteDataBlock extends StatelessWidget {
  const InstituteDataBlock({
    super.key,
    required this.instituteController,
    required this.directionController,
    required this.courseController,
  });

  final TextEditingController instituteController;
  final TextEditingController directionController;
  final TextEditingController courseController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          controller: instituteController,
          hintText: 'Институт',
        ),
        const SizedBox(
          height: spaceBetweenTextFields,
        ),
        AuthTextField(
          controller: directionController,
          hintText: 'Направление',
        ),
        const SizedBox(
          height: spaceBetweenTextFields,
        ),
        AuthTextField(
          controller: courseController,
          hintText: 'Курс',
        ),
      ],
    );
  }
}
