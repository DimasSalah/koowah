import 'package:flutter/material.dart';

import '../../../../constant/constant.dart';

List paymentItems = [
  "Kopi Arabika",
  "Kopi Robusta",
  "Buah Buahan",
];

class CategoryDropdown extends StatelessWidget {
  final Function(dynamic)? selectedPayment;
  const CategoryDropdown({
    super.key,
    this.selectedPayment,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        onSelected: selectedPayment,
        width: 160,
        hintText: 'Kopi Arabika',
        textStyle: TS.regular.copyWith(
          fontSize: 13,
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: CS.white,
          hintStyle: TS.regular.copyWith(fontSize: 13),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: CS.grey.withOpacity(0.5)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: CS.grey.withOpacity(0.5)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 13),
        ),
        menuStyle: MenuStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              side: BorderSide(
                color: CS.grey,
                width: 1,
              ),
            ),
          ),
        ),
        dropdownMenuEntries: [
          for (int index = 0; index < paymentItems.length; index++)
            DropdownMenuEntry(
              style: ButtonStyle(
                textStyle: WidgetStatePropertyAll(
                  TS.regular.copyWith(
                    fontSize: 13,
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  CS.white,
                ),
              ),
              value: paymentItems[index],
              label: paymentItems[index],
            )
        ]);
  }
}
