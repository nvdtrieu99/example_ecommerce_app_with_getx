import 'package:ecommerce_app/feature/login/controller/login_controller.dart';
import 'package:ecommerce_app/feature/profile_page/controller/profile_controller.dart';
import 'package:ecommerce_app/foundation/sp_solid_button/sp_solid_button.dart';
import 'package:ecommerce_app/foundation/sp_text_form_field/sp_text_form_field.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginBottomSheet extends StatelessWidget {
  LoginBottomSheet({Key? key}) : super(key: key);
  var formKeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 25.0,
      ),
      height: size.height * 0.5,
      width: size.width,
      color: AppColor.whiteColor,
      child: GetBuilder<LoginController>(
        id: 'jsaf',
        init: LoginController(Get.find<ProfileController>()),
        builder: (controller) => SingleChildScrollView(
          child: Form(
            key: formKeyLogin,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/logo-color.png",
                      scale: 3.5,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (() => Get.back()),
                      child: const Icon(CupertinoIcons.multiply),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Signup",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SPTextFormField(
                  text: "Mobile Number",
                  fieldRequired: true,
                  isPhoneNumber: true,
                  textEdittingController: controller.loginEditingController,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      "+84 |",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Mobile number is required field";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "By continuing, I agree to the ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "Terms of Use",
                        style: TextStyle(
                          color: AppColor.selectedColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(
                        text: " & ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                          color: AppColor.selectedColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SPSolidButton(
                  title: "CONTINUE",
                  onPressed: () {
                    if (formKeyLogin.currentState!.validate()) {
                      controller.login();
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Having trouble logging in? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        TextSpan(
                          text: "Get help",
                          style: TextStyle(
                            color: AppColor.selectedColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
