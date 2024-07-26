import 'package:flutter/material.dart';

import '../../../constant/constant.dart';


class CustomForm2 extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;
  final int maxLines;
  final TextInputType keyboardType;
  const CustomForm2({
    super.key,
    required this.hintText,
    this.onChanged,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TS.regular.copyWith(fontSize: 13),
      maxLines: maxLines,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CS.grey.withOpacity(0.5), width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: CS.black, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
              color: Color.fromARGB(255, 220, 18, 3), width: 1),
        ),
      ),
    );
  }
}
