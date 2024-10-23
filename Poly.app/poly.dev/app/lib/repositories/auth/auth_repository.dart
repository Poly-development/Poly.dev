import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poly_dev/repositories/dto.dart';

class AuthRepository {
  static const signUpUrl = "/auth/signup";
  static const signInUrl = "/auth";

  final dio = GetIt.I<Dio>();

  Future<JwtResponse> register(SignUpRequest request) async {
    Response<Map<String, dynamic>> response = await dio.post(
      signUpUrl,
      data: request.toJson(),
    );

    return JwtResponse.fromJson(response.data!);
  }

  Future<JwtResponse> auth(SignInRequest request) async {
    Response<Map<String, dynamic>> response = await dio.post(
      signInUrl,
      data: request.toJson(),
    );

    return JwtResponse.fromJson(response.data!);
  }
}
