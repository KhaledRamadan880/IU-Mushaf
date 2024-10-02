import 'package:flutter_svg/svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

class AudioSettingButton extends StatelessWidget {
  const AudioSettingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}
