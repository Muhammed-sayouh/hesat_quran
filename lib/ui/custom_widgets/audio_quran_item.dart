import 'package:flutter/material.dart';

import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';
import 'custom_images.dart';

class AudioQuranItem extends StatelessWidget {
  final String image;
  final String name;
  const AudioQuranItem({
    Key? key, required this.image, required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: commonPaddingHorizental(context),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.brownLightColor,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: CustomNetworkImage(
                    imagePath:
                       image,
                    height: height(context, 0.18),
                    width: height(context, 0.18),
                  ),
                ),
                SizedBox(
                  height: height(context, 0.03),
                ),
                Text(
                  name,
                  style: mediumBlackFont().copyWith(
                      color: AppColors.brownDarkColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        );
  }
}
