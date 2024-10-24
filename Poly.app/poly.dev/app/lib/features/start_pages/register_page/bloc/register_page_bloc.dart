import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poly_dev/repositories/auth.dart';
import 'package:poly_dev/repositories/dto.dart';

part 'register_page_event.dart';

part 'register_page_state.dart';

class RegisterPageBloc extends Bloc<RegisterPageEvent, RegisterPageState> {
  final BuildContext context;
  final authRepository = GetIt.I<AuthRepository>();

  RegisterPageBloc(this.context) : super(RegisterPageInitState()) {
    on<TryRegisterUserEvent>(
      (event, emit) async {
        emit(RegisterPageLoadingState());

        try {
          var jwtResponse = await authRepository.register(event.request);

          log("Successful registration");
          log("Token: ${jwtResponse.token}");

          _openQuestionnairePage();
          return;
        } on DioException catch (e) {
          log("Registration error");
          log("${e.message}");
        }

        emit(RegisterPageInitState());
      },
    );
  }

  void _openQuestionnairePage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/questionnaire',
      (route) => false,
    );
  }
}
