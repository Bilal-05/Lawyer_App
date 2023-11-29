import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForAppointmentVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final textFieldService = locator<TextFieldService>();
  final navigationService = locator<NavigationService>();
  UserService userService = locator<UserService>();
  TextEditingController practiceController = TextEditingController();
  TextEditingController consultantController = TextEditingController();
  TextEditingController hourlyController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  // List<String> practiceArea = [
  //   'Yes',
  //   'No ',
  // ];

  // String? selectedPracticeArea;

  // Widget dropDownArea() {
  //   return DropdownButtonHideUnderline(
  //     child: DropdownButton2<String>(
  //       style: TextStyle(
  //         color: AppColors.primaryColor,
  //       ),
  //       isDense: true,
  //       hint: Text(
  //         'Do you provide free consultation?',
  //         style: Style.regular16ptb,
  //       ),
  //       items: practiceArea
  //           .map((String item) => DropdownMenuItem<String>(
  //                 value: item,
  //                 child: Text(item, style: Style.regular16ptb),
  //               ))
  //           .toList(),
  //       value: selectedPracticeArea,
  //       onChanged: (String? value) {
  //         selectedPracticeArea = value;
  //         notifyListeners();
  //         // rebuildUi();
  //       },
  //       buttonStyleData: ButtonStyleData(
  //         padding: const EdgeInsets.only(
  //           left: 15,
  //           right: 15,
  //         ),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           color: const Color(0xff626262).withOpacity(0.10),
  //         ),
  //         height: 60,
  //         width: 1.sw,
  //       ),
  //       menuItemStyleData: const MenuItemStyleData(
  //         height: 50,
  //       ),
  //     ),
  //   );
  // }

  List<String> items = [
    'Yes',
    'No ',
  ];

  String? selectedValue;

  Widget dropDownConsultation() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'Do you provide free consultation?',
          style: Style.regular16ptb,
        ),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: Style.regular16ptb),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          selectedValue = value;
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

  var b1style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  add() {
    userService.practiceArea = practiceController.text;
    userService.freeConsultation = selectedValue;
    userService.hourlyRate = hourlyController.text;
    userService.address = locationController.text;
    notifyListeners();
  }

  navigateToExperience() {
    if (formKey.currentState!.validate()) {
      add();
      navigationService.navigateToExperienceView();
    } else {
      SnackbarService().showSnackbar(
        message: 'Fill all fields',
        title: 'Error',
        duration: const Duration(seconds: 2),
      );
    }
  }
}
