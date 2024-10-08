import 'package:get/get.dart';

import '../modules/admin/add_product/bindings/add_product_binding.dart';
import '../modules/admin/add_product/views/add_product_view.dart';
import '../modules/admin/bindings/admin_binding.dart';
import '../modules/admin/profile_admin/bindings/profile_admin_binding.dart';
import '../modules/admin/profile_admin/views/profile_admin_view.dart';
import '../modules/admin/views/admin_view.dart';
import '../modules/chart/bindings/chart_binding.dart';
import '../modules/chart/checkout/bindings/checkout_binding.dart';
import '../modules/chart/checkout/views/checkout_view.dart';
import '../modules/chart/views/chart_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/detail_product/bindings/detail_product_binding.dart';
import '../modules/home/detail_product/views/detail_product_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
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
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.DETAIL_PRODUCT,
          page: () => const DetailProductView(),
          binding: DetailProductBinding(),
          transition: Transition.native,
        ),
      ],
    ),
    GetPage(
        name: _Paths.ONBOARDING,
        page: () => const OnboardingView(),
        binding: OnboardingBinding(),
        transition: Transition.fadeIn,
        children: []),
    GetPage(
      name: _Paths.SELECTOR,
      page: () => const SelectorView(),
      binding: SelectorBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.REGISTER,
          page: () => const RegisterView(),
          binding: AuthBinding(),
          transition: Transition.fadeIn,
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
      transition: Transition.fadeIn,
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
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => const NavigationView(),
      binding: NavigationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CHART,
      page: () => const ChartView(),
      binding: ChartBinding(),
      transition: Transition.fadeIn,
      children: [
        GetPage(
          name: _Paths.CHECKOUT,
          page: () => const CheckoutView(),
          binding: CheckoutBinding(),
        ),
      ],
    ),
  ];
}
