import 'dart:convert';

import 'package:ecommerce_app/data/model/user.dart';
import 'package:ecommerce_app/service/network_handler/network_handler.dart';
import 'package:get/get.dart';

class LandingPageController extends GetxController {
  RxString token = "".obs;
  RxBool loggedIn = false.obs;
  User? user;
  // GetxService s

  @override
  void onInit() async {
    // TODO: implement onInit
    await checkLogin();
    super.onInit();
  }

  Future<void> checkLogin() async {
    var scopedToken = await NetworkHandler.getToken();
    if (scopedToken != null) {
      loggedIn.value = true;
      token.value = scopedToken;

      var response = await NetworkHandler.get("user-details", token.value);
      var data = json.decode(response);
      user = User.fromJon(data["result"]);
    }
  }

  void logOut() async {
    await NetworkHandler.removeToken();
    loggedIn.value = false;
    user = null;
    token.value = "";
  }
}
