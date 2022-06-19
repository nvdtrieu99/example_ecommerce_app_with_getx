import 'dart:convert';

import 'package:ecommerce_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/feature/dashboard/dashboard_page.dart';
import 'package:ecommerce_app/feature/login/model/login_model.dart';
import 'package:ecommerce_app/feature/profile_page/controller/profile_controller.dart';
import 'package:ecommerce_app/feature/register/register.dart';
import 'package:ecommerce_app/service/network_handler/network_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController loginEditingController = TextEditingController();
  final ProfileController profileController;

  LoginController(this.profileController);
//
  void login() async {
    // print("LoginEditting: ${loginEditingController.text}");
    LoginModel loginModel = LoginModel(mobileNo: loginEditingController.text);
    // print("LoginModel: ${loginModelToJson(loginModel)}");
    var response =
        await NetworkHandler.post(loginModelToJson(loginModel), "login");

    var data = json.decode(response);
    if (data["msg"] == "register") {
      Get.to(() => Register());
    } else {
      await NetworkHandler.storeToken(data["token"]);
      profileController.checkLogin();
      Get.offAll(() => DashBoardPage());
      Get.find<DashBoardController>().changTabIndex(0);
      // update(['jsaf']);
    }
  }
}
