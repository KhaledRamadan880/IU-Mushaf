import 'package:iu_mushaf/core/imports/imports.dart';

import '../mushaf_reading_ayah_focus_overlay.dart';
import 'tafser_container.dart';

class MeanOfAyahButton extends StatelessWidget {
  const MeanOfAyahButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        return CustomButton(
          onTap: () {
            showModalBottomSheet(
              context: context,
              showDragHandle: true,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              builder: (context) => BlocProvider.value(
                value: cubit
                  ..tafserModel =
                      context.read<GlobalCubit>().tafsersModel!.tafserModel[0],
                child: Container(
                  height: 500.responsiveHeight(context),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.responsiveWidth(context),
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView(
                    children: const [
                      //! Tafser Container
                      TafserContainer(),
                    ],
                  ),
                ),
              ),
            );
          },
          title: AppStrings.meanOfAyah,
        );
      },
    );
  }
}
