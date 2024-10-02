import 'package:iu_mushaf/core/imports/imports.dart';

class AudioStrartAndEndTime extends StatelessWidget {
  const AudioStrartAndEndTime({super.key});

  String formatDuration(int seconds) {
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$secs';
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return StreamBuilder<Duration>(
          stream: cubit.audioPlayer.positionStream,
          builder: (context, snapshot) {
            final position = formatDuration(snapshot.data?.inSeconds ?? 0);
            final duration = cubit.audioPlayer.duration ?? Duration.zero;
            final remainigDuration = formatDuration(
                duration.inSeconds - (snapshot.data?.inSeconds ?? 0));
            return Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 16.responsiveWidth(context)),
              child: Row(
                textDirection: TextDirection.ltr,                
                children: [
                  //! Current Time
                  CustomText(
                    position,
                    style: Styles.style12(context),
                  ),
                  const Spacer(),
                  //! Total Time
                  CustomText(
                    remainigDuration,
                    style: Styles.style12(context),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
