import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:poly_dev/repositories/auth.dart';
import 'package:poly_dev/repositories/dto.dart';

part 'auth_page_event.dart';

part 'auth_page_state.dart';

class AuthPageBloc extends Bloc<AuthPageEvent, AuthPageState> {
  final BuildContext context;

  AuthPageBloc(this.context) : super(AuthPageInitState()) {
    on<TryAuthUserEvent>(
      (event, emit) async {
        emit(AuthPageLoadingState());
        try {
          JwtResponse response = await GetIt.I<AuthRepository>().auth(
              event.request);

          log("Successful authentication");
          log("Token: ${response.token}");
        } on DioException catch(e) {
          log("Authentication error");
          log("${e.message}");
        }

        emit(AuthPageInitState());
      },
    );
  }
}
