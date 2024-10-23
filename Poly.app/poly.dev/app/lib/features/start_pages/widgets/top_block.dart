import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class TopBlock extends StatelessWidget {
  const TopBlock({
    super.key,
    required this.titleText,
    required this.descriptionText,
  });

  static const double _logoWidthPercent = 0.35;
  static const double _titleTextSizePercent = 0.1;
  static const double _descriptionTextBoxWidthPercent = 0.8;
  static const double _spaceBetweenLogoAndTitleText = 8.0;
  static const double _descriptionTextFontSize = 22.0;

  final String titleText;
  final String descriptionText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svg/poly_dev_main_logo.svg',
          width: MediaQuery.of(context).size.width * _logoWidthPercent,
        ),
        const SizedBox(
          height: _spaceBetweenLogoAndTitleText,
        ),
        Text(
          titleText,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * _titleTextSizePercent,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * _descriptionTextBoxWidthPercent,
          child: Text(
            descriptionText,
            // textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: _descriptionTextFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
