import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:poly_dev/repositories/entity.dart';

class QuestionsRepository {
  final _dio = GetIt.I<Dio>();
  static const _getQuestionsUrl = '/questions';

  Future<List<Questions>> getQuestions() async {
    Response<List<dynamic>> response = await _dio.get(_getQuestionsUrl);

    return response.data!
        .map((json) => Questions.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
