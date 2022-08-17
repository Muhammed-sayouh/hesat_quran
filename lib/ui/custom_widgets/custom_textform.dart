import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';

import '../theme/sizes/sizes.dart';
import '../theme/style/font_style.dart';

class CustomTextFormFild extends StatelessWidget {
  final String hint;
  const CustomTextFormFild({Key? key, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.brownDarkColor,
      decoration: InputDecoration(isDense: true, hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0,vertical:10),
      prefixIcon: Icon(Icons.search,size: 24,color: AppColors.darkGray,),

      hintStyle: TextStyle(height: 1.6,color: AppColors.darkGray,)
      ),
    );
  }
}


class CustomTextFieldAddMission extends StatelessWidget {
  final String title;
  final bool enebled;
  final int? maxLines;
  const CustomTextFieldAddMission({
    Key? key,
    required this.title,
    this.enebled = true,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: mediumBlackFont().copyWith(fontWeight: FontWeight.bold),),
        const BigPadding(),
        TextFormField(
          enabled: enebled,
          maxLines: maxLines,
        )
        ,
        const MediumPadding(),
      ],
    );
  }
}
