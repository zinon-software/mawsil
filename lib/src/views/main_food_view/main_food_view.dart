import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/list_food.dart';
import 'components/recommende.dart';
import 'components/slide_show.dart';

class MainFoodView extends StatelessWidget {
  const MainFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            const AppBarMainView(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    // slide show food
                    SlideShowMainView(),
                    // recommended titel
                    RecommendedMainView(),
                    // recommended food
                    // list of food and image
                    ListFoodMainView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
