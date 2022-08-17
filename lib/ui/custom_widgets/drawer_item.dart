import 'package:flutter/material.dart';

import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';
import 'custom_images.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final String image;
  final bool? isLastItem;
  void Function()? onTap;
   DrawerItem({
    Key? key,
    required this.title,
    required this.image,
    this.onTap,
    this.isLastItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap ,
          child: ListTile(
            dense: true,
            leading: Container(
              padding: const EdgeInsets.all(11),
              decoration:
                  BoxDecoration(color: AppColors.gray, shape: BoxShape.circle),
              child: CustomAssetImage(
                imagePath: image,
                width: 18,
              ),
            ),
            title: Text(
              title,
              style: mediumBlackFont().copyWith(fontWeight: FontWeight.bold ,fontSize: 13),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
