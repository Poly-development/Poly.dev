import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poly_dev/features/questionnaire_page/bloc/questionnaire_page_bloc.dart';
import 'package:poly_dev/features/questionnaire_page/widgets/question_tile.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  final _questionControllers = <int, TextEditingController>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<QuestionnairePageBloc>(
        create: (context) =>
            QuestionnairePageBloc(context)..add(LoadQuestionsListEvent()),
        child: BlocBuilder<QuestionnairePageBloc, QuestionnairePageState>(
          builder: (context, state) {
            if (state is LoadedQuestionListState) {
              return Column(
                children: [
                  const Text(
                    'Сейчас ты пройдешь небольшое собеседование в виде вопросов. Отвечай честно и развернуто, так можно вступить в объединение без лишних вопросов',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var controller = TextEditingController();
                        _questionControllers[state.questions[index].id] =
                            controller;

                        return QuestionTile(
                          question: state.questions[index],
                          controller: controller,
                        );
                      },
                      itemCount: state.questions.length,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _printTexts,
                    child: const Text('Продолжить'),
                  ),
                ],
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  void _printTexts() {
    _questionControllers.forEach((id, controller) {
      log('id: $id');
      log('text: ${controller.text}');
    });
  }

  @override
  void dispose() {
    super.dispose();

    _questionControllers.forEach((_, controller) => controller.dispose);
  }
}
