import 'package:lawyer_app/app/app.locator.dart';
import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserProfileVM extends BaseViewModel {
  final userService = locator<UserService>();
  final appbarService = AppBarService();
  final navigationService = locator<NavigationService>();

  goBack() {
    navigationService.back();
  }
}
