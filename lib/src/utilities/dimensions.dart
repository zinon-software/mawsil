import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // static double pageView = screenHeight/(screenHeight/320); // <= 844/(844/220)
  // static double pageViewContainer = screenHeight/3.84; // <= 844/(844/220)
  // static double pageViewTextContainer = screenHeight/7.03; // <= 844/(844/120)


  static double heightDynamic(double size){
    double x = 844 / size;
    return screenHeight / x;
  }

  static double widthDynamic(double size){
    double x = screenWidth / size;
    // print("x =");
    // print(x);
    // print("screenWidth/x");
    // print(screenWidth/x);
    return screenWidth / x;
  }

}