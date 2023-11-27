import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:lawyer_app/theme/colors.dart';
import 'package:stacked_services/stacked_services.dart';

// import 'dart:async';

class UploadCnicVM extends BaseViewModel {
  List<String> frontSide = [];
  List<String> backSide = [];
  final navigationService = locator<NavigationService>();

  bool mounted = true;

  void onPressedfirst() async {
    List<String> pictureFront;
    try {
      pictureFront = await CunningDocumentScanner.getPictures(true) ?? [];
      if (!mounted) return;

      frontSide = pictureFront;
      notifyListeners();
      rebuildUi();
    } catch (exception) {
      // Handle exception here
    }
  }

  void onPressedback() async {
    List<String> pictureBack;
    try {
      pictureBack = await CunningDocumentScanner.getPictures(true) ?? [];
      if (!mounted) return;

      backSide = pictureBack;
      notifyListeners();
      rebuildUi();
    } catch (exception) {
      // Handle exception here
    }
  }

  removePicture(picture, List<String> picturess) {
    picturess.remove(picture);
    notifyListeners();
    rebuildUi();
  }

  var b3style = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    fixedSize: const Size(360, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  navigateToBack() {
    navigationService.navigateToUploadCnicBackView();
  }

  navigateToMenuMain() {
    navigationService.navigateToMainMenuView();
  }
}
