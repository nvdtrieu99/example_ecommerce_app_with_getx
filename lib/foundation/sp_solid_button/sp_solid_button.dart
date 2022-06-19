import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';

class SPSolidButton extends StatelessWidget {
  SPSolidButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  String title;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(
        primary: AppColor.selectedColor,
      ),
    );
  }
}
