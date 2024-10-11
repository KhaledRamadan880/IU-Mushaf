import 'package:iu_mushaf/core/imports/imports.dart';

class BookmarkDotsButton extends StatelessWidget {
  const BookmarkDotsButton({
    super.key,
    required this.goToAyahOnTap,
    required this.deleteAyahOnTap,
  });

  final Function() goToAyahOnTap;
  final Function() deleteAyahOnTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return IconButton(
          onPressed: () {
            cubit.navBarVisibliltyToggle(false);
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              builder: (context) {
                return Container(
                  height: 170.responsiveHeight(context),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 24.responsiveHeight(context)),
                      //! Go To Ayah Button
                      BottomSheetButton(
                        title: AppStrings.goToAyah,
                        icon: Icons.arrow_forward,
                        onTap: goToAyahOnTap,
                      ),
                      //! Delete Ayah Button
                      BottomSheetButton(
                        title: AppStrings.deleteAyah,
                        icon: Icons.delete,
                        backgroundColor: AppColors.red.withOpacity(.6),
                        onTap: deleteAyahOnTap,
                      ),
                    ],
                  ),
                );
              },
            ).whenComplete(() {
              cubit.navBarVisibliltyToggle(true);
            });
          },
          icon: Icon(
            Icons.more_horiz_outlined,
            color: cubit.isDark
                ? AppColors.white.withOpacity(.4)
                : AppColors.black.withOpacity(.4),
          ),
        );
      },
    );
  }
}

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.backgroundColor,
  });

  final String title;
  final IconData icon;
  final Function() onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.responsiveHeight(context),
        margin: EdgeInsets.only(
          bottom: 16.responsiveHeight(context),
          left: 24.responsiveWidth(context),
          right: 24.responsiveWidth(context),
        ),
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! Selected Icon
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.responsiveWidth(context)),
                child: Icon(
                  icon,
                  color: backgroundColor != null
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
              //! Reciter Name
              Text(
                title.tr(context),
                style: Styles.style16SemiBold(context).copyWith(
                    color: backgroundColor == null
                        ? AppColors.black
                        : AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
