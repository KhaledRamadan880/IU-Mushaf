import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/models/recitation_model.dart';

import '../mushaf_reading_ayah_focus_overlay.dart';
import 'recitations_container.dart';
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
            final List<RecitationModel> recitationsList = [];
            if (cubit.focusedSurahNumber! - 1 >= 0 &&
                cubit.focusedSurahNumber! - 1 <
                    context
                        .read<GlobalCubit>()
                        .recitationsModel!
                        .recitations
                        .length) {
              for (var ayah in context
                  .read<GlobalCubit>()
                  .recitationsModel!
                  .recitations[cubit.focusedSurahNumber! - 1]
                  .ayahsRecitation) {
                if (ayah.ayahNumber == cubit.focusedAyahNumberInSurah) {
                  recitationsList.add(ayah);
                }
              }
            }
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
                    children: [
                      //! Recitations Container
                      RecitationsContainer(recitationsList),
                      //! Tafser Container
                      const TafserContainer(),
                    ],
                  ),
                ),
              ),
            ).whenComplete(() async {
              await cubit.audioPlayer!.stop();
            }
            );
          },
          title: AppStrings.meanOfAyah,
        );
      },
    );
  }
}
