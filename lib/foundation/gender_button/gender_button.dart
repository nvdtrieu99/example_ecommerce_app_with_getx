import 'package:ecommerce_app/feature/register/controller/register_controller.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderButton extends StatelessWidget {
  GenderButton({
    Key? key,
    required this.onGenderTap,
  }) : super(key: key);

  Function(String value) onGenderTap;
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      // width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.cationColor,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                onGenderTap("Female");
              },
              child: Obx(
                () => Container(
                  child: Center(
                    child: Text(
                      "Female",
                      style: (registerController.gender.value == "female")
                          ? const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          : null,
                    ),
                  ),
                  color: registerController.gender.value == "female"
                      ? Colors.red
                      : null,
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: AppColor.cationColor,
            thickness: 2,
            width: 0,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                onGenderTap("Male");
              },
              child: Obx(
                () => Container(
                  child: Center(
                    child: Text(
                      "Male",
                      style: (registerController.gender.value == "male")
                          ? const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          : null,
                    ),
                  ),
                  color: registerController.gender.value == "male"
                      ? Colors.red
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
