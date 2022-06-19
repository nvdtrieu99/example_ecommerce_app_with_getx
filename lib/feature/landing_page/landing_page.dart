import 'package:ecommerce_app/feature/categories_page/categories_page.dart';
import 'package:ecommerce_app/feature/home_page/home_page.dart';
import 'package:ecommerce_app/feature/landing_page/controller/landingpage_controller.dart';
import 'package:ecommerce_app/feature/profile_page/profile_page.dart';
import 'package:ecommerce_app/foundation/sp_icon/sp_icon.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;
  List<Widget> pages = const [HomePage(), CategoriesPage(), ProfilePage()];
  var landingPageController = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xfffe416c),
        selectedLabelStyle: const TextStyle(
          fontSize: 13,
        ),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SPIcon(
              assetname: "logo-black.png",
              index: 0,
              currentIndex: currentIndex,
              isSelected: 0 == currentIndex,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SPIcon(
              assetname: "categories.png",
              index: 1,
              currentIndex: currentIndex,
              isSelected: 1 == currentIndex,
            ),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: SPIcon(
              assetname: "profile.png",
              index: 2,
              currentIndex: currentIndex,
              isSelected: 2 == currentIndex,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }

  Widget returnBody() {
    switch (currentIndex) {
      case 0:
        return HomePage();

      case 1:
        return CategoriesPage();

      case 2:
        return ProfilePage();

      default:
        return HomePage();
    }
  }
}
