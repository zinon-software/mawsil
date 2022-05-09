import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import '../widgets/default_button.dart';
import 'app_colors.dart';

void openDialog(String title,
    {String? message,
    String okText = 'موافق',
    String? args,
    String cancelText = 'إلغاء الأمر',
    bool showCancelButton = false}) {
  Get.defaultDialog(
    title: title,
    middleText: message ?? " ",
    backgroundColor: AppColors.mainColor,
    textConfirm: okText,
    textCancel: cancelText,
    cancelTextColor: Colors.white,
    confirmTextColor: Colors.white,
    // barrierDismissible: false,
    // titleStyle: const TextStyle(color: Colors.white),
    // middleTextStyle: const TextStyle(color: Colors.white),
    radius: 30,
  );
}

Widget errorWidget(
    {bool noData = true,
    bool showBut = true,
    String? msg,
    String? svg,
    String butMsg = 'إعادة المحاولة',
    required Function() onClick}) {
  String img = svg ??
      (noData
          ? 'assets/image/errors/no-data.svg'
          : 'assets/images/errors/no-connection.svg');
  String test =
      msg ?? (noData ? 'لا توجد بيانات' : 'الرجاء التحقق من إتصالك بالأنترنت');

 const double padding = 16.0;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SvgPicture.asset(
        img,
        height: 200.0,
      ),
      const SizedBox(
        height: padding / 2,
      ),
      Text(test),
      const SizedBox(
        height: padding / 2,
      ),
      if (showBut)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: padding * 4),
          child: 
          DefaultButton(
            onClick: onClick,
            label: butMsg,
            height: 40.0,
          ),
        ),
    ],
  );
}


