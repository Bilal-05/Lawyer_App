import 'package:lawyer_app/services/appbar_service.dart';
import 'package:lawyer_app/services/image_helper_service.dart';
import 'package:lawyer_app/services/user_service.dart';
import 'package:lawyer_app/views/appointment_view/appointment_view.dart';
import 'package:lawyer_app/views/client_view/contact_info_view.dart';
import 'package:lawyer_app/views/client_view/education_view.dart';
import 'package:lawyer_app/views/client_view/experience_view.dart';
import 'package:lawyer_app/views/client_view/for_appointment_view.dart';
import 'package:lawyer_app/views/client_view/forclient_view.dart';
import 'package:lawyer_app/views/client_view/scan_barcard_back_view.dart';
import 'package:lawyer_app/views/client_view/scan_barcard_front_view.dart';
import 'package:lawyer_app/views/client_view/timing_view.dart';
import 'package:lawyer_app/views/forgot_view/forget_view.dart';
import 'package:lawyer_app/views/forgot_view/forgot_select_view.dart';
import 'package:lawyer_app/views/lawyer_view/cnic_view.dart';
import 'package:lawyer_app/views/lawyer_view/forlawyer_view.dart';
import 'package:lawyer_app/views/lawyer_view/upload_cnic.dart';
import 'package:lawyer_app/views/lawyer_view/upload_cnic_back.dart';
import 'package:lawyer_app/views/login_view/login_view.dart';
import 'package:lawyer_app/views/mainmenu_view/mainmenu_view.dart';
import 'package:lawyer_app/views/new_password_view/new_password_view.dart';
import 'package:lawyer_app/views/onboarding_view/onboarding_view.dart';
import 'package:lawyer_app/views/otp_view/otp_view.dart';
import 'package:lawyer_app/views/profile_view/profile_view.dart';
import 'package:lawyer_app/views/register_view/register_view.dart';
import 'package:lawyer_app/views/request_view/request_view.dart';
import 'package:lawyer_app/views/response_view.dart/response_view.dart';
import 'package:lawyer_app/views/splash_view/splash_view.dart';
import 'package:lawyer_app/views/start_view/start_view.dart';
import 'package:lawyer_app/views/user_profile_view/user_profile_view.dart';
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
    MaterialRoute(page: UploadCnicBackView),
    MaterialRoute(page: EducationView),
    MaterialRoute(page: TimingView),
    MaterialRoute(page: BarFrontView),
    MaterialRoute(page: BarBackView),
    MaterialRoute(page: ForAppointmentView),
    MaterialRoute(page: MainMenuView),
    MaterialRoute(page: ContactInfoView),
    MaterialRoute(page: ForgotSelectView),
    MaterialRoute(page: ExperienceView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: AppointmentView),
    MaterialRoute(page: RequestView),
    MaterialRoute(page: ResponseView),
    MaterialRoute(page: UserProfileView)
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: SnackbarService),
    LazySingleton(classType: AppBarService),
    LazySingleton(classType: UserService),
    Singleton(classType: DialogService),
    Singleton(classType: BottomSheetService),
    LazySingleton(classType: ImageHelperService),
  ],
)
class App {}
