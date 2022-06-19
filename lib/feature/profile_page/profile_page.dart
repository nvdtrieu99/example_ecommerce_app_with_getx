import 'package:ecommerce_app/feature/profile_page/profile_without_login.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Profile",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      body: ProfileWithoutLogin(),
    );
  }
}
