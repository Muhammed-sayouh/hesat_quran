import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';

class TowDotsWidget extends StatelessWidget {
  final bool first;
  const TowDotsWidget({Key? key, required this.first}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 8,
          child: const Text(''),
          decoration: BoxDecoration(
              color: !first
                  ? AppColors.brownLightColor
                  : AppColors.brownAccentColor,
              shape: BoxShape.circle),
        ),
        const SmallPadding(
          horizental: true,
        ),
        Container(
          width: 8,
          child: const Text(''),
          decoration: BoxDecoration(
              color: first
                  ? AppColors.brownLightColor
                  : AppColors.brownAccentColor,
              shape: BoxShape.circle),
        ),
      ],
    );
  }
}
