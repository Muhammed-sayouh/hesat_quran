import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  void Function()? onTap;
  final double widthRatio;
   CustomButton({ Key? key, required this.title  , this.onTap, this.widthRatio = 0.7}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(context, widthRatio),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.brownLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                style: mediumBlackFont()
                    .copyWith(fontWeight: FontWeight.bold ,color: AppColors.brownDarkColor ,fontSize: 18),
              ),
            ),
          ),
    );
  }
}