import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TimingVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();
  final snackbarService = locator<SnackbarService>();
  final formKey = GlobalKey<FormState>();
  // final textFieldService = locator<TextFieldService>();
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

  List<String> items = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  String? selectedStart;
  String? selectedEnd;

  Widget dropDownStartDay() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Available from',
          style: Style.regular16ptb,
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: Style.regular16ptb),
                ))
            .toList(),
        value: selectedStart,
        onChanged: (String? value) {
          selectedStart = value;
          notifyListeners();
          // rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff626262).withOpacity(0.10),
          ),
          height: 60,
          width: 1.sw,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }

  Widget dropDownEndDay() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Available till',
          style: Style.regular16ptb,
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: Style.regular16ptb),
                ))
            .toList(),
        value: selectedEnd,
        onChanged: (String? value) {
          selectedEnd = value;
          notifyListeners();
          // rebuildUi();
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff626262).withOpacity(0.10),
          ),
          height: 60,
          width: 1.sw,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 50,
        ),
      ),
    );
  }

  add() {
    userService.availabileFrom = selectedStart;
    userService.availabileTill = selectedEnd;
    userService.startTime = timeFromController.text;
    userService.endTime = timeToController.text;
    notifyListeners();
  }

  navigateToContact() {
    if (selectedStart != null && selectedEnd != null) {
      if (formKey.currentState!.validate()) {
        add();
        navigationService.navigateToContactInfoView();
      } else {
        snackbarService.showSnackbar(
            message: "Please fill all the fields",
            title: 'Error',
            duration: const Duration(seconds: 2));
      }
    } else {
      snackbarService.showSnackbar(
          message: "Please select days",
          title: 'Error',
          duration: const Duration(seconds: 2));
    }
  }
}
