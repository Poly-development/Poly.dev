import 'package:poly_dev/features/questionnaire_page.dart';
import 'package:poly_dev/features/start_page.dart';
import 'package:poly_dev/features/register_page.dart';
import 'package:poly_dev/features/auth_page.dart';

var routes = {
  '/start': (context) => const StartPage(),
  '/register': (context) => const RegisterPage(),
  '/auth': (context) => const AuthPage(),
  '/questionnaire': (context) => const QuestionnairePage(),
};
