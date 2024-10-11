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
        return state is LoadSurreciterLoadingState
            ? SizedBox(
                height: 400.responsiveHeight(context),
                child: const Center(child: CustomLoadingIndicator()))
            : BlocBuilder<QuranAudioCubit, QuranAudioState>(
                builder: (context, state) {
                  final quranCubit = context.read<QuranAudioCubit>();
                  return Expanded(                    
                    child: ListView.separated(
                      itemCount:
                          quranCubit.searchController.value.text.isNotEmpty
                              ? quranCubit.searchedSur.length
                              : cubit.surahsModel!.surahs.length,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.responsiveHeight(context),
                        horizontal: 20.responsiveWidth(context),
                      ),
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        return BlocBuilder<QuranAudioCubit, QuranAudioState>(
                          builder: (context, state) {
                            return QuranAudioSurahCard(
                              index,
                              surahNumber: quranCubit
                                      .searchController.value.text.isNotEmpty
                                  ? quranCubit.searchedSur[index].number - 1
                                  : cubit.surahsModel!.surahs[index].number - 1,
                              title: cubit.language == "en"
                                  ? quranCubit.searchController.value.text
                                          .isNotEmpty
                                      ? quranCubit
                                          .searchedSur[index].englishName
                                      : cubit.surahsModel!.surahs[index].englishName
                                  : quranCubit.searchController.value.text
                                          .isNotEmpty
                                      ? quranCubit.searchedSur[index].name
                                      : cubit.surahsModel!.surahs[index].name,
                              onTap: () {
                                if (index + 1 !=
                                    context
                                        .read<QuranAudioCubit>()
                                        .selectedSurahNumber) {
                                  context.read<QuranAudioCubit>().playSurah(
                                        initialIndex: quranCubit
                                                .searchController
                                                .value
                                                .text
                                                .isNotEmpty
                                            ? quranCubit
                                                    .searchedSur[index].number -
                                                1
                                            : cubit.surahsModel!.surahs[index]
                                                    .number -
                                                1,
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
      },
    );
  }
}
