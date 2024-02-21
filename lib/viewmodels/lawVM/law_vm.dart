import 'dart:convert';
// import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:stacked/stacked.dart';

class LawVM extends BaseViewModel {
  bool showDesc = false;
  final AppBarService appbarService = AppBarService();
  List foundItems = [];
  List items = [];
  Future<void> readJson() async {
    setBusy(true);
    final String response =
        await rootBundle.loadString('assets/JSON/law_file.json');
    final data = await json.decode(response);
    items = data["laws"];
    // log(data["laws"].toString());
    notifyListeners();
    initialize();
    setBusy(false);
  }

  makeTrue() {
    showDesc = true;
    notifyListeners();
  }

  makeFalse() {
    showDesc = false;
    notifyListeners();
  }

  search(value) {
    List results = [];
    if (value.isEmpty) {
      results = items;
      foundItems = results;
      notifyListeners();
    } else {
      results = items
          .where((element) =>
              element["title"].toString().toLowerCase().contains(value) ||
              element["description"].toString().toLowerCase().contains(value) ||
              element["id"].toString().contains(value))
          .toList();
      foundItems = results;
      notifyListeners();
    }

    // readData() async {
    //   await readJson();
    // }
  }

  initialize() {
    foundItems = items;
    notifyListeners();
  }
}
