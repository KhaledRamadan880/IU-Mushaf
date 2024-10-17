import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/views/surahs_view.dart';
import 'package:iu_mushaf/features/mushaf/presentation/widgets/mushaf_card.dart';

class MushafCardsListView extends StatelessWidget {
  const MushafCardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final globalCubit = context.read<GlobalCubit>();
    String lang = globalCubit.language;
    return Expanded(
      child: SizedBox(
        width: 326.responsiveWidth(context),
        child: ListView.builder(
          itemCount: globalCubit.mushafsModel!.mushafs.length,
          itemBuilder: (context, index) {
            return MushafCard(
              mushafType: lang == "en"
                  ? globalCubit.mushafsModel!.mushafs[index].mushafTypeEn
                  : globalCubit.mushafsModel!.mushafs[index].mushafTypeAr,
              accent: lang == "en"
                  ? globalCubit.mushafsModel!.mushafs[index].narratedEn
                  : globalCubit.mushafsModel!.mushafs[index].narratedAr,
              by: lang == "en"
                  ? globalCubit.mushafsModel!.mushafs[index].byEn
                  : globalCubit.mushafsModel!.mushafs[index].byAr,
              onTap: () {
                PersistentNavBarNavigator.pushDynamicScreen(
                  context,
                  screen: MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => MushafCubit()
                        ..surahsModel = globalCubit.surahsModel!
                        ..hideLayoutAfterNavigate()
                        ..init(
                            ayahsAudiosModel:
                                globalCubit.ayahsRecitersAudiosModel!,
                            globalBookmarksModel: globalCubit.bookmarksModel!,
                            mushafEn: globalCubit
                                .mushafsModel!.mushafs[index].mushafTypeEn,
                            mushafAr: globalCubit
                                .mushafsModel!.mushafs[index].mushafTypeAr,
                            narraterId: globalCubit
                                .mushafsModel!.mushafs[index].narratedId),
                      child: const SurahsView(),
                    ),
                  ),
                  withNavBar: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
