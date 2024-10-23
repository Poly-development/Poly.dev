import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poly_dev/features/start_pages/register_page/bloc/register_page_bloc.dart';
import 'package:poly_dev/features/start_pages/register_page/widgets/contacts_form_block.dart';
import 'package:poly_dev/features/start_pages/register_page/widgets/full_name_form_block.dart';
import 'package:poly_dev/features/start_pages/register_page/widgets/institute_form_block.dart';
import 'package:poly_dev/features/start_pages/widgets/credentials_form_block.dart';

import 'package:poly_dev/features/start_pages/widgets/top_block.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static const int _changePageAnimationDuration = 250;
  static const double _formBoxHeight = 224.0;

  final _pageController = PageController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _instituteController = TextEditingController();
  final _directionController = TextEditingController();
  final _courseController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _vkController = TextEditingController();
  final _tgController = TextEditingController();

  late final List<Widget> _pages = [
    FullNameFormBlock(
      firstNameController: _firstNameController,
      lastNameController: _lastNameController,
      middleNameController: _middleNameController,
    ),
    CredentialsFormBlock(
      emailController: _emailController,
      passwordController: _passwordController,
    ),
    InstituteDataBlock(
      instituteController: _instituteController,
      directionController: _directionController,
      courseController: _courseController,
    ),
    ContactsDataBlock(
      vkController: _vkController,
      tgController: _tgController,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterPageBloc>(
      create: (context) => RegisterPageBloc(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<RegisterPageBloc, RegisterPageState>(
          builder: (context, state) {
            if (state is RegisterPageLoadingState) {
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
                    titleText: 'Круто!',
                    descriptionText: 'Давай познакомимся',
                  ),
                  const SizedBox(
                    height: spaceAfterTopBlock,
                  ),
                  SizedBox(
                    height: _formBoxHeight,
                    width:
                        MediaQuery.of(context).size.width * formBoxWidthPercent,
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: _pages,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(
                              milliseconds: _changePageAnimationDuration,
                            ),
                            curve: Curves.linear,
                          );
                        },
                        child: const Text('Назад'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_pageController.page == (_pages.length - 1)) {
                            BlocProvider.of<RegisterPageBloc>(context).add(
                              TryRegisterUserEvent(
                                _firstNameController.text,
                                _lastNameController.text,
                                _middleNameController.text,
                                _instituteController.text,
                                _directionController.text,
                                _courseController.text,
                                _emailController.text,
                                _passwordController.text,
                                _vkController.text,
                                _tgController.text,
                              ),
                            );

                            return;
                          }

                          _pageController.nextPage(
                            duration: const Duration(
                              milliseconds: _changePageAnimationDuration,
                            ),
                            curve: Curves.linear,
                          );
                        },
                        child: const Text('Вперед'),
                      ),
                    ],
                  )
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
    _pageController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleNameController.dispose();
    _instituteController.dispose();
    _directionController.dispose();
    _courseController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _vkController.dispose();
    _tgController.dispose();

    super.dispose();
  }
}
