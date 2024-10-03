import 'package:iu_mushaf/core/imports/imports.dart';

class QuranAudioSearchButton extends StatelessWidget {
  const QuranAudioSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return BlocBuilder<QuranAudioCubit, QuranAudioState>(
          builder: (context, state) {
            final cubit = context.read<QuranAudioCubit>();
            return cubit.showSearchTextField
                ? GestureDetector(
                    onTap: () {
                      cubit.changeSearchTextFieldVisibility(false);
                      cubit.searchController.clear();
                    },
                    child: CustomText(
                      AppStrings.cancel.tr(context),
                      style: Styles.style12(context),
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      cubit.changeSearchTextFieldVisibility(true);
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
