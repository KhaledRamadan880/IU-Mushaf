import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/quran_audio/presentation/widgets/surah_number_container.dart';

import 'bookmark_dots_button.dart';

class BookmarkCard extends StatelessWidget {
  const BookmarkCard({
    super.key,
  });

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
              const SurahNumberContainer(2),
              SizedBox(width: 14.responsiveWidth(context)),
              //! Surah Name
              CustomText(
                "Surah Al-Baqarah",
                style: Styles.style15SemiBold(context),
              ),
              const Spacer(),
              //! Dots Button
              const BookmarkDotsButton(),
            ],
          ),
          //! Ayah
          CustomText(
            "ٱللَّهُ لَآ إِلَٰهَ إِلَّا هُوَ ٱلۡحَيُّ ٱلۡقَيُّومُۚ لَا تَأۡخُذُهُۥ سِنَةٞ وَلَا نَوۡمٞۚ لَّهُۥ مَا فِي ٱلسَّمَٰوَٰتِ وَمَا فِي ٱلۡأَرۡضِۗ مَن ذَا ٱلَّذِي يَشۡفَعُ عِندَهُۥٓ إِلَّا بِإِذۡنِهِۦۚ يَعۡلَمُ مَا بَيۡنَ أَيۡدِيهِمۡ وَمَا خَلۡفَهُمۡۖ وَلَا يُحِيطُونَ بِشَيۡءٖ مِّنۡ عِلۡمِهِۦٓ ",
            style: Styles.style13Light(context)
                .copyWith(overflow: TextOverflow.clip),
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            lightColor: AppColors.green,
          ),
          SizedBox(height: 7.responsiveHeight(context)),
          //! Mushaf Type
          CustomText(
            "Mushaf Warsh",
            style: Styles.style13(context),
            showShadow: true,
          ),
        ],
      ),
    );
  }
}
