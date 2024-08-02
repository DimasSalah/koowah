import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koowah/app/constant/constant.dart';

class SearchHeader extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchHeader({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: CS.whiteGrey.withOpacity(0.4),
        hintText: 'Cari',
        hintStyle: TS.regular.copyWith(fontSize: 15, color: CS.grey),
        prefixIcon: SvgPicture.asset(
          'assets/icons/Search.svg',
          width: 23,
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: CS.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: CS.grey.withOpacity(0.5), width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: CS.grey.withOpacity(0.5), width: 1.5),
        ),
      ),
    );
  }
}
