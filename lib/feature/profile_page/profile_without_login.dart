import 'package:ecommerce_app/feature/login/login_bottomsheet.dart';
import 'package:ecommerce_app/feature/profile_page/controller/profile_controller.dart';
import 'package:ecommerce_app/feature/profile_page/profile_footer_content.dart';
import 'package:ecommerce_app/foundation/profile_item/profile_item.dart';
import 'package:ecommerce_app/foundation/sp_solid_button/sp_solid_button.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWithoutLogin extends StatelessWidget {
  ProfileWithoutLogin({Key? key}) : super(key: key);

  // var landingPageController = Get.find<LandingPageController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.12,
                      color: AppColor.dummyBGColor,
                    ),
                    Container(
                      height: size.height * 0.10,
                      color: AppColor.whiteColor,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    width: size.width,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 132,
                          height: 132,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Image.asset(
                                "assets/images/profile.png",
                                color: AppColor.dummyBGColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        GetBuilder<ProfileController>(
                          init: ProfileController(),
                          builder: ((controller) => Expanded(
                                child: controller.loggedIn
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          if (controller.user != null)
                                            Text(
                                                "${controller.user!.fullname}"),
                                          SPSolidButton(
                                            title: "LOG OUT",
                                            onPressed: () {
                                              controller.logOut();
                                            },
                                          ),
                                        ],
                                      )
                                    : ElevatedButton(
                                        onPressed: () {
                                          Get.bottomSheet(LoginBottomSheet());
                                        },
                                        child: const Text(
                                          "LOG IN/SIGN UP",
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColor.selectedColor,
                                        ),
                                      ),
                              )),
                        ),
                        // Obx(
                        //   () => Expanded(
                        //     child: landingPageController.loggedIn.value
                        //         ? Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.stretch,
                        //             children: [
                        //               if (landingPageController.user != null)
                        //                 Text(
                        //                     "${landingPageController.user!.fullname}"),
                        //               SPSolidButton(
                        //                 title: "LOG OUT",
                        //                 onPressed: () {
                        //                   landingPageController.logOut();
                        //                 },
                        //               ),
                        //             ],
                        //           )
                        //         : ElevatedButton(
                        //             onPressed: () {
                        //               Get.bottomSheet(LoginBottomSheet());
                        //             },
                        //             child: const Text(
                        //               "LOG IN/SIGN UP",
                        //             ),
                        //             style: ElevatedButton.styleFrom(
                        //               primary: AppColor.selectedColor,
                        //             ),
                        //           ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: AppColor.whiteColor,
              child: Column(
                children: [
                  ProfileItem(
                    assetname: "orders.png",
                    title: "Orders",
                    subtitle: "Check your orders",
                    isLast: false,
                    ontap: () {
                      Get.bottomSheet(LoginBottomSheet());
                    },
                  ),
                  ProfileItem(
                    assetname: "help-desk.png",
                    title: "Help Center",
                    subtitle: "Help regarding your recent purchase",
                    isLast: false,
                  ),
                  ProfileItem(
                    assetname: "wishlist.png",
                    title: "Wishlist",
                    subtitle: "Your most love style",
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              color: AppColor.whiteColor,
              child: Column(
                children: [
                  ProfileItem(
                    assetname: "orders.png",
                    title: "Scan for coupon",
                    // subtitle: "Check your orders",
                    isLast: false,
                  ),
                  ProfileItem(
                    assetname: "wishlist.png",
                    title: "Prefer & Eanr",
                    // subtitle: "Your most love style",
                    isLast: true,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const ProfileFooterContent(),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 10,
              ),
              child: Center(
                child: Text(
                  "Version 5.31.2022",
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
