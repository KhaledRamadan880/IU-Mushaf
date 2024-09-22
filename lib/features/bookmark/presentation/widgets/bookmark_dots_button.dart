import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/splash/presentation/widgets/custom_elevated_button.dart';

class BookmarkDotsButton extends StatelessWidget {
  const BookmarkDotsButton({
    super.key,
  });

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
                return SizedBox(
                  height: 200.responsiveHeight(context),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 12.responsiveHeight(context)),
                      CustomElevatedButton(
                        onPressed: () {},
                        title: AppStrings.goToAyah.tr(context),
                      ),
                      SizedBox(height: 24.responsiveHeight(context)),
                      CustomElevatedButton(
                        onPressed: () {},
                        title: AppStrings.deleteAyah.tr(context),
                        textColor: AppColors.red,
                      ),
                    ],
                  ),
                );
              },
            ).whenComplete(() {
              cubit.navBarVisibliltyToggle(true);
            });
          },
          icon: const Icon(
            Icons.more_horiz_outlined,
            color: AppColors.grey,
          ),
        );
      },
    );
  }
}
