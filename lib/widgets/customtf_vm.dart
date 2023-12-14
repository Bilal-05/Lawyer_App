// ignore_for_file: file_names

import 'package:stacked/stacked.dart';

class CustomTFVM extends BaseViewModel {
  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }
}
