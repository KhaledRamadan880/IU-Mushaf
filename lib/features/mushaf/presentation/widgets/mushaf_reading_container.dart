import 'package:iu_mushaf/core/imports/imports.dart';

class MushafReadingContainer extends StatelessWidget {
  const MushafReadingContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 357.responsiveWidth(context),
      height: 647.responsiveHeight(context),
      padding: EdgeInsets.only(
        left: 8.responsiveWidth(context),
        right: 8.responsiveWidth(context),
        top: 20.responsiveHeight(context),
      ),
      margin: EdgeInsets.only(
        top: 22.responsiveHeight(context),
        left: 18.responsiveWidth(context),
        right: 18.responsiveWidth(context),
        bottom: 25.responsiveHeight(context),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.only(bottom: 14.responsiveHeight(context)),
                child: Image.asset(
                  Assets.imagesBesmAllah,
                  height: 40.responsiveHeight(context),
                  width: 270.responsiveWidth(context),
                  color: context.read<GlobalCubit>().isDark
                      ? AppColors.white
                      : AppColors.black,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          CustomText(
            "طه (1) مَآ أَنزَلۡنَا عَلَيۡكَ ٱلۡقُرۡءَانَ لِتَشۡقَىٰٓ (2) إِلَّا تَذۡكِرَةٗ لِّمَن يَخۡشَىٰ (3) تَنزِيلٗا مِّمَّنۡ خَلَقَ ٱلۡأَرۡضَ وَٱلسَّمَٰوَٰتِ ٱلۡعُلَى (4) ٱلرَّحۡمَٰنُ عَلَى ٱلۡعَرۡشِ ٱسۡتَوَىٰ (5) لَهُۥ مَا فِي ٱلسَّمَٰوَٰتِ وَمَا فِي ٱلۡأَرۡضِ وَمَا بَيۡنَهُمَا وَمَا تَحۡتَ ٱلثَّرَىٰ (6) وَإِن تَجۡهَرۡ بِٱلۡقَوۡلِ فَإِنَّهُۥ يَعۡلَمُ ٱلسِّرَّ وَأَخۡفَى (7) ٱللَّهُ لَآ إِلَٰهَ إِلَّا هُوَۖ لَهُ ٱلۡأَسۡمَآءُ ٱلۡحُسۡنَىٰ (8) وَهَلۡ أَتَىٰكَ حَدِيثُ مُوسَىٰٓ (9) إِذۡ رَءَا نَارٗا فَقَالَ لِأَهۡلِهِ ٱمۡكُثُوٓاْ إِنِّيٓ ءَانَسۡتُ نَارٗا لَّعَلِّيٓ ءَاتِيكُم مِّنۡهَا بِقَبَسٍ أَوۡ أَجِدُ عَلَى ٱلنَّارِ هُدٗى (10) فَلَمَّآ أَتَىٰهَا نُودِيَ يَٰمُوسَىٰٓ (11) إِنِّيٓ أَنَا۠ رَبُّكَ فَٱخۡلَعۡ نَعۡلَيۡكَ إِنَّكَ بِٱلۡوَادِ ٱلۡمُقَدَّسِ طُوٗى (12) وَأَنَا ٱخۡتَرۡتُكَ فَٱسۡتَمِعۡ لِمَا يُوحَىٰٓ (13) إِنَّنِيٓ أَنَا ٱللَّهُ لَآ إِلَٰهَ إِلَّآ أَنَا۠ فَٱعۡبُدۡنِي وَأَقِمِ ٱلصَّلَوٰةَ لِذِكۡرِيٓ (14) إِنَّ ٱلسَّاعَةَ ءَاتِيَةٌ أَكَادُ أُخۡفِيهَا لِتُجۡزَىٰ كُلُّ نَفۡسِۭ بِمَا تَسۡعَىٰ (15) فَلَا يَصُدَّنَّكَ عَنۡهَا مَن لَّا يُؤۡمِنُ بِهَا وَٱتَّبَعَ هَوَىٰهُ فَتَرۡدَىٰ (16) وَمَا تِلۡكَ بِيَمِينِكَ يَٰمُوسَىٰ (17) قَالَ هِيَ عَصَايَ أَتَوَكَّؤُاْ عَلَيۡهَا وَأَهُشُّ بِهَا عَلَىٰ غَنَمِي وَلِيَ فِيهَا مَـَٔارِبُ أُخۡرَىٰ (18) قَالَ أَلۡقِهَا يَٰمُوسَىٰ (19) فَأَلۡقَىٰهَا فَإِذَا هِيَ حَيَّةٞ",
            style: Styles.style18SemiBold(context).copyWith(
              overflow: TextOverflow.clip,
            ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
