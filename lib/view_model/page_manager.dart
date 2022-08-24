import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../helpers/constants.dart';

class PageManager with ChangeNotifier {
  // int? initialPageNumber;
  // String? soundUrl;

  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(
      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  // static const url =
  //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';

  // void url({required String readerFolder, required String soraId}) {
  //   Future.delayed(Duration.zero).then((value) {
  //     soundUrl = Constants.soundsUrl + readerFolder + soraId + '.mp3';
  //     initialPageNumber = int.parse(soraId);

  //     print(soundUrl);
  //   });
  // }

  // void nextPage(String readerFolder) {
  //   initialPageNumber = initialPageNumber! + 1;
  //   soundUrl = Constants.soundsUrl +
  //       readerFolder +
  //       initialPageNumber.toString() +
  //       '.mp3';
  //   print(soundUrl);
  //   notifyListeners();
  // }

  // void previousPage(String readerFolder) {
  //   if (initialPageNumber! > 1) {
  //     initialPageNumber = initialPageNumber! - 1;
  //     soundUrl = Constants.soundsUrl +
  //         readerFolder +
  //         initialPageNumber.toString() +
  //         '.mp3';
  //     print(soundUrl);
  //     notifyListeners();
  //     print(soundUrl);
  //     notifyListeners();
  //   }
  // }

  late AudioPlayer _audioPlayer;
  PageManager({String? readerFolder, String? soraId}) {
    _init(readerFolder!, soraId!);
  }

  void _init(String readerForder, String soraId) async {
    _audioPlayer = AudioPlayer();
    Future.delayed(Duration.zero).then((value) async {
      print(Constants.soundsUrl + readerForder + soraId + ".mp3");
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

  void dispose() {
    _audioPlayer.dispose();
  }
}

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }
