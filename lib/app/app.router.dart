// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i30;
import 'package:flutter/material.dart';
import 'package:lawyer_app/views/appointment_view/appointment_view.dart'
    as _i25;
import 'package:lawyer_app/views/calendar_view/calendar_view.dart' as _i29;
import 'package:lawyer_app/views/client_view/contact_info_view.dart' as _i21;
import 'package:lawyer_app/views/client_view/education_view.dart' as _i15;
import 'package:lawyer_app/views/client_view/experience_view.dart' as _i23;
import 'package:lawyer_app/views/client_view/for_appointment_view.dart' as _i19;
import 'package:lawyer_app/views/client_view/forclient_view.dart' as _i13;
import 'package:lawyer_app/views/client_view/scan_barcard_back_view.dart'
    as _i18;
import 'package:lawyer_app/views/client_view/scan_barcard_front_view.dart'
    as _i17;
import 'package:lawyer_app/views/client_view/timing_view.dart' as _i16;
import 'package:lawyer_app/views/forgot_view/forget_view.dart' as _i6;
import 'package:lawyer_app/views/forgot_view/forgot_select_view.dart' as _i22;
import 'package:lawyer_app/views/lawyer_view/cnic_view.dart' as _i11;
import 'package:lawyer_app/views/lawyer_view/forlawyer_view.dart' as _i10;
import 'package:lawyer_app/views/lawyer_view/upload_cnic.dart' as _i12;
import 'package:lawyer_app/views/lawyer_view/upload_cnic_back.dart' as _i14;
import 'package:lawyer_app/views/login_view/login_view.dart' as _i4;
import 'package:lawyer_app/views/mainmenu_view/mainmenu_view.dart' as _i20;
import 'package:lawyer_app/views/new_password_view/new_password_view.dart'
    as _i8;
import 'package:lawyer_app/views/onboarding_view/onboarding_view.dart' as _i9;
import 'package:lawyer_app/views/otp_view/otp_view.dart' as _i7;
import 'package:lawyer_app/views/profile_view/profile_view.dart' as _i24;
import 'package:lawyer_app/views/register_view/register_view.dart' as _i5;
import 'package:lawyer_app/views/request_view/request_view.dart' as _i26;
import 'package:lawyer_app/views/response_view.dart/response_view.dart' as _i27;
import 'package:lawyer_app/views/splash_view/splash_view.dart' as _i2;
import 'package:lawyer_app/views/start_view/start_view.dart' as _i3;
import 'package:lawyer_app/views/user_profile_view/user_profile_view.dart'
    as _i28;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i31;

class Routes {
  static const splashView = '/';

  static const startView = '/start-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const forgotView = '/forgot-view';

  static const otpView = '/otp-view';

  static const newPasswordView = '/new-password-view';

  static const onBoardingView = '/on-boarding-view';

  static const lawyerView = '/lawyer-view';

  static const cnicView = '/cnic-view';

  static const uploadCnicView = '/upload-cnic-view';

  static const clientView = '/client-view';

  static const uploadCnicBackView = '/upload-cnic-back-view';

  static const educationView = '/education-view';

  static const timingView = '/timing-view';

  static const barFrontView = '/bar-front-view';

  static const barBackView = '/bar-back-view';

  static const forAppointmentView = '/for-appointment-view';

  static const mainMenuView = '/main-menu-view';

  static const contactInfoView = '/contact-info-view';

  static const forgotSelectView = '/forgot-select-view';

  static const experienceView = '/experience-view';

  static const profileView = '/profile-view';

  static const appointmentView = '/appointment-view';

  static const requestView = '/request-view';

  static const responseView = '/response-view';

  static const userProfileView = '/user-profile-view';

  static const sFCalendarView = '/s-fcalendar-view';

