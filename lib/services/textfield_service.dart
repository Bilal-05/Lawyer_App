import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:lawyer_app/theme/textstyle.dart';

class TextFieldService {
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
}
