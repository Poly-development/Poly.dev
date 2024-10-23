import 'package:flutter/material.dart';

class StartButtonsBlock extends StatelessWidget {
  const StartButtonsBlock({super.key});

  static const double _spaceBetweenButtons = 16.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StartButton(
          text: 'Вступить в команду!',
          onPressed: () => Navigator.of(context).pushNamed('/register'),
        ),
        const SizedBox(
          height: _spaceBetweenButtons,
        ),
        StartButton(
          text: 'Войти',
          onPressed: () => Navigator.of(context).pushNamed("/auth"),
        ),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;
  static const double _buttonsRadius = 5.0;
  static const double _buttonWidthPercent = 0.8;
  static const double _buttonTextSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_buttonsRadius),
          ),
        ),
        fixedSize: WidgetStatePropertyAll<Size>(
          Size.fromWidth(
              MediaQuery.of(context).size.width * _buttonWidthPercent),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: _buttonTextSize,
        ),
      ),
    );
  }
}
