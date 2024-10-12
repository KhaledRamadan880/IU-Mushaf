import 'package:iu_mushaf/core/imports/imports.dart';

class SurahsListSearchButton extends StatelessWidget {
  const SurahsListSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return BlocBuilder<MushafCubit, MushafState>(
          builder: (context, state) {
            final cubit = context.read<MushafCubit>();
            return cubit.showSurahsSearchTextField
                ? GestureDetector(
                    onTap: () {
                      cubit.changeSurahsSearchTextFieldVisibility(false);
                      cubit.surahsSearchController.clear();
                    },
                    child: CustomText(
                      AppStrings.cancel.tr(context),
                      style: Styles.style12(context),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      cubit.changeSurahsSearchTextFieldVisibility(true);
                    },
                    icon: Icon(
                      Icons.search,
                      color: context.read<GlobalCubit>().isDark
                          ? AppColors.white
                          : AppColors.grey,
                    ),
                  );
          },
        );
      },
    );
  }
}
