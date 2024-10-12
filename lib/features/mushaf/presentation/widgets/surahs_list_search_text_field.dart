import 'package:iu_mushaf/core/imports/imports.dart';

class SurahsListSearchTextField extends StatelessWidget {
  const SurahsListSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        cubit.surahsSearchFocusNode.addListener(() {
          if (!cubit.surahsSearchFocusNode.hasFocus) {
            cubit.changeSearchTextFieldVisibility(false);
            cubit.surahsSearchController.clear();
          }
        });
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: cubit.showSurahsSearchTextField ? 68.responsiveHeight(context) : 0,
          padding: EdgeInsets.only(
            bottom: 16.responsiveHeight(context),
            left: 16.responsiveWidth(context),
            right: 16.responsiveWidth(context),
          ),
          color: Theme.of(context).secondaryHeaderColor,
          child: cubit.showSurahsSearchTextField
              ? TextField(
                  focusNode: cubit.surahsSearchFocusNode,
                  controller: cubit.surahsSearchController,
                  autofocus: true,
                  onChanged: (value) {
                    cubit.surahsSearch(value);
                  },
                  cursorColor: Theme.of(context).primaryColor,
                  style: Styles.style16SemiBold(context).copyWith(
                    color: context.read<GlobalCubit>().isDark
                        ? AppColors.white
                        : AppColors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: AppStrings.search.tr(context),
                    hintStyle: Styles.style16(context).copyWith(
                      color: context.read<GlobalCubit>().isDark
                          ? AppColors.white.withOpacity(.4)
                          : AppColors.black.withOpacity(.4),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: context.read<GlobalCubit>().isDark
                        ? AppColors.white.withOpacity(.4)
                        : AppColors.black.withOpacity(.4),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 24.responsiveWidth(context)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: context.read<GlobalCubit>().isDark
                            ? AppColors.white.withOpacity(.4)
                            : AppColors.black.withOpacity(.4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: context.read<GlobalCubit>().isDark
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),
                )
              : Container(),
        );
      },
    );
  }
}
