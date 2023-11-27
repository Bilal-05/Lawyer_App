import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class HomeVM extends BaseViewModel {
  final appbarService = locator<AppBarService>();

  CollectionReference category =
      FirebaseFirestore.instance.collection('categories');
}
