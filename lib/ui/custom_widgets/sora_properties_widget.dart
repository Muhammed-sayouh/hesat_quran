import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../view_model/sora_details_view_model.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class SoraPropertiesList extends StatelessWidget {
  const SoraPropertiesList({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final SoraDetialsViewModel provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: width(context, 0.28),
            height: provider.expand
                ? height(context, 0.58)
                : height(context, 0.35),
            child: ListView.builder(
              itemCount: 9,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(3),
                margin: const EdgeInsets.symmetric(
                    vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.brownLightColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  'data',
                  style: mediumBlackFont().copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.brownDarkColor),
                )),
              ),
            )),
        provider.expand
            ? const SizedBox()
            : SizedBox(
                height: height(context, 0.023),
              ),
        provider.expand
            ? const SizedBox()
            : Row(
                children: [
                  InkWell(
                    onTap: () => provider.expandList(),
                    child: Text(
                      'المزيد',
                      style: bigBlackFont().copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.brownDarkColor,
                          height: 1.3),
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 20,
                    color: AppColors.brownDarkColor,
                  )
                ],
              ),
      ],
    );
  }
}
