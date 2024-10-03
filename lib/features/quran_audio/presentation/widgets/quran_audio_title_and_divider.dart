import 'package:iu_mushaf/core/imports/imports.dart';

class QuranAudioTitleAndDivider extends StatelessWidget {
  const QuranAudioTitleAndDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.responsiveWidth(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.responsiveHeight(context)),
          //! Title
          SizedBox(
            width: 81.5.responsiveWidth(context),
            child: Center(
              child: CustomText(
                AppStrings.surah.tr(context),
                style: Styles.style16SemiBold(context),
              ),
            ),
          ),
          Stack(
            children: [
              const Divider(),
              SizedBox(
                width: 81.5.responsiveWidth(context),
                child: BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return Divider(
                      thickness: 3.responsiveHeight(context),
                      color: context.read<GlobalCubit>().isDark
                          ? AppColors.white
                          : AppColors.black,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
