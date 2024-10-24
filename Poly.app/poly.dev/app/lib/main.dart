import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:poly_dev/poly_dev_app.dart';
import 'package:poly_dev/repositories/auth.dart';
import 'package:poly_dev/repositories/questions.dart';
import 'package:poly_dev/repositories/users.dart';

const apiURL = "http://10.0.2.2:8080";
const connectionTimeout = 15;

Dio initDio() {
  var options = BaseOptions(
    baseUrl: apiURL,
    connectTimeout: const Duration(seconds: connectionTimeout),
  );

  return Dio(options);
}

void registerSingletons() {
  GetIt.I.registerSingleton(initDio());
  GetIt.I.registerSingleton(AuthRepository());
  GetIt.I.registerSingleton(QuestionsRepository());
  GetIt.I.registerSingleton(UsersRepository());
}

void main() {
  registerSingletons();

  runApp(const PolyDevApp());
}
