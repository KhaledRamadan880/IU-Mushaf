import 'package:flutter_svg/svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

import 'audio_setting_bottom_sheet_body.dart';

class AudioSettingButton extends StatelessWidget {
  const AudioSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return BlocBuilder<QuranAudioCubit, QuranAudioState>(
          builder: (context, state) {
            final quranAudioCubit = context.read<QuranAudioCubit>();
            return GestureDetector(
              onTap: () {
                cubit.navBarVisibliltyToggle(false);
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  builder: (newContext) => BlocProvider.value(
                    value: quranAudioCubit,
                    child: const AudioSettingBottomSheetBody(),
                  ),
                ).whenComplete(() {
                  cubit.navBarVisibliltyToggle(true);
                });
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: BlocBuilder<GlobalCubit, GlobalState>(
                  builder: (context, state) {
                    return SvgPicture.asset(
                      Assets.imagesSettingsIcon,
                      colorFilter: ColorFilter.mode(
                        context.read<GlobalCubit>().isDark
                            ? AppColors.white.withOpacity(.4)
                            : AppColors.black.withOpacity(.4),
                        BlendMode.srcIn,
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

