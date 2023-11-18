import 'package:lawyer_app/services/textfield_service.dart';
import 'package:lawyer_app/views/client_view/client_view.dart';
import 'package:lawyer_app/views/forgot_view/forget_view.dart';
import 'package:lawyer_app/views/lawyer_view/cnic_view.dart';
import 'package:lawyer_app/views/lawyer_view/forlawyer_view.dart';
import 'package:lawyer_app/views/lawyer_view/upload_cnic.dart';
import 'package:lawyer_app/views/login_view/login_view.dart';
import 'package:lawyer_app/views/new_password_view/new_password_view.dart';
import 'package:lawyer_app/views/onboarding_view/onboarding_view.dart';
import 'package:lawyer_app/views/otp_view/otp_view.dart';
import 'package:lawyer_app/views/register_view/register_view.dart';
import 'package:lawyer_app/views/splash_view/splash_view.dart';
import 'package:lawyer_app/views/start_view/start_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: StartView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ForgotView),
    MaterialRoute(page: OtpView),
    MaterialRoute(page: NewPasswordView),
    MaterialRoute(page: OnBoardingView),
    MaterialRoute(page: LawyerView),
    MaterialRoute(page: CnicView),
    MaterialRoute(page: UploadCnicView),
    MaterialRoute(page: ClientView),
  ],
  dependencies: [
    Singleton(
      classType: NavigationService,
    ),
    LazySingleton(classType: TextFieldService),
  ],
)
class App {}