import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/ui/screens/category_details/category_details_screeen.dart';

import '../../view_model/sora_details_view_model.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';

class SoraPropertiesList extends StatelessWidget {
  final String soraId;
  const SoraPropertiesList({
    Key? key,
    required this.provider,
    required this.soraId,
  }) : super(key: key);

  final SoraDetialsViewModel provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: width(context, 0.3),
            height:
                provider.expand ? height(context, 0.58) : height(context, 0.35),
            child: ListView.builder(
              itemCount: provider.categories.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Get.to(() => CategoryDetailsScreen(
                      categoryId: provider.categories[index].id,
                      soraId: soraId,
                      categoryName: provider.categories[index].name,
                    )),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.brownLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: Text(
                    provider.categories[index].name,
                    textAlign: TextAlign.center,
                    style: sSmallBlackFont().copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.brownDarkColor),
                  )),
                ),
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
                      '????????????',
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
