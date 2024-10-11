import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/surah_number_container.dart';

import 'bookmark_dots_button.dart';

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({
    super.key,
    required this.surahNumber,
    required this.pageNumber,
    required this.surahName,
    required this.ayahText,
    required this.mushafType,
    required this.goToAyahOnTap,
    required this.deleteAyahOnTap,
  });

  final int surahNumber, pageNumber;
  final String surahName, ayahText, mushafType;
  final Function() goToAyahOnTap, deleteAyahOnTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.responsiveWidth(context),
        vertical: 12.responsiveHeight(context),
      ),
      margin: EdgeInsets.only(
        bottom: 30.responsiveHeight(context),
        left: 16.responsiveWidth(context),
        right: 16.responsiveWidth(context),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //! Surah Name Row
          Row(
            children: [
              //! Surah Number
              SurahNumberContainer(surahNumber),
              SizedBox(width: 14.responsiveWidth(context)),
              //! Surah Name
              CustomText(
                surahName,
                style: Styles.style15SemiBold(context),
              ),
              const Spacer(),
              //! Dots Button
              BookmarkDotsButton(
                goToAyahOnTap: goToAyahOnTap,
                deleteAyahOnTap: deleteAyahOnTap,
              ),
            ],
          ),
          //! Ayah
          Align(
            alignment: Alignment.centerRight,
            child: CustomText(
              ayahText,
              style: Styles.style13Light(context)
                  .copyWith(
                overflow: TextOverflow.clip,
                fontFamily: "page$pageNumber",
              ),
              textDirection: TextDirection.rtl,
              lightColor: AppColors.green,
            ),
          ),
          SizedBox(height: 7.responsiveHeight(context)),
          //! Mushaf Type
          CustomText(
            "${AppStrings.mushaf.tr(context)} $mushafType",
            style: Styles.style13(context),
            showShadow: true,
          ),
        ],
      ),
    );
  }
}
