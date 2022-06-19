import 'package:ecommerce_app/feature/categories_page/categories_page.dart';
import 'package:ecommerce_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:ecommerce_app/feature/home_page/home_page.dart';
import 'package:ecommerce_app/feature/profile_page/profile_page.dart';
import 'package:ecommerce_app/foundation/sp_icon/sp_icon.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatelessWidget {
  DashBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      init: DashBoardController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColor.scaffoldBGColor,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            selectedItemColor: const Color(0xfffe416c),
            selectedLabelStyle: const TextStyle(
              fontSize: 13,
            ),
            onTap: controller.changTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: SPIcon(
                  assetname: "logo-black.png",
                  index: 0,
                  currentIndex: controller.currentIndex,
                  isSelected: 0 == controller.currentIndex,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SPIcon(
                  assetname: "categories.png",
                  index: 1,
                  currentIndex: controller.currentIndex,
                  isSelected: 1 == controller.currentIndex,
                ),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: SPIcon(
                  assetname: "profile.png",
                  index: 2,
                  currentIndex: controller.currentIndex,
                  isSelected: 2 == controller.currentIndex,
                ),
                label: "Profile",
              ),
            ],
          ),
          body: IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomePage(),
              CategoriesPage(),
              ProfilePage(),
            ],
          ),
        );
      },
    );
  }
}
