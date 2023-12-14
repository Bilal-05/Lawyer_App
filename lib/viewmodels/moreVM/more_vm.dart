import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MoreVM extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final userService = locator<UserService>();

  eraseData() async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    log(prefs.getBool('isLogin').toString());
    log(prefs.getBool('firstLogin').toString());
    log(prefs.getString('documentID').toString());
    prefs.remove('isLogin');
    prefs.remove('firstLogin');
    prefs.remove('documentID');
    notifyListeners();
    log(prefs.getBool('isLogin').toString());
    log(prefs.getBool('firstLogin').toString());
    log(prefs.getString('documentID').toString());
    navigationService.replaceWithStartView();
  }
}
