import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poly_dev/features/start_pages/auth_page/bloc/auth_page_bloc.dart';
import 'package:poly_dev/features/start_pages/widgets/credentials_form_block.dart';
import 'package:poly_dev/features/start_pages/widgets/top_block.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  static const double _formBoxHeight = 156.0;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthPageBloc>(
      create: (context) => AuthPageBloc(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<AuthPageBloc, AuthPageState>(
          builder: (context, state) {
            if (state is AuthPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        spaceFromTopPercent,
                  ),
                  const TopBlock(
                    titleText: 'Давно не виделись!',
                    descriptionText: 'Авторизуйся и возвращайся к работе.',
                  ),
                  const SizedBox(
                    height: spaceAfterTopBlock,
                  ),
                  SizedBox(
                    height: _formBoxHeight,
                    width:
                        MediaQuery.of(context).size.width * formBoxWidthPercent,
                    child: CredentialsFormBlock(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthPageBloc>(context).add(
                        TryAuthUserEvent(
                          emailController.text,
                          passwordController.text,
                        ),
                      );
                    },
                    child: const Text('Войти'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
