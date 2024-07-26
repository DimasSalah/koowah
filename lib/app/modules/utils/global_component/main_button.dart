import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const MainButton({super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: CS.blue,
        minimumSize: Size(Get.width * 1, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TS.medium.copyWith(fontSize: 14, color: CS.white),
      ),
    );
  }
}
