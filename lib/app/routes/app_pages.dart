import 'package:get/get.dart';

import '../modules/admin/add_product/bindings/add_product_binding.dart';
import '../modules/admin/add_product/views/add_product_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/profile_admin/bindings/profile_admin_binding.dart';
import '../modules/admin/profile_admin/views/profile_admin_view.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/selector/auth/bindings/auth_binding.dart';
import '../modules/selector/auth/views/auth_view.dart';
import '../modules/selector/auth/views/login_view.dart';
import '../modules/selector/auth/views/register_view.dart';
import '../modules/selector/bindings/selector_binding.dart';
import '../modules/selector/views/selector_view.dart';
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
    ),
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => const OnboardingView(),
        binding: OnboardingBinding(),
        children: []),
    GetPage(
      name: _Paths.SELECTOR,
      page: () => const SelectorView(),
      binding: SelectorBinding(),
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: ProfileBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN,
      page: () => const AdminView(),
      binding: AdminBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_PRODUCT,
          page: () => const AddProductView(),
          binding: AddProductBinding(),
        ),
        GetPage(
          name: _Paths.PROFILE_ADMIN,
          page: () => const ProfileAdminView(),
          binding: ProfileAdminBinding(),
        ),
      ],
    ),
  ];
}
