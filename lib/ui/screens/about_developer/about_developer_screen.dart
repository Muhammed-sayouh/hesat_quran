import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

import '../../../models/my_sitting_model.dart';
import '../../../services/get_sitting.dart';
import '../../theme/style/colors.dart';

class AboutDeveloperScreen extends StatefulWidget {
  const AboutDeveloperScreen({Key? key}) : super(key: key);

  @override
  State<AboutDeveloperScreen> createState() => _AboutDeveloperScreenState();
}

class _AboutDeveloperScreenState extends State<AboutDeveloperScreen> {
  bool loader = false;
  List<MySittingModel> sitting = [];
  Future<void> fetchData(BuildContext context) async {
    loader = true;
    try {
      sitting = await getMySittingService();
      print(sitting.length);
      setState(() {
        loader = false;
      });
    } catch (error) {
      rethrow;
    }
  }

  @override
  void initState() {
    fetchData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "عن المطور"),
      body:loader? const CupertinoActivityIndicator():Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const BigPadding(),
          const BigPadding(),
          const BigPadding(),
          const CustomAssetImage(
            imagePath: Constants.logoImage,
            width: 100,
          ),
          const BigPadding(),
          Text(
            "حصه قران",
            style: mediumBlackFont().copyWith(
                color: AppColors.brownDarkColor, fontWeight: FontWeight.bold),
          ),
          const BigPadding(),
          Text(
            "${sitting[5].name} ${sitting[5].description}",
            style: mediumBlackFont().copyWith(
                color: AppColors.brownDarkColor, fontWeight: FontWeight.bold),
          ),
          const BigPadding(),
          Text(
            "تصميم وبرمجة",
            style: mediumBlackFont().copyWith(
                color: AppColors.brownDarkColor, fontWeight: FontWeight.bold),
          ),
          const BigPadding(),
          Text(
            "مؤسسة التميز العربي",
            style: mediumBlackFont().copyWith(
                color: AppColors.brownDarkColor, fontWeight: FontWeight.bold),
          ),
           const BigPadding(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomAssetImage(imagePath: Constants.whatsAppIcon,width: 25,),
            
              Text(
               "${sitting[6].name} ${sitting[6].description}",
                style: mediumBlackFont().copyWith(
                    color: AppColors.brownDarkColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
