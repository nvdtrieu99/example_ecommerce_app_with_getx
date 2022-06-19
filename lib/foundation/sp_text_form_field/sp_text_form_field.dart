import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class SPTextFormField extends StatelessWidget {
  SPTextFormField(
      {Key? key,
      required this.text,
      this.validator,
      this.prefixIcon,
      this.textEdittingController,
      this.fieldRequired = false,
      this.isPhoneNumber = false})
      : super(key: key);

  final String text;
  bool fieldRequired;
  String? Function(String? value)? validator;
  Widget? prefixIcon;
  bool isPhoneNumber;
  TextEditingController? textEdittingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEdittingController,
      keyboardType: isPhoneNumber ? TextInputType.phone : TextInputType.text,
      inputFormatters: isPhoneNumber
          ? [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ]
          : [],
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: TextStyle(
                  color: AppColor.cationColor,
                  fontSize: 14,
                ),
              ),
              fieldRequired
                  ? TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 14,
                      ),
                    )
                  : const TextSpan(),
            ],
          ),
        ),
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.cationColor, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.black54,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.red.shade600,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.red.shade600,
          ),
        ),
      ),
    );
  }
}
