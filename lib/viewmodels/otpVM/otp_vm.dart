import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  Widget pin(
    final String? Function(String?)? validator,
    final Function(String?)? onCompleted,
  ) {
    final borderColor = AppColors.primaryColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Style.regular14ptb,
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    final preFilledWidget = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.greyShade.withOpacity(0.10),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    return Pinput(
      length: 6,
      pinAnimationType: PinAnimationType.slide,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      showCursor: true,
      cursor: cursor,
      preFilledWidget: preFilledWidget,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      onCompleted: onCompleted,
    );
  }

  navigateToNewPassWord() {
    navigationService.navigateToNewPasswordView();
  }
}
