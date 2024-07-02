// // lib/widgets/custom_button.dart

// import 'package:flutter/material.dart';

// import '../themes/app_color.dart';

// class CustomButton extends StatelessWidget {
//   final String text;

//   final double? fontSize;
//   final double? borderRadius;
//   final Color? textColor, bgColor;
//   final VoidCallback onPressed;

//   const CustomButton({
//     super.key,
//     required this.text,
//     this.borderRadius,
//     this.fontSize,
//     this.textColor,
//     this.bgColor,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         padding: EdgeInsets.zero,
//         backgroundColor: bgColor ?? AppColor.kPrimary,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius ?? 30),
//           side: BorderSide(strokeAlign: 0, color: AppColor.kBorderColor),
//         ),
//       ),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: fontSize ?? 18,
//           color: textColor ?? Colors.white,
//         ),
//       ),
//     );
//   }
// }

// lib/widgets/custom_button.dart

import 'package:flutter/material.dart';

import '../themes/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;

  final double? height;

  final double? width;
  final double? fontSize;

  final double? borderRadius;
  final Color? textColor;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.borderRadius,
    this.fontSize,
    this.textColor,
    this.gradientColors,
    this.borderColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
          side: BorderSide(
              strokeAlign: 0, color: borderColor ?? AppColor.kBorderColor),
        ),
      ),
      child: Container(
        width: width ?? 500,
        height: height ?? 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors ??
                [AppColor.kPrimary.withOpacity(0.5), AppColor.kButtonColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            // stops: const [0.6, 0.4],
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
        ),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 18,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
