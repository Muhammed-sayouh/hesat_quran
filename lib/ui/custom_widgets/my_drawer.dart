import 'package:flutter/material.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/ui/screens/about_developer/about_developer_screen.dart';
import 'package:hesat_quran/ui/screens/about_us_screen/about_us_screen.dart';
import 'package:hesat_quran/ui/screens/audio_quran/audio_quran.dart';
import 'package:hesat_quran/ui/screens/contact_us/contact_us_screen.dart';
import 'package:hesat_quran/ui/screens/continue_reading/continue_reading_screen.dart';
import 'package:hesat_quran/ui/screens/missions_screen/missions_screen.dart';
import 'package:hesat_quran/ui/screens/notes_screen/notes_screen.dart';

import '../../helpers/constants.dart';
import '../theme/sizes/sizes.dart';
import 'drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: commonPaddingHorizental(context),
        width: width(context, 0.58),
        height: height(context, 1),
        color: Colors.white,
        child: Column(
          children: [
            const BigPadding(),
            Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: CustomAssetImage(
                    imagePath: Constants.xMark,
                    width: width(context, 0.09),
                  ),
                )),
            const BigPadding(),
            SizedBox(
              height: height(context, 0.09),
              child: Image.asset(
                Constants.textLogoImage,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: height(context, 0.03),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                DrawerItem(
                  image: Constants.homeIcon,
                  title: Constants.main,
                  onTap: () => Get.back(),
                ),
                DrawerItem(
                  image: Constants.readingIcon,
                  title: Constants.voiceQuran,
                  onTap: () => Get.to(() => const AudioQuranReaders(),
                      transition: Transition.downToUp),
                ),
                DrawerItem(
                  image: Constants.readingIcon,
                  title: Constants.countineReading,
                  onTap: () => Get.to(() => const ContinueReadingScreen(),
                      transition: Transition.downToUp),
                ),
                DrawerItem(
                  image: Constants.missionsIcon,
                  title: Constants.missions,
                  onTap: () => Get.to(() => const MissionsScreen(),
                      transition: Transition.downToUp),
                ),
                DrawerItem(
                  image: Constants.notesIcon,
                  title: Constants.notes,
                  onTap: () => Get.to(() => const NotesScreen(),
                      transition: Transition.downToUp),
                ),
                DrawerItem(
                  image: Constants.infoIcon,
                  title: Constants.whoUs,
                   onTap: () => Get.to(() => const aboutUsScreen(),
                      transition: Transition.downToUp),
                ),
                DrawerItem(
                    onTap: () => Get.to(() => const ContactUsScreen(),
                      transition: Transition.downToUp),
                  image: Constants.phoneIcon,
                  title: Constants.callUs,
                ),
                DrawerItem(
                    onTap: () => Get.to(() => const AboutDeveloperScreen(),
                      transition: Transition.downToUp),
                    image: Constants.developerIcon,
                    title: Constants.aboutDeleoper),
              ],
            )
          ],
        ),
      ),
    );
  }
}
