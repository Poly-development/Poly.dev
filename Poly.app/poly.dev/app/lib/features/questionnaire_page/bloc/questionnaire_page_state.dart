part of 'questionnaire_page_bloc.dart';

abstract class QuestionnairePageState {}

class QuestionnairePageInitialState extends QuestionnairePageState {}

class LoadedQuestionListState extends QuestionnairePageState {
  LoadedQuestionListState(this.questions);

  final List<Questions> questions;
}

class QuestionnairePageLoadingState extends QuestionnairePageState {}
