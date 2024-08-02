import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final double price;

  @HiveField(2)
  final int countOrder;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final int phone;

  @HiveField(5)
  final String address;

  // Tambahkan field phone

  Product(
      {required this.title,
      required this.price,
      required this.countOrder,
      required this.imageUrl,
      required this.phone,
      required this.address // Tambahkan parameter phone
      });
}
