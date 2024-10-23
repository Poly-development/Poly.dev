import 'package:flutter/material.dart';
import 'package:poly_dev/features/start_pages/start_page/widgets/start_buttons_block.dart';

import 'package:poly_dev/features/start_pages/widgets/top_block.dart';
import 'package:poly_dev/features/start_pages/constants/common_constants.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * spaceFromTopPercent,
            ),
            const TopBlock(
              titleText: 'Привет!',
              descriptionText:
                  'Это приложение студенческого объединения poly.dev!',
            ),
            const SizedBox(
              height: spaceAfterTopBlock,
            ),
            const StartButtonsBlock(),
          ],
        ),
      ),
    );
  }
}
