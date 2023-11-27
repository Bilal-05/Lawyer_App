import 'package:lawyer_app/views/directory_view/directory_view.dart';
import 'package:lawyer_app/views/home_view/home_view.dart';
import 'package:lawyer_app/views/law_view/law_view.dart';
import 'package:lawyer_app/views/more_view/more_view.dart';
import 'package:stacked/stacked.dart';

class MainMenuVM extends BaseViewModel {
  // final appbarService = locator<AppBarService>();

  var myIndex = 0;

  onChanged(index) {
    myIndex = index;
    notifyListeners();
  }

  List page = const [
    HomeView(),
    DirectoryView(),
    LawView(),
    MoreView(),
  ];
}
