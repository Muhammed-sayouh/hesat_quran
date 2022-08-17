import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';

import '../../custom_widgets/audio_quran_item.dart';

class AudioQuran extends StatelessWidget {
  const AudioQuran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, Constants.voiceQuran),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GridView.builder(
            itemCount: 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1 / 1.21),
            itemBuilder: (BuildContext context, int index) => const AudioQuranItem(
              image:  "https://upload.wikimedia.org/wikipedia/commons/e/ee/Elminshwey.jpg",
              name: "المنشاوي",
            )),
      ),
    );
  }
}

