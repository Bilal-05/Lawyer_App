import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';

class ForgotVM extends BaseViewModel {
  String forgot = 'assets/JSON/Sofa.json';
  TextFieldService textFieldService = locator<TextFieldService>();
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
