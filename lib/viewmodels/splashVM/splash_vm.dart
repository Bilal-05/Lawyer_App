// ignore_for_file: file_names

import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/views/mainmenu_view/mainmenu_view.dart';
import 'package:lawyer_app/views/start_view/start_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  UserService userService = locator<UserService>();

  String logo = 'assets/images/Logo_White.png';

  bool isLogin = false;

  bool firstLogin = true;

  checkIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('isLogin') ?? isLogin;
    notifyListeners();
  }

  checkFirstLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firstLogin = prefs.getBool('firstLogin') ?? firstLogin;
    notifyListeners();
  }

  fetchData() async {
    await checkIsLogin();
    await checkFirstLogin();
  }

  initialize() async {
    await fetchData();
    await Future.delayed(const Duration(seconds: 3));
    navigateToView();
  }

  navigateToView() {
    if (isLogin) {
      if (firstLogin) {
        navigationService.replaceWithTransition(
          const StartView(),
          // transition: 'fade',
          duration: const Duration(milliseconds: 500),
        );
      } else {
        navigationService.replaceWithTransition(
          const MainMenuView(),
          // transition: 'fade',
          duration: const Duration(milliseconds: 500),
        );
      }
    } else {
      navigationService.replaceWithTransition(
        const StartView(),
        // transition: 'fade',
        duration: const Duration(milliseconds: 500),
      );
    }
  }
}
