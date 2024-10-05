import 'package:iu_mushaf/core/imports/imports.dart';

class AudioSkipForwardButton extends StatelessWidget {
  const AudioSkipForwardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return StreamBuilder(
            stream: cubit.audioPlayer.sequenceStateStream,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  snapshot.data?.currentSource != null
                      ? cubit.audioPlayer.seekToNext().whenComplete(() {
                          if (!cubit.audioPlayer.playing) {
                            cubit.audioPlayer.play();
                          }
                        })
                      : null;
                },
                child: BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    final isDark = context.read<GlobalCubit>().isDark;
                    return Icon(
                      Icons.skip_next_rounded,
                      size: 48.responsiveHeight(context),
                      color: snapshot.data?.currentSource != null
                          ? isDark
                              ? AppColors.white
                              : AppColors.black
                          : isDark
                              ? AppColors.white.withOpacity(.4)
                              : AppColors.black.withOpacity(.4),
                    );
                  },
                ),
              );
            });
      },
    );
  }
}
