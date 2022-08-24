import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/services/get_readers_service.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';
import 'package:hesat_quran/ui/screens/all_soras/all_soras_screen.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';

import '../../../models/readers_model.dart';
import '../../custom_widgets/audio_quran_item.dart';

class AudioQuranReaders extends StatefulWidget {
  const AudioQuranReaders({Key? key}) : super(key: key);

  @override
  State<AudioQuranReaders> createState() => _AudioQuranReadersState();
}

class _AudioQuranReadersState extends State<AudioQuranReaders> {
  bool loader = true;
  List<ReadersModel> readers = [];
  Future<void> fetchData(BuildContext context) async {
    loader = true;
    try {
      readers = await getReadersService();
      print(readers.length);
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
      appBar: commonAppBar(context, Constants.voiceQuran),
      body: loader
          ? const Center(child: CupertinoActivityIndicator())
          : Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: GridView.builder(
                          itemCount: readers.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.22,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                                onTap: () => Get.to(
                                    AllSorasScreen(
                                        redaderName: readers[index].name,
                                        readerFolder: readers[index].folder,
                                        ),
                                    transition: Transition.downToUp),
                                child: Column(
                                  children: [
                                    AudioQuranItem(
                                      image: Constants.imagesUrl +
                                          readers[index].image,
                                      name: readers[index].name,
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  const MediumPadding(),
                ],
              ),
          ),
    );
  }
}
