import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';
import 'package:stacked/stacked.dart';

class TextFieldService extends BaseViewModel {
  bool obscureText = true;

  Widget customTextFormField(
    TextInputType? keyboardType,
    Widget? suffix,
    TextEditingController controller,
    String hintText,
    String? Function(String?)? validator,
  ) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      style: Style.regular14ptb,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        suffix: suffix,
        hintStyle: Style.regular16ptb,
        fillColor: const Color(0xff626262).withOpacity(0.10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color(0xff626262).withOpacity(0.10),
            )),
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

  // Widget customPassTextFormField(
  //   TextEditingController controller,
  //   String hintText,
  //   String? Function(String?)? validator,
  // ) {
  //   return TextFormField(
  //     obscureText: obscureText,
  //     controller: controller,
  //     style: Style.regular14ptb,
  //     decoration: InputDecoration(
  //       suffixIcon: obscureText == true
  //           ? InkWell(
  //               onTap: () {
  //                 obscureText = false;
  //                 notifyListeners();
  //                 rebuildUi();
  //               },
  //               child: const Icon(Icons.visibility_off),
  //             )
  //           : InkWell(
  //               onTap: () {
  //                 obscureText = true;
  //                 notifyListeners();
  //                 rebuildUi();
  //               },
  //               child: const Icon(
  //                 Icons.visibility,
  //               ),
  //             ),
  //       filled: true,
  //       hintText: hintText,
  //       hintStyle: Style.regular16ptb,
  //       fillColor: const Color(0xff626262).withOpacity(0.10),
  //       enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: BorderSide(
  //             color: const Color(0xff626262).withOpacity(0.10),
  //           )),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: BorderSide(
  //           color: AppColors.primaryColor,
  //           width: 3,
  //         ),
  //       ),
  //     ),
  //     validator: validator,
  //   );
  // }

  // Widget customPassTextFormField(
  //   TextEditingController controller,
  //   String hintText,
  //   String? Function(String?)? validator,
  // ) {
  //   return TextFormField(
  //     obscureText: obscureText,
  //     controller: controller,
  //     style: Style.regular14ptb,
  //     decoration: InputDecoration(
  //       suffix: IconButton(
  //         icon: obscureText
  //             ? const Icon(Icons.visibility_off)
  //             : const Icon(Icons.visibility),
  //         onPressed: () {
  //           obscureText = !obscureText;
  //           notifyListeners();
  //         },
  //       ),
  //       filled: true,
  //       hintText: hintText,
  //       hintStyle: Style.regular16ptb,
  //       fillColor: const Color(0xff626262).withOpacity(0.10),
  //       enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: BorderSide(
  //             color: const Color(0xff626262).withOpacity(0.10),
  //           )),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(10),
  //         borderSide: BorderSide(
  //           color: AppColors.primaryColor,
  //           width: 3,
  //         ),
  //       ),
  //     ),
  //     validator: validator,
  //   );
  // }
}
