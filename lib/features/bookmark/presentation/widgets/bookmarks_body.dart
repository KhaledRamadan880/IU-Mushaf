import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_toast.dart';
import 'package:iu_mushaf/features/mushaf/presentation/views/mushaf_reading_view.dart';

import 'bookmark_card.dart';

class BookmarksBody extends StatelessWidget {
  const BookmarksBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is DeleteAyahSuccessState) {
          showToast(context, AppStrings.deleted.tr(context));
        }
      },
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return cubit.bookmarksModel!.bookmarks.isNotEmpty
            ? SizedBox(
                height: 645.responsiveHeight(context),
                child: ListView.builder(
                  itemCount: cubit.bookmarksModel!.bookmarks.length,
                  padding: EdgeInsets.only(
                    top: 40.responsiveHeight(context),
                  ),
                  itemBuilder: (context, index) {
                    return BookmarkCard(
                      //! Info
                      ayahText: cubit.bookmarksModel!.bookmarks[index].ayahText,
                      mushafType: cubit.language == "en"
                          ? cubit.bookmarksModel!.bookmarks[index].mushafTypeEn
                          : cubit.bookmarksModel!.bookmarks[index].mushafTypeAr,
                      pageNumber:
                          cubit.bookmarksModel!.bookmarks[index].pageNumber,
                      surahName: cubit.language == "en"
                          ? cubit.bookmarksModel!.bookmarks[index].surahNameEn
                          : cubit.bookmarksModel!.bookmarks[index].surahNameAr,
                      surahNumber:
                          cubit.bookmarksModel!.bookmarks[index].surahNumber,
                      //! Go To Ayah
                      goToAyahOnTap: () {
                        Navigator.pop(context);
                        cubit.navBarController.jumpToTab(0);
                        Future.delayed(
                            const Duration(milliseconds: 500),
                            () => PersistentNavBarNavigator.pushDynamicScreen(
                                  context,
                                  screen: MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) => MushafCubit()
                                        ..surModel = cubit.surModel!
                                        ..hideLayoutAfterNavigate()
                                        ..addAyahsToList()
                                        ..init(
                                            ayahsAudiosModel:
                                                cubit.ayahsRecitersAudiosModel!,
                                            globalBookmarksModel:
                                                cubit.bookmarksModel!,
                                            mushafEn: cubit.bookmarksModel!
                                                .bookmarks[index].mushafTypeEn,
                                            mushafAr: cubit.bookmarksModel!
                                                .bookmarks[index].mushafTypeAr,
                                            initPageNumber: cubit
                                                .bookmarksModel!
                                                .bookmarks[index]
                                                .pageNumber),
                                      child: const MushafReadingView(),
                                    ),
                                  ),
                                  withNavBar: false,
                                ));
                      },
                      //! Delete Ayah
                      deleteAyahOnTap: () {
                        Navigator.pop(context);
                        cubit.deleteAyah(index);
                      },
                    );
                  },
                ),
              )
              //! If No Bookmarks
            : Center(
                child: CustomText(
                AppStrings.noBookmarks.tr(context),
                style: Styles.style28Bold(context),
              ));
      },
    );
  }
}
