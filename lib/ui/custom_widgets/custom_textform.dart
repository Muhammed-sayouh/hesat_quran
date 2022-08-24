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
      decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          prefixIcon: Icon(
            Icons.search,
            size: 24,
            color: AppColors.darkGray,
          ),
          hintStyle: TextStyle(
            height: 1.6,
            color: AppColors.darkGray,
          )),
    );
  }
}

class CustomTextFieldAddMission extends StatelessWidget {
  final String title;
  final bool enebled;
  final int? maxLines;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const CustomTextFieldAddMission(
      {Key? key,
      required this.title,
      this.enebled = true,
      this.maxLines = 1,
      this.controller,
      this.validator, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: sBigBlackFont().copyWith(fontWeight: FontWeight.bold),
        ),
        const BigPadding(),
        TextFormField(
          validator: validator,
          controller: controller,
          enabled: enebled,
          maxLines: maxLines,
          keyboardType: keyboardType,
        ),
        const MediumPadding(),
      ],
    );
  }
}
