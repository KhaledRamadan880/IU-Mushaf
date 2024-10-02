import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_loading_indicator.dart';

import 'quran_audio_surah_card.dart';

class QuranAudioSurahListView extends StatelessWidget {
  const QuranAudioSurahListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return state is LoadSurReaderLoadingState
            ? SizedBox(
                height: 400.responsiveHeight(context),
                child: const Center(child: CustomLoadingIndicator()))
            : SizedBox(
                height: 400.responsiveHeight(context),
                child: ListView.separated(
                  itemCount: cubit.surModel!.sur.length,
                  padding: EdgeInsets.symmetric(
                      vertical: 12.responsiveHeight(context)),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
                      builder: (context, state) {
                        return QuranAudioSurahCard(
                          index,
                          title: cubit.surModel!.sur[index].name,
                          onTap: () {
                            if (index + 1 !=
                                context
                                    .read<QuranAudioCubit>()
                                    .selectedSurahNumber) {
                              context.read<QuranAudioCubit>().selectSurah(
                                    context,
                                    surahNumber: index + 1,
                                    modelList: context
                                        .read<GlobalCubit>()
                                        .surReadersAudiosModel!,
                                  );
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              );
      },
    );
  }
}
