import 'package:flutter/material.dart';

import 'package:poly_dev/repositories/entity.dart';

class QuestionTile extends StatefulWidget {
  const QuestionTile({
    super.key,
    required this.question,
    required this.controller,
  });

  final Questions question;
  final TextEditingController controller;

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question.isOptional
              ? '${widget.question.text} (необязательно)'
              : widget.question.text,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        TextField(
          controller: widget.controller,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
