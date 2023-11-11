import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();
  String google = 'assets/svg/google.svg';

  Widget customTextFormField(
    TextEditingController controller,
    String hintText,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      controller: controller,
      style: Style.medium16ptb,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: Style.medium16ptb,
        fillColor: const Color(0xff626262).withOpacity(0.10),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: const Color(0xff626262).withOpacity(0.10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 3,
          ),
        ),
      ),
      validator: validator,
    );
  }

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  var b2style = ElevatedButton.styleFrom(
    backgroundColor: const Color(0xffECECEC),
    fixedSize: const Size(300, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  navigateToLoginView() {
    navigationService.navigateToLoginView();
  }
}
