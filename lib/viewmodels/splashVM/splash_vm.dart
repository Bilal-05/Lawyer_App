// ignore_for_file: file_names

import 'package:lawyer_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  String logo = 'assets/images/Logo_White.png';
}
