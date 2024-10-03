import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_loading_indicator.dart';
import 'package:just_audio/just_audio.dart';

class PlayAndPauseButton extends StatelessWidget {
  const PlayAndPauseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranAudioCubit, QuranAudioState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return state is LoadingAudioState
            ? const CustomLoadingIndicator()
            : StreamBuilder(
                stream: cubit.audioPlayer.playerStateStream,
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: () {
                      snapshot.data?.processingState != ProcessingState.idle
                          ? snapshot.data!.playing
                              ? cubit.audioPlayer.pause()
                              : cubit.audioPlayer.play()
                          : cubit.playSurah();
                    },
                    child: Container(
                      width: 64.responsiveWidth(context),
                      margin: EdgeInsets.symmetric(
                          horizontal: 24.responsiveWidth(context)),
                      child: BlocBuilder<GlobalCubit, GlobalState>(
                        builder: (context, state) {
                          final isDark = context.read<GlobalCubit>().isDark;
                          return CircleAvatar(
                            radius: 32.responsiveHeight(context),
                            backgroundColor:
                                isDark ? AppColors.white : AppColors.black,
                            child: Icon(
                              snapshot.data?.playing == true &&
                                      snapshot.data != null
                                  ? Icons.pause
                                  : Icons.play_arrow_rounded,
                              color:
                                  !isDark ? AppColors.white : AppColors.black,
                              size: 38.responsiveHeight(context),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                });
      },
    );
  }
}
