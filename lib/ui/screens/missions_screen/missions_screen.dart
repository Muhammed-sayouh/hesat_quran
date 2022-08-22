import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/screens/add_mission/add_mission.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';
import 'package:hesat_quran/view_model/missions_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/custom_images.dart';
import '../../custom_widgets/missions_item.dart';
import '../../theme/style/colors.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({Key? key}) : super(key: key);

  @override
  State<MissionsScreen> createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {
  @override
  void initState() {
    Provider.of<MissionsViewModel>(context, listen: false)
        .fetchMission(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MissionsViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, Constants.missions),
      body: provider.getmissionsLoader
          ? const Center(child: CupertinoActivityIndicator())
          : provider.missions.isEmpty
              ? Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'عفوا',
                      style: titleStyle().copyWith(
                          color: AppColors.brownDarkColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'لا توجد مهام',
                      style: bigBlackFont().copyWith(
                        color: AppColors.brownAccentColor,
                      ),
                    )
                  ],
                ))
              : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: commonPaddingHorizental(context),
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) => MissionsAndNotesItem(
                        details: provider.missions[index].details,
                        id: provider.missions[index].id,
                        title: provider.missions[index].title,
                        note: false,
                      ),
                    ),
                  ),
                ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: InkWell(
          onTap: () => Get.to(() => const AddMissionScreen(),
              transition: Transition.downToUp),
          child: const CustomAssetImage(
            imagePath: Constants.addIcon,
            width: 55,
          )),
    );
  }
}
