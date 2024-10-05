import 'package:iu_mushaf/core/imports/imports.dart';

import '../mushaf_reading_ayah_focus_overlay.dart';

class ListenToAyahButton extends StatelessWidget {
  const ListenToAyahButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        return StreamBuilder(
            stream: cubit.audioPlayer!.playerStateStream,
            builder: (context, snapshot) {
              return CustomButton(
                onTap: () async {
                  if ((snapshot.data?.playing ?? false) &&
                      cubit.focusedAyahNumber == cubit.nowPlayingAyah) {
                    await cubit.audioPlayer!.stop();
                  } else {
                    await cubit.playAyah();
                  }
                },
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        AppStrings.listenToAyah.tr(context),
                        style: Styles.style14Medium(context).copyWith(
                          color: (snapshot.data?.playing ?? false) &&
                                  cubit.focusedAyahNumber ==
                                      cubit.nowPlayingAyah
                              ? AppColors.transparent
                              : context.read<GlobalCubit>().isDark
                                  ? AppColors.black
                                  : AppColors.white,
                        ),
                      ),
                    ),
                    (snapshot.data?.playing ?? false) &&
                            cubit.focusedAyahNumber == cubit.nowPlayingAyah
                        ? Icon(
                            Icons.pause,
                            color: context.read<GlobalCubit>().isDark
                                ? AppColors.black
                                : AppColors.white,
                          )
                        : Container(),
                  ],
                ),
              );
            });
      },
    );
  }
}