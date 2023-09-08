import 'package:audio_app/providers/audio_provider.dart';
import 'package:audio_app/providers/player_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioPlayerUI extends ConsumerWidget {
  const AudioPlayerUI({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final apRead = ref.read(audioProvider);
    final apWatch = ref.read(audioProvider);
    final pspRead = ref.read(playerStateProvider);
    final pspWatch = ref.watch(playerStateProvider);

    final song = apWatch.getAudio();
    pspRead.onload(song);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Row(children: [
            IconButton(
              onPressed: pspRead.onPlay,
              icon: Icon(
                pspWatch.isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                size: 50,
              ),
            ),
            IconButton(
              onPressed: pspRead.onStop,
              icon: const Icon(
                Icons.stop,
                size: 50,
              ),
            ),
            Expanded(
              child: Slider(
                min: 0,
                max: 1,
                value: pspWatch.seekbarValue,
                onChanged: pspRead.changeSeekbar,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: pspRead.onMute,
                  icon: Icon(
                    pspWatch.isMuted ? Icons.volume_off : Icons.volume_up,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: Slider(
                    min: 0,
                    max: 1,
                    value: pspWatch.volumeValue,
                    onChanged: pspRead.onVolumeChange,
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
