
import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/widgets/components/listen_to_ayah_button.dart';

import 'components/add_to_bookmark_button.dart';

class AyahFocusButtons extends StatelessWidget {
  const AyahFocusButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        return cubit.focusedAyahNumber == null
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
                        const ListenToAyahButton(),
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
                    const AddToBookmarkButton(),
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
    this.title,
    this.icon,
  });

  final Function() onTap;
  final String? title;
  final Widget? icon;

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
              child: icon ??
                  Text(
                    title!.tr(context),
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
