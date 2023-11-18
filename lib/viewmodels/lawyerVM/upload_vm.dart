import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:stacked/stacked.dart';
// import 'dart:async';

class UploadCnicVM extends BaseViewModel {
  List<String> picturess = [];

  bool mounted = true;

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures(true) ?? [];
      if (!mounted) return;

      picturess = pictures;
      notifyListeners();
      rebuildUi();
    } catch (exception) {
      // Handle exception here
    }
  }

  removePicture(picture) {
    picturess.remove(picture);
    notifyListeners();
    rebuildUi();
  }
}
