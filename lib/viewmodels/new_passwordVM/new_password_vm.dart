import 'package:flutter/material.dart';

import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';

class NewPasswordVM extends BaseViewModel {
  // final textFieldService = locator<TextFieldService>();
  final formKey = GlobalKey<FormState>();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
