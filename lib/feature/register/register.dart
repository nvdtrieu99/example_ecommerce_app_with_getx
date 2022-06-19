import 'package:ecommerce_app/feature/login/controller/login_controller.dart';
import 'package:ecommerce_app/feature/profile_page/controller/profile_controller.dart';
import 'package:ecommerce_app/feature/register/controller/register_controller.dart';
import 'package:ecommerce_app/foundation/gender_button/gender_button.dart';
import 'package:ecommerce_app/foundation/sp_solid_button/sp_solid_button.dart';
import 'package:ecommerce_app/foundation/sp_text_form_field/sp_text_form_field.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:ecommerce_app/foundation/validate_password_register/validate_password_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  var loginController = Get.find<LoginController>();
  var registerController =
      Get.put(RegisterController(Get.find<ProfileController>()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Complete your sign up",
          style: TextStyle(
            fontSize: 18,
            color: AppColor.dummyBGColor,
          ),
        ),
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: AppColor.whiteColor,
        leading: BackButton(color: AppColor.dummyBGColor),
      ),
      backgroundColor: AppColor.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile number",
                      style:
                          TextStyle(color: AppColor.cationColor, fontSize: 10),
                    ),
                    Row(
                      children: [
                        Text(
                          loginController.loginEditingController.text,
                          style:
                              TextStyle(fontSize: 16, color: AppColor.heading6),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.check_circle,
                          color: Colors.green.shade700,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SPTextFormField(
                  textEdittingController:
                      registerController.passwordTextController,
                  text: "Create Password",
                  fieldRequired: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ValidatePasswordRegister(
                      text: "8 Characters",
                    ),
                    ValidatePasswordRegister(
                      text: "1 Special",
                    ),
                    ValidatePasswordRegister(
                      text: "1 Uppercase",
                    ),
                    ValidatePasswordRegister(
                      text: "1 Numberic",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SPTextFormField(
                  text: "Full Name (Optional)",
                  textEdittingController:
                      registerController.fullNameTextController,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SPTextFormField(
                  text: "Email (Optional)",
                  textEdittingController:
                      registerController.emailTextController,
                ),
                const SizedBox(
                  height: 30,
                ),
                GenderButton(
                  onGenderTap: (value) {
                    registerController.gender.value = value.toLowerCase();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPTextFormField(
                      textEdittingController:
                          registerController.mobileNumberTextController,
                      text: "Alternate Mobile Number",
                      isPhoneNumber: true,
                      prefixIcon: Padding(
                        padding:
                            const EdgeInsets.only(left: 30, top: 15, right: 15),
                        child: Text(
                          "+84 |",
                          style: TextStyle(
                            color: AppColor.cationColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "This will help recover your account if you needed",
                        style: TextStyle(
                          color: AppColor.cationColor,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SPTextFormField(
                      text: "Hint name",
                      textEdittingController:
                          registerController.hintTextController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "This name will be a hint for your alternate number",
                        style: TextStyle(
                          color: AppColor.cationColor,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "I have a referal code",
                    style: TextStyle(
                      color: AppColor.selectedColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SPSolidButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        registerController.register();
                      }
                    },
                    title: "CREATE ACCOUNT",
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
