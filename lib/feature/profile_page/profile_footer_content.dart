import 'package:ecommerce_app/foundation/sp_text_button/sp_text_button.dart';
import 'package:flutter/material.dart';

class ProfileFooterContent extends StatelessWidget {
  const ProfileFooterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SPTextButton(title: "FAQs"),
        SPTextButton(title: "ABOUT US"),
        SPTextButton(title: "TERMS OF USE"),
        SPTextButton(title: "PRIVACY POLICY"),
      ],
    );
  }
}
