import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lynks_pos_system/controllers/customers_controller.dart';
import 'package:lynks_pos_system/controllers/table_toggle_controller.dart';
import 'package:lynks_pos_system/util/constants.dart';

enum CustomTextButtonType { KOT, decor }

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final CustomTextButtonType? type;
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.color,
      this.type = CustomTextButtonType.decor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(color: darkBlue),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        child: Text(text,
            style: const TextStyle(
                color: Colors.white, overflow: TextOverflow.fade),
            softWrap: true),
        onPressed: () {});
  }
}
