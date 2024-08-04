import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../constant/constant.dart';

class AddressSection extends StatelessWidget {
  final String address;
  const AddressSection({
    super.key,
   required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alamat Pengiriman',
            style: TS.medium.copyWith(fontSize: 16),
          ),
          Row(
            children: [
              SvgPicture.asset('assets/icons/location.svg', color: CS.yellow),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  address,
                  style: TS.regular.copyWith(fontSize: 14, color: CS.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Gap(11),
        ],
      ),
    );
  }
}
