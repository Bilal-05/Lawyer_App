// import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeVM extends BaseViewModel {
  final appbarService = locator<AppBarService>();

  CollectionReference category =
      FirebaseFirestore.instance.collection('categories');

  setFalse() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('onBoardComplete', false);
    // prefs.setBool('isLogin', false);
    // log(prefs.getBool('onBoardComplete').toString());
    FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLogin');
    NavigationService().replaceWithSplashView();
    notifyListeners();
  }
}
