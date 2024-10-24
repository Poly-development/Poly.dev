import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:poly_dev/repositories/entity.dart';
import 'package:poly_dev/repositories/questions.dart';

part 'questionnaire_page_event.dart';

part 'questionnaire_page_state.dart';

class QuestionnairePageBloc
    extends Bloc<QuestionnairePageEvent, QuestionnairePageState> {
  final BuildContext context;
  final _questionsRepository = GetIt.I<QuestionsRepository>();

  QuestionnairePageBloc(this.context) : super(QuestionnairePageInitialState()) {
    on<LoadQuestionsListEvent>(
      (event, emit) async {
        emit(QuestionnairePageLoadingState());

        var questions = await _questionsRepository.getQuestions();
        emit(LoadedQuestionListState(questions));
      },
    );
  }
}
