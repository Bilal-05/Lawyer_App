import 'package:flutter/material.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TimingVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final timeFromController = TextEditingController();
  final timeToController = TextEditingController();

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  navigateToScanBarCard() {
    // if (formKey.currentState!.validate()) {
    navigationService.navigateToBarFrontView();
    // }
  }
}
