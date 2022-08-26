import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';

import '../theme/sizes/sizes.dart';
import '../theme/style/font_style.dart';

class CustomTextFormFild extends StatelessWidget {
  final String hint;
  void Function()? onTap;
  TextEditingController? controller;
   CustomTextFormFild({Key? key, required this.hint , required this.onTap , this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ,
      cursorColor: AppColors.brownDarkColor,
      decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          prefixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              Icons.search,
              size: 24,
              color: AppColors.darkGray,
            ),
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
