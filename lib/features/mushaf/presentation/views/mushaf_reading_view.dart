import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/cubit/mushaf_cubit.dart';
import 'package:iu_mushaf/features/mushaf/presentation/widgets/mushaf_reading_ayah_focus_overlay.dart';
import 'package:iu_mushaf/features/splash/presentation/widgets/custom_elevated_button.dart';

import '../widgets/mushaf_reading_container.dart';
import '../widgets/mushaf_reading_header.dart';
import '../widgets/mushaf_reading_page_and_surah.dart';

class MushafReadingView extends StatelessWidget {
  const MushafReadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (context.read<MushafCubit>().focusedAyahNumber != null) {
              context.read<MushafCubit>().changeFocusedAyah(null);
            } else {
              context.read<MushafCubit>().changeLayoutVisibility();
            }
          },
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 37.responsiveHeight(context)),
                    //! Header Bar
                    const MushafReadingHeader(),
                    //! Reading Container
                    const MushafReadingContainer(),
                    //! Page Number & Surah Name
                    const MushafReadingPageNumberAndSurah(),
                  ],
                ),
                const AyahFocusButtons(),
              ],
            ),
          ),
        );
      },
    );
  }
}
