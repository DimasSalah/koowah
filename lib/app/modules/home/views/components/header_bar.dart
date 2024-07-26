import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/constant.dart';

class HeaderBar extends StatelessWidget {
  final String name;
  const HeaderBar({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Halo $name !', style: TS.medium.copyWith(fontSize: 22)),
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: CS.grey,
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: SvgPicture.network(
                'https://api.dicebear.com/9.x/miniavs/svg?seed=$name'),
          ),
        ),
      ],
    );
  }
}
