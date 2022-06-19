import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';

class SPTextButton extends StatelessWidget {
  const SPTextButton({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.only(left: 70.0, top: 14.0, bottom: 14.0),
        width: double.infinity,
        color: AppColor.whiteColor,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            color: AppColor.heading6,
          ),
        ),
      ),
    );
  }
}
