import 'dart:convert';

import 'package:ecommerce_app/data/model/user.dart';
import 'package:ecommerce_app/service/network_handler/network_handler.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  String token = "";
  bool loggedIn = false;
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
      loggedIn = true;
      token = scopedToken;

      var response = await NetworkHandler.get("user-details", token);
      var data = json.decode(response);
      user = User.fromJon(data["result"]);
    }
    update();
  }

  void logOut() async {
    await NetworkHandler.removeToken();
    loggedIn = false;
    user = null;
    token = "";
    update();
  }
}
