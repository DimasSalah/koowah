import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/constant.dart';

class LoadingMaterial extends StatelessWidget {
  const LoadingMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: CS.white,
      child: Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text('Tungu Sebentar',
                style: TS.regular.copyWith(fontSize: 13, color: CS.black)),
          ],
        ),
      ),
    );
  }
}
