import 'package:get/get.dart';

import '../modules/agoraConnect/bindings/agora_connect_binding.dart';
import '../modules/agoraConnect/views/agora_connect_view.dart';
import '../modules/callScreen/bindings/call_screen_binding.dart';
import '../modules/callScreen/views/call_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginPage/bindings/login_page_binding.dart';
import '../modules/loginPage/views/login_page_view.dart';
import '../modules/singUpPage/bindings/sing_up_page_binding.dart';
import '../modules/singUpPage/views/sing_up_page_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => const LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.SING_UP_PAGE,
      page: () => const SingUpPageView(),
      binding: SingUpPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: _Paths.CALL_SCREEN,
    //   page: () =>  CallScreenView(),
    //   binding: CallScreenBinding(),
    // ),
    GetPage(
      name: _Paths.AGORA_CONNECT,
      page: () => const AgoraConnectView(),
      binding: AgoraConnectBinding(),
    ),
  ];
}
