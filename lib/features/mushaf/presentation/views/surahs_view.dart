import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_app_bar.dart';
import 'package:iu_mushaf/features/mushaf/data/page_data.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/surah_number_container.dart';

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
        showPop: true,
      ),
      body: BlocBuilder<MushafCubit, MushafState>(
        builder: (context, state) {
          final mushafCubit = context.read<MushafCubit>();

          return ListView.separated(
            itemCount: cubit.surahsModel!.surahs.length,
            separatorBuilder: (context, index) {
              return const Divider();
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
              );
            },
          );
        },
      ),
    );
  }
}

class SurahCard extends StatefulWidget {
  const SurahCard({
    super.key,
    required this.cubit,
    required this.mushafCubit,
    required this.index,
  });

  final GlobalCubit cubit;
  final MushafCubit mushafCubit;
  final int index;

  @override
  State<SurahCard> createState() => _SurahCardState();
}

class _SurahCardState extends State<SurahCard> {
  dynamic pageNumber;
  @override
  void initState() {
    super.initState();
    getPageNumber();
    setState(() {});
  }

  getPageNumber() {
    for (var i = 0; i < pageData.length; i++) {
      for (var ii = 0; ii < pageData[i].length; ii++) {
        if (pageData[i][ii]["surah"] ==
                widget.cubit.surahsModel!.surahs[widget.index].number &&
            pageData[i][ii]["start"] == 1) {
          pageNumber = i;
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //! Navigat Method
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider.value(
              value: widget.mushafCubit
                ..surahsModel = widget.cubit.surahsModel!
                ..init(
                  initPageNumber: pageNumber,
                  ayahsAudiosModel: widget.cubit.ayahsRecitersAudiosModel!,
                  globalBookmarksModel: widget.cubit.bookmarksModel!,
                  mushafEn: widget.cubit.mushafsModel!.mushafs[0].mushafTypeEn,
                  mushafAr: widget.cubit.mushafsModel!.mushafs[0].mushafTypeAr,
                )
                ..pageNumber = pageNumber + 1
                ..surahNumber =
                    widget.cubit.surahsModel!.surahs[widget.index].number,
              child: const MushafReadingView(),
            ),
          ),
        );
      },
      child: Container(
        height: 62.responsiveHeight(context),
        width: 343.responsiveWidth(context),
        color: AppColors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 8.responsiveWidth(context)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            //! Surah Number
            SurahNumberContainer(widget.index),
            SizedBox(width: 23.responsiveWidth(context)),
            //! Surah Name
            CustomText(
              widget.cubit.language == "en"
                  ? widget.cubit.surahsModel!.surahs[widget.index].englishName
                  : "سورة ${widget.cubit.surahsModel!.surahs[widget.index].name}",
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
              color: widget.cubit.isDark
                  ? AppColors.white.withOpacity(.6)
                  : AppColors.black.withOpacity(.6),
            ),
          ],
        ),
      ),
    );
  }
}
