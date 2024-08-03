import 'package:get/get.dart';

class OnboardingController extends GetxController {
  RxInt currentIndex = 0.obs;
  final List<Map<String, String>> slide = [
    {
      'image': 'assets/icons/intro1.png',
      'text': 'Ayo Jelajahi KooWah!',
      'subtext':
          'Temukan berbagai pilihan kopi terbaik dan buah-buahan segar langsung dari kebun!'
    },
    {
      'image': 'assets/icons/intro2.png',
      'text': 'Kopi Berkualitas Tinggi',
      'subtext':
          'Nikmati cita rasa kopi premium yang diolah dengan penuh keahlian.'
    },
    {
      'image': 'assets/icons/intro3.png',
      'text': 'Buah-buahan Segar',
      'subtext':
          'Dapatkan buah-buahan segar dan sehat setiap hari untuk keluarga Anda.'
    },
  ];
}
