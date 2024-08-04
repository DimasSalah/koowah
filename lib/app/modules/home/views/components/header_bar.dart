import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:koowah/app/routes/app_pages.dart';

import '../../../../constant/constant.dart';
import '../../../../local/product.dart';

class HeaderBar extends StatelessWidget {
  final String name;
  final Function()? onLogout;
  const HeaderBar({
    super.key,
    required this.name,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: CS.yellow.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: SvgPicture.network(
                'https://api.dicebear.com/9.x/adventurer/svg?seed=$name'),
          ),
        ),
        const Gap(10),
        Container(
            constraints: BoxConstraints(maxWidth: 200),
            child:
                Text('Halo $name !', style: TS.medium.copyWith(fontSize: 22))),
        const Spacer(),
        IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text(
                    'yakin ingin keluar?',
                    style: TS.medium,
                  ),
                  content: Text(
                    'daftar checkout anda akan dihapus dan anda harus login kembali',
                    style: TS.regular.copyWith(fontSize: 14, color: CS.grey),
                  ),
                  actions: [
                    TextButton(onPressed: onLogout, child: const Text('Ya')),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('Tidak')),
                  ],
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/logout.svg'))
      ],
    );
  }
}