  static const all = <String>{
    splashView,
    startView,
    loginView,
    registerView,
    forgotView,
    otpView,
    newPasswordView,
    onBoardingView,
    lawyerView,
    cnicView,
    uploadCnicView,
    clientView,
    uploadCnicBackView,
    educationView,
    timingView,
    barFrontView,
    barBackView,
    forAppointmentView,
    mainMenuView,
    contactInfoView,
    forgotSelectView,
    experienceView,
    profileView,
    appointmentView,
    requestView,
    responseView,
    userProfileView,
    sFCalendarView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.startView,
      page: _i3.StartView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i4.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i5.RegisterView,
    ),
    _i1.RouteDef(
      Routes.forgotView,
      page: _i6.ForgotView,
    ),
    _i1.RouteDef(
      Routes.otpView,
      page: _i7.OtpView,
    ),
    _i1.RouteDef(
      Routes.newPasswordView,
      page: _i8.NewPasswordView,
    ),
    _i1.RouteDef(
      Routes.onBoardingView,
      page: _i9.OnBoardingView,
    ),
    _i1.RouteDef(
      Routes.lawyerView,
      page: _i10.LawyerView,
    ),
    _i1.RouteDef(
      Routes.cnicView,
      page: _i11.CnicView,
    ),
    _i1.RouteDef(
      Routes.uploadCnicView,
      page: _i12.UploadCnicView,
    ),
    _i1.RouteDef(
      Routes.clientView,
      page: _i13.ClientView,
    ),
    _i1.RouteDef(
      Routes.uploadCnicBackView,
      page: _i14.UploadCnicBackView,
    ),
    _i1.RouteDef(
      Routes.educationView,
      page: _i15.EducationView,
    ),
    _i1.RouteDef(
      Routes.timingView,
      page: _i16.TimingView,
    ),
    _i1.RouteDef(
      Routes.barFrontView,
      page: _i17.BarFrontView,
    ),
    _i1.RouteDef(
      Routes.barBackView,
      page: _i18.BarBackView,
    ),
    _i1.RouteDef(
      Routes.forAppointmentView,
      page: _i19.ForAppointmentView,
    ),
    _i1.RouteDef(
      Routes.mainMenuView,
      page: _i20.MainMenuView,
    ),
    _i1.RouteDef(
      Routes.contactInfoView,
      page: _i21.ContactInfoView,
    ),
    _i1.RouteDef(
      Routes.forgotSelectView,
      page: _i22.ForgotSelectView,
    ),
    _i1.RouteDef(
      Routes.experienceView,
      page: _i23.ExperienceView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i24.ProfileView,
    ),
    _i1.RouteDef(
      Routes.appointmentView,
      page: _i25.AppointmentView,
    ),
    _i1.RouteDef(
      Routes.requestView,
      page: _i26.RequestView,
    ),
    _i1.RouteDef(
      Routes.responseView,
      page: _i27.ResponseView,
    ),
    _i1.RouteDef(
      Routes.userProfileView,
      page: _i28.UserProfileView,
    ),
    _i1.RouteDef(
      Routes.sFCalendarView,
      page: _i29.SFCalendarView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.StartView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartView(),
        settings: data,
      );
    },
    _i4.LoginView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginView(),
        settings: data,
      );
    },
    _i5.RegisterView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterView(),
        settings: data,
      );
    },
    _i6.ForgotView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ForgotView(),
        settings: data,
      );
    },
    _i7.OtpView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.OtpView(),
        settings: data,
      );
    },
    _i8.NewPasswordView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.NewPasswordView(),
        settings: data,
      );
    },
    _i9.OnBoardingView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.OnBoardingView(),
        settings: data,
      );
    },
    _i10.LawyerView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.LawyerView(),
        settings: data,
      );
    },
    _i11.CnicView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.CnicView(),
        settings: data,
      );
    },
    _i12.UploadCnicView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.UploadCnicView(),
        settings: data,
      );
    },
    _i13.ClientView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.ClientView(),
        settings: data,
      );
    },
    _i14.UploadCnicBackView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.UploadCnicBackView(),
        settings: data,
      );
    },
    _i15.EducationView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.EducationView(),
        settings: data,
      );
    },
    _i16.TimingView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.TimingView(),
        settings: data,
      );
    },
    _i17.BarFrontView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.BarFrontView(),
        settings: data,
      );
    },
    _i18.BarBackView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i18.BarBackView(),
        settings: data,
      );
    },
    _i19.ForAppointmentView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i19.ForAppointmentView(),
        settings: data,
      );
    },
    _i20.MainMenuView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i20.MainMenuView(),
        settings: data,
      );
    },
    _i21.ContactInfoView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i21.ContactInfoView(),
        settings: data,
      );
    },
    _i22.ForgotSelectView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i22.ForgotSelectView(),
        settings: data,
      );
    },
    _i23.ExperienceView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i23.ExperienceView(),
        settings: data,
      );
    },
    _i24.ProfileView: (data) {
      final args = data.getArgs<ProfileViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i24.ProfileView(key: args.key, lawyerUid: args.lawyerUid),
        settings: data,
      );
    },
    _i25.AppointmentView: (data) {
      final args = data.getArgs<AppointmentViewArguments>(nullOk: false);
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => _i25.AppointmentView(
            key: args.key, data: args.data, timing: args.timing),
        settings: data,
      );
    },
    _i26.RequestView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i26.RequestView(),
        settings: data,
      );
    },
    _i27.ResponseView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i27.ResponseView(),
        settings: data,
      );
    },
    _i28.UserProfileView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i28.UserProfileView(),
        settings: data,
      );
    },
    _i29.SFCalendarView: (data) {
      return _i30.MaterialPageRoute<dynamic>(
        builder: (context) => const _i29.SFCalendarView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ProfileViewArguments {
  const ProfileViewArguments({
    this.key,
    required this.lawyerUid,
  });

  final _i30.Key? key;

  final String lawyerUid;

  @override
  String toString() {
    return '{"key": "$key", "lawyerUid": "$lawyerUid"}';
  }

  @override
  bool operator ==(covariant ProfileViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.lawyerUid == lawyerUid;
  }

  @override
  int get hashCode {
    return key.hashCode ^ lawyerUid.hashCode;
  }
}

class AppointmentViewArguments {
  const AppointmentViewArguments({
    this.key,
    required this.data,
    required this.timing,
  });

  final _i30.Key? key;

  final Map<dynamic, dynamic> data;

  final List<dynamic> timing;

  @override
  String toString() {
    return '{"key": "$key", "data": "$data", "timing": "$timing"}';
  }

  @override
  bool operator ==(covariant AppointmentViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key && other.data == data && other.timing == timing;
  }

  @override
  int get hashCode {
    return key.hashCode ^ data.hashCode ^ timing.hashCode;
  }
}

extension NavigatorStateExtension on _i31.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNewPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.newPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLawyerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.lawyerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCnicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.cnicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadCnicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.uploadCnicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToClientView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.clientView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUploadCnicBackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.uploadCnicBackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEducationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.educationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTimingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.timingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBarFrontView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.barFrontView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBarBackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.barBackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForAppointmentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forAppointmentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainMenuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.forgotSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToExperienceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.experienceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView({
    _i30.Key? key,
    required String lawyerUid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.profileView,
        arguments: ProfileViewArguments(key: key, lawyerUid: lawyerUid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAppointmentView({
    _i30.Key? key,
    required Map<dynamic, dynamic> data,
    required List<dynamic> timing,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.appointmentView,
        arguments:
            AppointmentViewArguments(key: key, data: data, timing: timing),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.requestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResponseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.responseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSFCalendarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.sFCalendarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOtpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.otpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNewPasswordView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.newPasswordView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnBoardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onBoardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLawyerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.lawyerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCnicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.cnicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUploadCnicView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.uploadCnicView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithClientView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.clientView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUploadCnicBackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.uploadCnicBackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEducationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.educationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTimingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.timingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBarFrontView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.barFrontView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBarBackView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.barBackView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForAppointmentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forAppointmentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainMenuView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainMenuView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactInfoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactInfoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotSelectView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.forgotSelectView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithExperienceView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.experienceView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView({
    _i30.Key? key,
    required String lawyerUid,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.profileView,
        arguments: ProfileViewArguments(key: key, lawyerUid: lawyerUid),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAppointmentView({
    _i30.Key? key,
    required Map<dynamic, dynamic> data,
    required List<dynamic> timing,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.appointmentView,
        arguments:
            AppointmentViewArguments(key: key, data: data, timing: timing),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRequestView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.requestView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithResponseView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.responseView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userProfileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSFCalendarView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.sFCalendarView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
