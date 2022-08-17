import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';
import 'custom_images.dart';

class MissionsItem extends StatelessWidget {
  const MissionsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: AppColors.darkGray!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'عنوان المهمه',
                  style: smallBlackFont()
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const MediumPadding(),
                Text(
                  'عنوان المهمه',
                  style: sSmallBlackFont().copyWith(color: Colors.grey),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColors.gray, shape: BoxShape.circle),
              child: const CustomAssetImage(
                imagePath: Constants.xMark,
                width: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
