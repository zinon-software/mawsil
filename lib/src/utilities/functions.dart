import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
