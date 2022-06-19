import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';

class ValidatePasswordRegister extends StatelessWidget {
  const ValidatePasswordRegister({Key? key, required this.text})
      : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 5.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.bodyColor1,
          fontSize: 12,
        ),
      ),
      color: Colors.grey.shade200,
    );
  }
}
