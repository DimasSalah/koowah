import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../constant/constant.dart';

class CustomForm extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String icon;
  bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  CustomForm({
    super.key,
    required this.hintText,
    this.onChanged,
    this.controller,
    required this.icon,
    this.obscureText,
    this.suffixIcon,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(10),
            SvgPicture.asset(
              icon,
            ),
            Container(
              height: 20,
              width: 1,
              color: CS.grey,
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
        ),
        isDense: false,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CS.grey.withOpacity(0.5), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CS.black, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
              color: const Color.fromARGB(255, 220, 18, 3), width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: suffixIcon ?? null,
        ),
      ),
    );
  }
}
