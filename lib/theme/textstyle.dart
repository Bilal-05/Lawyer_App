import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/colors.dart';

class Style {
  static var semiBold20ptw = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var semiBold20ptb = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static var medium16ptw = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static var regular16ptw = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static var semiBold35ptb = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static var semiBold35ptw = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var medium16ptb = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static var medium20ptb = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );

  static var regular16ptb = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );

  static var bol30ptb = TextStyle(
    fontSize: 28.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
  );

  static var semiBold16ptb = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );

  static var semiBold14ptb = TextStyle(
    fontSize: 12.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}

// class CustomMQ {
//   static double customHeight(double size, BuildContext ctx) {
//     return MediaQuery.of(ctx).size.height * size;
//   }

//   static double customWidth(double size, BuildContext ctx) {
//     return MediaQuery.of(ctx).size.width * size;
//   }
// }
