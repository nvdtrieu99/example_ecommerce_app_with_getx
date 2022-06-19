import 'dart:convert';

import 'package:ecommerce_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/feature/dashboard/dashboard_page.dart';
import 'package:ecommerce_app/feature/login/controller/login_controller.dart';
import 'package:ecommerce_app/feature/profile_page/controller/profile_controller.dart';
import 'package:ecommerce_app/feature/register/model/register_model.dart';
import 'package:ecommerce_app/service/network_handler/network_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController fullNameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController mobileNumberTextController = TextEditingController();
  TextEditingController hintTextController = TextEditingController();
  var loginController = Get.find<LoginController>();
  final ProfileController profileController;
  RegisterController(this.profileController);

  RxString gender = "".obs;

  void register() async {
    RegisterModel registerModel = RegisterModel(
      mobileNo: loginController.loginEditingController.text,
      password: passwordTextController.text,
      fullname: fullNameTextController.text,
      email: emailTextController.text,
      gender: gender.value,
      alternateMoNumber: mobileNumberTextController.text,
      hint: hintTextController.text,
    );

    var response = await NetworkHandler.post(
        registerModelToJson(registerModel), "login/register");
    // print(response);
    var data = json.decode(response);
    await NetworkHandler.storeToken(data["token"]);
    profileController.checkLogin();
    Get.offAll(() => DashBoardPage());
    Get.find<DashBoardController>().changTabIndex(0);
    // update(['jsaf']);
  }
}
