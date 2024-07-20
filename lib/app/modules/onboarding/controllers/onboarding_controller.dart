import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final List<Map<String, String>> slide = [
    {'image': 'assets/icons/intro1.png', 'text': 'Welcome to our Grocery App!', 'subtext': 'Get your groceries in as fast as one hour!'},
    {
      'image': 'assets/icons/intro2.png',
      'text': 'Get fresh groceries delivered to your door.',
      'subtext': 'We deliver fresh groceries to your door in as fast as one hour.'
    },
    {
      'image': 'assets/icons/intro3.png',
      'text': 'Enjoy special offers and discounts!',
      'subtext': 'Get special offers and discounts on your favorite products.'
    },
  ];
}
