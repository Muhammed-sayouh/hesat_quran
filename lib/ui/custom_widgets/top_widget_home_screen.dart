import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_textform.dart';

import '../theme/sizes/sizes.dart';
import 'drop_dwon_text_fild.dart';

class TopWidgetHomeScreen extends StatelessWidget {
  const TopWidgetHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: const [
        Expanded(
            child: CustomTextFormFild(
          hint: 'بحث',
        )),
        MediumPadding(
          horizental: true,
        ),
        Expanded(child: DropDown()),
      ],
    );
  }
}
