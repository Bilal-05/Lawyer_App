import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';

class AppBarService extends BaseViewModel {
  Widget customAppBar(
    String title,
    Widget? leading,
    Widget? action,
  ) {
    return SizedBox(
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 0.15.sw,
            child: leading ?? const SizedBox(),
          ),
          Text(
            title,
            style: Style.medium20ptb,
          ),
          Container(
            width: 0.15.sw,
            child: action ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
