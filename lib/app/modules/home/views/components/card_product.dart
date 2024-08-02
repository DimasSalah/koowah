import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../constant/constant.dart';

class cardProduct extends StatelessWidget {
  final String title;
  final String url;
  final String weight;
  final String price;
  final Function()? onTap;
  const cardProduct({
    super.key,
    required this.title,
    required this.url,
    required this.weight,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          maxWidth: Get.width * 0.4,
        ),
        decoration: BoxDecoration(
          color: CS.whiteGrey.withOpacity(0.02),
          border: Border.all(color: CS.whiteGrey, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(url), fit: BoxFit.cover)),
            ),
            Spacer(),
            Text(
              title,
              style: TS.medium.copyWith(fontSize: 15),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(4),
            Text(
              weight,
              style: TS.regular.copyWith(fontSize: 13),
            ),
            const Gap(10),
            Row(
              children: [
                Text(
                  'Rp $price',
                  style: TS.semiBold.copyWith(fontSize: 16),
                ),
                const Spacer(),
                Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: CS.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Bag.svg',
                      width: 20,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
