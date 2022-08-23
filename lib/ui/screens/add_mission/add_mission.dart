import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/helpers/validations.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/view_model/missions_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/custom_textform.dart';

class AddMissionScreen extends StatelessWidget {
   AddMissionScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MissionsViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, Constants.addMission),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Padding(
            padding: commonPaddingHorizental(context),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const BigPadding(),
                  CustomTextFieldAddMission(
                    title: Constants.missionAddress,
                    controller: provider.title,
                    validator: (val) => Validations.validationrequiredField(val!),
                  ),
                  CustomTextFieldAddMission(
                    title: Constants.missionDetials,
                    controller: provider.details,
                    validator: (val) => Validations.validationrequiredField(val!),
                    maxLines: 8,
                  ),
                  InkWell(
                    onTap: () => provider.selectTime(context, Container()),
                    child: CustomTextFieldAddMission(
                      title: Constants.missionDate,
                    validator: (val) => Validations.validationrequiredField(val!),
            
                      enebled: false,
                      controller: provider.time,
                    ),
                  ),
                  InkWell(
                    onTap: () => provider.selectDate(context),
                    child: CustomTextFieldAddMission(
                      title: Constants.missionTime,
                    validator: (val) => Validations.validationrequiredField(val!),
            
                      enebled: false,
                      controller: provider.date,
                    ),
                  ),
                  const BigPadding(),
                  CustomButton(title: Constants.addText,
                  onTap: ()=>provider.addMission(context, formKey),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
