import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/screens/add_notes/add_notes_screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/custom_images.dart';
import '../../custom_widgets/missions_item.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    Provider.of<NotesViewModel>(context, listen: false).fetchNotes(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesViewModel>(context);
    return Scaffold(
      appBar: commonAppBar(context, Constants.notes),
      body: provider.getNotesLoader
          ? const Center(child: CupertinoActivityIndicator())
          : Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: commonPaddingHorizental(context),
                child: ListView.builder(
                  itemCount: provider.notes.length,
                  itemBuilder: (context, index) => MissionsAndNotesItem(
                      title: provider.notes[index].title,
                      details: provider.notes[index].details,
                      id: provider.notes[index].id , 
                      note: true,
                      ),
                ),
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: InkWell(
          onTap: () =>
              Get.to(() => AddNotesScreen(), transition: Transition.downToUp)
                  ?.then((value) => provider.fetchNotes(context)),
          child: const CustomAssetImage(
            imagePath: Constants.addIcon,
            width: 55,
          )),
    );
  }
}
