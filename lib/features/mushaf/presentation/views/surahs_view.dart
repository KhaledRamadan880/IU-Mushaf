import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/surah_number_container.dart';

import '../widgets/components/surahs_list_search_button.dart';
import '../widgets/surahs_list_search_text_field.dart';
import 'mushaf_reading_view.dart';

class SurahsView extends StatelessWidget {
  const SurahsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GlobalCubit>();
    return Scaffold(
      appBar: customAppBar(
        context,
        title: AppStrings.index,
        icon: const SurahsListSearchButton(),
        showPop: true,
      ),
      body: BlocBuilder<MushafCubit, MushafState>(
        builder: (context, state) {
          final mushafCubit = context.read<MushafCubit>();
          return Column(
            children: [
              const SurahsListSearchTextField(),
              mushafCubit.searchedSur.isEmpty &&
                      mushafCubit.surahsSearchController.text.isNotEmpty
                  ? Expanded(
                      child: Center(
                          child: CustomText(
                      AppStrings.thereIsNoResults.tr(context),
                      style: Styles.style28Bold(context),
                    )))
                  : Expanded(
                      child: ListView.separated(
                        itemCount: mushafCubit.searchedSur.isNotEmpty
                            ? mushafCubit.searchedSur.length
                            : cubit.surahsModel!.surahs.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: cubit.isDark
                                ? AppColors.white.withOpacity(.5)
                                : AppColors.black.withOpacity(.5),
                          );
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.responsiveWidth(context),
                          vertical: 24.responsiveHeight(context),
                        ),
                        itemBuilder: (context, index) {
                          return SurahCard(
                            cubit: cubit,
                            mushafCubit: mushafCubit,
                            index: index,
                            pageNumber: mushafCubit
                                .getPageNumberFromSurahSearch(index, cubit),
                          );
                        },
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class SurahCard extends StatelessWidget {
  const SurahCard({
    super.key,
    required this.cubit,
    required this.mushafCubit,
    required this.index,
    required this.pageNumber,
  });

  final GlobalCubit cubit;
  final MushafCubit mushafCubit;
  final int index;
  final int pageNumber;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MushafCubit, MushafState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            //! Navigat Method
            mushafCubit.focusedAyahNumber = null;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => MushafCubit()
                    ..surahsModel = cubit.surahsModel!
                    ..init(
                      initPageNumber: pageNumber,
                      ayahsAudiosModel: cubit.ayahsRecitersAudiosModel!,
                      globalBookmarksModel: cubit.bookmarksModel!,
                      mushafEn: cubit.mushafsModel!.mushafs[0].mushafTypeEn,
                      mushafAr: cubit.mushafsModel!.mushafs[0].mushafTypeAr,
                      narraterId: mushafCubit.reciterId,
                    )
                    ..pageNumber = pageNumber + 1
                    ..surahNumber = cubit.surahsModel!.surahs[index].number,
                  child: const MushafReadingView(),
                ),
              ),
            );
          },
          child: Container(
            height: 62.responsiveHeight(context),
            width: 343.responsiveWidth(context),
            color: AppColors.transparent,
            padding:
                EdgeInsets.symmetric(horizontal: 8.responsiveWidth(context)),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                //! Surah Number
                SurahNumberContainer(
                  mushafCubit.searchedSur.isNotEmpty
                      ? mushafCubit.searchedSur[index].number - 1
                      : cubit.surahsModel!.surahs[index].number - 1,
                ),
                SizedBox(width: 23.responsiveWidth(context)),
                //! Surah Name
                CustomText(
                  "${AppStrings.surah.tr(context)} ${cubit.language == "en"
                      ? mushafCubit.searchedSur.isNotEmpty
                          ? mushafCubit.searchedSur[index].englishName
                          : cubit.surahsModel!.surahs[index].englishName
                      : mushafCubit.searchedSur.isNotEmpty
                          ? mushafCubit.searchedSur[index].name
                          : cubit.surahsModel!.surahs[index].name}",
                  style: Styles.style16(context),
                ),
                const Spacer(),
                //! Page Number
                CustomText(
                  "${AppStrings.page.tr(context)} ${pageNumber + 1}",
                  style: Styles.style12(context),
                ),
                SizedBox(width: 4.responsiveWidth(context)),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.responsiveHeight(context),
                  color: cubit.isDark
                      ? AppColors.white.withOpacity(.6)
                      : AppColors.black.withOpacity(.6),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
