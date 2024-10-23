import 'package:flutter/material.dart';
import 'package:poly_dev/routes/routes.dart';
import 'package:poly_dev/theme/app_theme.dart';

class PolyDevApp extends StatelessWidget {
  const PolyDevApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'poly.dev',
      theme: appTheme,
      routes: routes,
      initialRoute: '/start',
    );
  }
}
