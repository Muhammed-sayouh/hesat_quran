import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String title;
  void Function()? onTap;
  final double widthRatio;
  final double fontSized;
  final double textPadding ;
   CustomButton({ Key? key, required this.title  , this.onTap, this.widthRatio = 0.7 , this.fontSized = 18,  this.textPadding = 8}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width(context, widthRatio),
            padding:  EdgeInsets.all(textPadding),
            decoration: BoxDecoration(
              color: AppColors.brownLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                title,
                style: mediumBlackFont()
                    .copyWith(fontWeight: FontWeight.bold ,color: AppColors.brownDarkColor ,fontSize: fontSized),
              ),
            ),
          ),
    );
  }
}