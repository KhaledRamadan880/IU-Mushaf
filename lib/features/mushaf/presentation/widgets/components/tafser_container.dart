import 'package:iu_mushaf/core/imports/imports.dart';

class TafserContainer extends StatelessWidget {
  const TafserContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 8.responsiveWidth(context),
            vertical: 16.responsiveHeight(context),
          ),
          margin: EdgeInsets.only(
              top: 16.responsiveHeight(context),
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              //! Header
              CustomText(
                "${AppStrings.tafser.tr(context)} "
                "${context.read<GlobalCubit>().language == "en" ? cubit.tafserModel!.nameEnglish : cubit.tafserModel!.nameArabic}",
                style: Styles.style18SemiBold(context),
              ),
              SizedBox(height: 16.responsiveHeight(context)),
              //! Tafser
              CustomText(
                cubit.tafserModel!.ayahsTafserList[cubit.focusedAyahNumberInSurah - 1]
                    .text,
                style: Styles.style18(context).copyWith(
                  overflow: TextOverflow.clip,
                ),
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        );
      },
    );
  }
}
