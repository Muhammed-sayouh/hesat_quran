import 'package:flutter/material.dart';
import 'package:hesat_quran/view_model/missions_view_model.dart';
import 'package:hesat_quran/view_model/notes_view_model.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../models/my_notes_model.dart';
import '../theme/sizes/sizes.dart';
import '../theme/style/colors.dart';
import '../theme/style/font_style.dart';
import 'custom_images.dart';

class MissionsAndNotesItem extends StatelessWidget {
  final String title;
  final String id;
  final String details;
  final bool note;
  const MissionsAndNotesItem({
    Key? key,
    required this.title,
    required this.id,
    required this.details,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesViewModel>(context);
    final missionProvider = Provider.of<MissionsViewModel>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: AppColors.darkGray!)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: smallBlackFont().copyWith(fontWeight: FontWeight.bold),
                ),
                const MediumPadding(),
                Text(
                  details,
                  style: sSmallBlackFont().copyWith(color: Colors.grey),
                ),
              ],
            ),
            InkWell(
              onTap: note
                  ? () => provider.deleteNote(context, id)
                  : () => missionProvider.deleteMission(context, id),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColors.gray, shape: BoxShape.circle),
                child: const CustomAssetImage(
                  imagePath: Constants.xMark,
                  width: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
