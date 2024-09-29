import 'package:iu_mushaf/core/imports/imports.dart';

class AyahFocusButtons extends StatelessWidget {
  const AyahFocusButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        return context.read<MushafCubit>().focusedAyahNumber == null
            ? Container()
            : Positioned(
                bottom: 83.responsiveHeight(context),
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //! Listen to ayah button
                        CustomButton(
                          onTap: () {},
                          title: AppStrings.listenToAyah,
                        ),
                        //! Mean of ayah button
                        CustomButton(
                          onTap: () {},
                          title: AppStrings.meanOfAyah,
                        ),
                        //! about ayah button
                        CustomButton(
                          onTap: () {},
                          title: AppStrings.aboutayah,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.responsiveHeight(context)),
                    //! Add to bookmark button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160.responsiveWidth(context),
                          child: CustomButton(
                            onTap: () {},
                            title: AppStrings.addToBookmark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 32.responsiveHeight(context),
            padding: EdgeInsets.symmetric(
              horizontal: 8.responsiveWidth(context),
              vertical: 6.responsiveHeight(context),
            ),
            margin:
                EdgeInsets.symmetric(horizontal: 4.responsiveWidth(context)),
            decoration: BoxDecoration(
              color: context.read<GlobalCubit>().isDark
                  ? AppColors.white
                  : AppColors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                title.tr(context),
                style: Styles.style14Medium(context).copyWith(
                  color: context.read<GlobalCubit>().isDark
                      ? AppColors.black
                      : AppColors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
