import 'package:ecommerce_app/foundation/sp_icon/sp_icon.dart';
import 'package:ecommerce_app/foundation/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileItem extends StatelessWidget {
  ProfileItem({
    Key? key,
    this.title,
    this.subtitle,
    this.assetname,
    this.isLast,
    this.ontap,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  final String? assetname;
  bool? isLast = false;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        color: AppColor.whiteColor,
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Column(
          children: [
            SizedBox(
              height: 68,
              child: ListTile(
                leading: SPIcon(
                  assetname: assetname!,
                ),
                title: Text(
                  title!,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                subtitle: subtitle != null
                    ? Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.caption,
                      )
                    : null,
                trailing: const Icon(
                  CupertinoIcons.chevron_forward,
                  size: 16,
                ),
              ),
            ),
            !isLast! ? const Divider() : Container(),
          ],
        ),
      ),
    );
  }
}
