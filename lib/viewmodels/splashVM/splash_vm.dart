// ignore_for_file: file_names

import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/views/mainmenu_view/mainmenu_view.dart';
import 'package:lawyer_app/views/onboarding_view/onboarding_view.dart';
import 'package:lawyer_app/views/start_view/start_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  String logo = 'assets/images/Logo_White.png';

  bool isLogin = false;

  bool onBoardComplete = false;

  checkIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('isLogin') ?? isLogin;
    notifyListeners();
  }

  checkOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardComplete = prefs.getBool('onBoardComplete') ?? onBoardComplete;
    notifyListeners();
  }

  fetchData() async {
    await checkIsLogin();
    await checkOnBoarding();
  }

  initialize() async {
    await fetchData();
    await Future.delayed(const Duration(seconds: 3));
    navigateToView();
  }

  navigateToView() {
    if (isLogin) {
      if (!onBoardComplete) {
        navigationService.replaceWithTransition(
          const OnBoardingView(),
          transition: 'fade',
          duration: const Duration(milliseconds: 500),
        );
      } else {
        navigationService.replaceWithTransition(
          const MainMenuView(),
          transition: 'fade',
          duration: const Duration(milliseconds: 500),
        );
      }
    } else {
      navigationService.replaceWithTransition(
        const StartView(),
        transition: 'fade',
        duration: const Duration(milliseconds: 500),
      );
    }
  }
}
