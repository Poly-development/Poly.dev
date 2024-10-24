import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class UsersRepository {
  final _dio = GetIt.I<Dio>();
  final _hasAnswersUrl = '/users/has_answers';

  Future<bool> hasAnswers() async {
    Response<bool> response = await _dio.get(_hasAnswersUrl);
    return response.data!;
  }
}
