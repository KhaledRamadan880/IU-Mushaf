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
          height: cubit.showSurahsSearchTextField
              ? 68.responsiveHeight(context)
              : 0,
          padding: EdgeInsets.only(
            bottom: 16.responsiveHeight(context),
            left: 16.responsiveWidth(context),
            right: 16.responsiveWidth(context),
          ),
          color: Theme.of(context).secondaryHeaderColor,
          child: cubit.showSurahsSearchTextField
              ? CustomTextField(
                  focusNode: cubit.surahsSearchFocusNode,
                  controller: cubit.surahsSearchController,
                  onChanged: (value) {
                    cubit.surahsSearch(value);
                  },
                )
              : Container(),
        );
      },
    );
  }
}
