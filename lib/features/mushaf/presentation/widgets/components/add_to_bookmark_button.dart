import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_toast.dart';

import '../mushaf_reading_ayah_focus_overlay.dart';

class AddToBookmarkButton extends StatelessWidget {
  const AddToBookmarkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 160.responsiveWidth(context),
          child: BlocConsumer<MushafCubit, MushafState>(
            listener: (context, state) {
              if (state is AddBookmarkSuccessState) {
                showToast(context, AppStrings.saved.tr(context));
                context.read<GlobalCubit>().getBookmarks();
                context.read<MushafCubit>().bookmarksModel =
                    context.read<GlobalCubit>().bookmarksModel;
              }
            },
            builder: (context, state) {
              return CustomButton(
                onTap: () {
                  context.read<MushafCubit>().addBookmark();
                },
                title: AppStrings.addToBookmark,
              );
            },
          ),
        ),
      ],
    );
  }
}
