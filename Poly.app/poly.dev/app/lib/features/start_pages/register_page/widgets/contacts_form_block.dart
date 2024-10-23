import 'package:flutter/material.dart';

import 'package:poly_dev/features/start_pages/widgets/auth_text_field.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class ContactsDataBlock extends StatelessWidget {
  const ContactsDataBlock({
    super.key,
    required this.vkController,
    required this.tgController,
  });

  final TextEditingController vkController;
  final TextEditingController tgController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          hintText: 'VK',
          controller: vkController,
        ),
        const SizedBox(
          height: spaceBetweenTextFields,
        ),
        AuthTextField(
          hintText: 'Telegram',
          controller: tgController,
        ),
      ],
    );
  }
}
