import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    required this.onClick,
    required this.label,
    Color? textColor,
    Color? backColor,
    double fontSize = 16.0,
    double iconSize = 18.0,
    double height = 50.0,
    double radius = 10.0,
    this.enableBorder = false,
    this.borderColor,
    String? assetIcon,
    IconData? icon,
    Key? key,
  }) : super(key: key) {
    this.textColor = textColor ?? const Color(0xff101c5d);
    this.fontSize = fontSize;
    this.height = height;
    this.iconSize = iconSize;
    this.radius = radius;
    this.icon = icon;
    this.assetIcon = assetIcon;

    backgroundColor = backColor ?? AppColors.mainColor;
  }

  final Function() onClick;
  final String label;
  String? assetIcon;
  IconData? icon;
  Color? borderColor;
  late Color textColor, backgroundColor;
  late double fontSize, height, radius,iconSize;
  bool enableBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(.5),
      decoration: BoxDecoration(
        color: backgroundColor,
        // boxShadow: myShadow(opacity: .2),
        border: Border.all(color: borderColor??backgroundColor, width: enableBorder ? 1.0 : 0.0),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: onClick,
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                color: textColor,
                height: 2,
                fontSize: fontSize,
              ),
            ),
            if (assetIcon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  assetIcon!,
                  height: iconSize,
                  fit: BoxFit.fill,
                  color: textColor,
                ),
              ),
            if (icon != null)
              Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    icon,
                    color: textColor,
                    size: iconSize,
                  )),
          ],
        ),
      ),
    );
  }
}

