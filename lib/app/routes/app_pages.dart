import 'package:get/get.dart';

import '../modules/accountSetting/bindings/account_setting_binding.dart';
import '../modules/accountSetting/views/account_setting_view.dart';
import '../modules/buildAResume/bindings/build_a_resume_binding.dart';
import '../modules/buildAResume/views/build_a_resume_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/manageResumes/bindings/manage_resumes_binding.dart';
import '../modules/manageResumes/views/manage_resumes_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: _Paths.ONBORDING,
        page: () => const OnboardingView(),
        binding: OnbordingBinding(),
        transition: Transition.fadeIn,
        transitionDuration: Duration(milliseconds: 800)),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ACCOUNT_SETTING,
      page: () => const AccountSettingView(),
      binding: AccountSettingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.MANAGE_RESUMES,
      page: () => const ManageResumesView(),
      binding: ManageResumesBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.BUILD_A_RESUME,
      page: () => const BuildAResumeView(),
      binding: BuildAResumeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
