import 'package:iu_mushaf/core/imports/imports.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        cubit.searchFocusNode.addListener(() {
          if (!cubit.searchFocusNode.hasFocus) {
            cubit.changeSearchTextFieldVisibility(false);
            cubit.searchController.clear();
          }
        });
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: cubit.showSearchTextField ? 68.responsiveHeight(context) : 0,
          padding: EdgeInsets.only(
            bottom: 16.responsiveHeight(context),
            left: 16.responsiveWidth(context),
            right: 16.responsiveWidth(context),
          ),
          color: Theme.of(context).secondaryHeaderColor,
          child: cubit.showSearchTextField
              ? CustomTextField(                
                  focusNode: cubit.searchFocusNode,
                  controller: cubit.searchController,
                  onChanged: (value) {
                    cubit.search(value);
                  },
                )
              : Container(),
        );
      },
    );
  }
}
