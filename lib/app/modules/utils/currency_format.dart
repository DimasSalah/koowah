import 'package:intl/intl.dart';


String currencyFormatRp(int value) {
  final isNegative = value < 0; // Cek apakah nilai negatif
  final absAmount = value.abs(); // Gunakan nilai absolut untuk format
  if (absAmount < 1000) {
    return '${isNegative ? '-' : ''}${absAmount.toString()}';
  } else if (absAmount < 1000000) {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${isNegative ? '-' : ''}${formatter.format(absAmount / 1000)}rb"; // Menggunakan 'rb' untuk ribu
  } else {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${isNegative ? '-' : ''}${formatter.format(absAmount / 1000000)}jt"; // Menggunakan 'jt' untuk juta
  }
}

String currencyFormatRpDouble(double value) {
  final isNegative = value < 0; // Cek apakah nilai negatif
  final absAmount = value.abs(); // Gunakan nilai absolut untuk format
  if (absAmount < 1000) {
    return '${isNegative ? '-' : ''}${absAmount.toString()}';
  } else if (absAmount < 1000000) {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${isNegative ? '-' : ''}${formatter.format(absAmount / 1000)}rb"; // Menggunakan 'rb' untuk ribu
  } else {
    final formatter = NumberFormat("#,##0.0", "id");
    return "${isNegative ? '-' : ''}${formatter.format(absAmount / 1000000)}jt"; // Menggunakan 'jt' untuk juta
  }
}