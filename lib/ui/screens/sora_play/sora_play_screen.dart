import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesat_quran/helpers/constants.dart';
import 'package:hesat_quran/ui/custom_widgets/common_appbar.dart';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:hesat_quran/ui/custom_widgets/custom_images.dart';
import 'package:hesat_quran/ui/theme/sizes/sizes.dart';
import 'package:hesat_quran/ui/theme/style/colors.dart';
import 'package:hesat_quran/ui/theme/style/font_style.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_view_model.dart';
import '../../../view_model/page_manager.dart';
import '../../../view_model/sora_details_view_model.dart';

class SoraPlayScreen extends StatefulWidget {
  final String soraName;
  final String readerName;
  final String readerFolder;
  final String soraId;
  const SoraPlayScreen(
      {Key? key,
      required this.soraName,
      required this.readerName,
      required this.readerFolder,
      required this.soraId})
      : super(key: key);

  @override
  State<SoraPlayScreen> createState() => _SoraPlayScreenState();
}

class _SoraPlayScreenState extends State<SoraPlayScreen> {
  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  late AudioPlayer _audioPlayer;

  int initialPageNumber = 0;

  void nextPage() {
    _audioPlayer.pause();
    initialPageNumber = initialPageNumber + 1;
            Provider.of<HomeViewModel>(context, listen: false).getSora(context, "0" , initialPageNumber.toString());

    _init(
      widget.readerFolder,
      initialPageNumber.toString(),
    );
  }

  void previousPage() {
    if (initialPageNumber > 1) {
      _audioPlayer.pause();
      initialPageNumber = initialPageNumber - 1;
                  Provider.of<HomeViewModel>(context, listen: false).getSora(context, "0" , initialPageNumber.toString());

      _init(
        widget.readerFolder,
        initialPageNumber.toString(),
      );
    }
  }

  Future<void> _init(String readerForder, String soraId) async {
    _audioPlayer = AudioPlayer();
    Future.delayed(Duration.zero).then((value) async {
      print(
          "${Constants.soundsUrl + readerForder + soraId + ".mp3"}============================>url");
      await _audioPlayer
          .setUrl(Constants.soundsUrl + readerForder + soraId + ".mp3");

      _audioPlayer.playerStateStream.listen((playerState) {
        final isPlaying = playerState.playing;
        final processingState = playerState.processingState;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          buttonNotifier.value = ButtonState.loading;
        } else if (!isPlaying) {
          buttonNotifier.value = ButtonState.paused;
        } else if (processingState != ProcessingState.completed) {
          buttonNotifier.value = ButtonState.playing;
        } else {
          _audioPlayer.seek(Duration.zero);
          _audioPlayer.pause();
        }
      });
    });

    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  String? soraName;
  @override
  void initState() {
    super.initState();
    soraName = widget.soraName;
    _init(widget.readerFolder, widget.soraId);
    initialPageNumber = int.parse(widget.soraId);
    Provider.of<SoraDetialsViewModel>(context, listen: false)
        .updateSoraRead(widget.soraId);
        Provider.of<HomeViewModel>(context, listen: false).getSora(context, "0" , widget.soraId);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     final provider =       Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: commonAppBar(context, "الإستماع"),
      body: Center(
        child: Padding(
          padding:
              commonPaddingHorizental(context, virtical: height(context, 0.02)),
          child: Column(
            children: [
              const MediumPadding(),
              SizedBox(
                  height: height(context, 0.4),
                  child: const CustomAssetImage(
                      imagePath: Constants.redQuranIcon)),
              const MediumPadding(),
              const MediumPadding(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                    provider.Loader? const CupertinoActivityIndicator(): Text(
                        provider.soraInfo[0].name,
                        style: bigBlackFont()
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const MediumPadding(),
                      const MediumPadding(),
                      Text(
                        widget.readerName,
                        style: mediumBlackFont().copyWith(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const BigPadding(),
              const BigPadding(),
              const BigPadding(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width(context, 0.09)),
                child: ValueListenableBuilder<ProgressBarState>(
                  valueListenable: progressNotifier,
                  builder: (_, value, __) {
                    return ProgressBar(
                      progress: value.current,
                      buffered: value.buffered,
                      total: value.total,
                      timeLabelLocation: TimeLabelLocation.sides,
                      timeLabelTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                      onSeek: seek,
                      thumbColor: AppColors.brownDarkColor,
                      progressBarColor: AppColors.brownAccentColor,
                      baseBarColor: Colors.grey,
                      bufferedBarColor: AppColors.brownLightColor,
                    );
                  },
                ),
              ),
              const BigPadding(),
              const BigPadding(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => previousPage(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.orange[400]!, width: 2),
                      ),
                      child: const SizedBox(
                        width: 40,
                        child: CustomAssetImage(
                            imagePath: Constants.forwardPlayIcon),
                      ),
                    ),
                  ),
                  const BigPadding(
                    horizental: true,
                  ),
                  ValueListenableBuilder<ButtonState>(
                    valueListenable: buttonNotifier,
                    builder: (_, value, __) {
                      switch (value) {
                        case ButtonState.loading:
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            width: 32.0,
                            height: 32.0,
                            child: const CircularProgressIndicator(),
                          );
                        case ButtonState.paused:
                          return InkWell(
                            onTap: play,
                            child: const SizedBox(
                              width: 55,
                              child: CustomAssetImage(
                                  imagePath: Constants.playIcon),
                            ),
                          );

                        case ButtonState.playing:
                          return InkWell(
                            onTap: pause,
                            child: const SizedBox(
                              width: 55,
                              child: CustomAssetImage(
                                  imagePath: Constants.puseIcon),
                            ),
                          );
                      }
                    },
                  ),
                  const BigPadding(
                    horizental: true,
                  ),
                  InkWell(
                    onTap: () => nextPage(),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: Colors.orange[400]!, width: 2),
                      ),
                      child: const SizedBox(
                        width: 40,
                        child:
                            CustomAssetImage(imagePath: Constants.backPlayIcon),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
