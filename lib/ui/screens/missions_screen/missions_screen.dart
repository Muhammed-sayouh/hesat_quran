import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/screens/add_mission/add_mission.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

import '../../custom_widgets/custom_images.dart';
import '../../custom_widgets/missions_item.dart';
import '../../theme/style/colors.dart';

class MissionsScreen extends StatelessWidget {
  const MissionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, Constants.missions),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: commonPaddingHorizental(context),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) => const MissionsItem(),
          ),
        ),
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.miniStartFloat ,
      floatingActionButton: InkWell(
                   onTap:()=> Get.to(()=>const AddMissionScreen(),transition: Transition.downToUp),
          child: const CustomAssetImage(
            imagePath: Constants.addIcon,
            width: 55,
          )),
    );
  }
}

