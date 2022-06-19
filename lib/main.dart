import 'package:ecommerce_app/feature/profile_page/controller/profile_controller.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/dashboard/controller/dashboard_controller.dart';
import 'feature/dashboard/dashboard_page.dart';

void main() {
  Get.put(DashBoardController());
  Get.put(ProfileController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color: AppColor.heading6,
          ),
          bodyText1: TextStyle(color: AppColor.bodyColor1, fontSize: 14),
          caption: TextStyle(
            color: AppColor.cationColor,
            fontSize: 11,
          ),
        ),
      ),
      title: "Myntra",
      // home: const LandingPage(),
      home: DashBoardPage(),
    );
  }
}
