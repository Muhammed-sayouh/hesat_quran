import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/helpers/validations.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_buttons.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/custom_textform.dart';

class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, Constants.addNote),
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
                    title: Constants.notesTitle,
                    validator: (val) =>
                        Validations.validationrequiredField(val!),
                    controller: provider.title,
                  ),
                  CustomTextFieldAddMission(
                    controller: provider.details,
                    validator: (val) =>
                        Validations.validationrequiredField(val!),
                    title: Constants.notesDetials,
                    maxLines: 8,
                  ),
                  const BigPadding(),
                  provider.loader
                      ? const CupertinoActivityIndicator()
                      : CustomButton(
                          title: Constants.addText,
                          onTap: () => provider.addNote(context , formKey),
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
