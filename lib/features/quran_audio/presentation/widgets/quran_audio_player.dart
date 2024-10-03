import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_toast.dart';

import 'components/audio_setting_button.dart';
import 'components/audio_skip_backward_button.dart';
import 'components/audio_skip_forward_button.dart';
import 'components/audio_start_and_end_time.dart';
import 'components/custom_slider.dart';
import 'components/play_and_pause_button.dart';
import 'components/surah_and_qari_name.dart';

class QuranAudioPlayer extends StatelessWidget {
  const QuranAudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.responsiveHeight(context)),
        //! Sourah Name And Qari
        const SurahAndQariName(),
        SizedBox(height: 24.responsiveHeight(context)),
        //! Slider
        const CustomSlider(),
        SizedBox(height: 12.responsiveHeight(context)),
        //! Start & End Time
        const AudioStrartAndEndTime(),
        //! Audio Controllers
        SizedBox(
          height: 64.responsiveHeight(context),
          child: const Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textDirection: TextDirection.ltr,
                children: [
                  //! Skip Previous Button
                  AudioSkipBackwardButton(),
                  //! Play & Pause Button
                  PlayAndPauseButton(),
                  //! Skip Next Button
                  AudioSkipForwardButton(),
                ],
              ),
              //! Setting Button
              AudioSettingButton(),
            ],
          ),
        ),
      ],
    );
  }
}
