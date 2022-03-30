import 'package:flutter/material.dart';

import 'components/app_bar.dart';
import 'components/slide_show.dart';

class MainFoodView extends StatelessWidget {
  const MainFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            AppBarMainView(),
            SlideShowMainView(),
          ],
        ),
      ),
    );
  }
}
