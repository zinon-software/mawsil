import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dependencies.dart' as dep;
import 'routes.dart';
import 'src/controllers/popular_product_controller.dart';
import 'src/controllers/recommended_product_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(
      builder: (context) {
        return GetBuilder<RecommendedProductController>(
          builder: (context) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              initialRoute: RouteHelper.getSplashPage,
              getPages: RouteHelper.routes,
            );
          }
        );
      }
    );
  }
}

