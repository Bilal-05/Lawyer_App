import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardingVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  String looking = 'assets/JSON/Looking.json';
  List<String> items = [
    'I am looking for lawyers',
    'I am looking for clients',
  ];

  String? selectedValue;

  Widget dropDown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        style: TextStyle(
          color: AppColors.primaryColor,
        ),
        isDense: true,
        hint: Text(
          'I am looking for...',
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
          rebuildUi();
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
          height: 50,
          width: 0.75.sw,
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

  // one once yeh screen dikhani hai
  // depending on user input
  navigateToOnBoardingView() {
    if (selectedValue == 'I am looking for lawyers') {
      navigationService.navigateToLawyerView();
    }
  }
}
