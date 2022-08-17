import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

import '../../custom_widgets/custom_textform.dart';

class AddMissionScreen extends StatelessWidget {
  const AddMissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, Constants.addMission),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: commonPaddingHorizental(context),
            child: Column(
              children: [
                const BigPadding(),
                const CustomTextFieldAddMission(
                  title: Constants.missionAddress,
                ),     const CustomTextFieldAddMission(
                  title: Constants.missionDetials,
                  maxLines: 8,
                ),     const CustomTextFieldAddMission(
                  title: Constants.missionDate,
                ),
                     const CustomTextFieldAddMission(
                  title: Constants.missionTime,
                ),

                const BigPadding(),
                CustomButton(title: Constants.addText)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

