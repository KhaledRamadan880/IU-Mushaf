import 'package:flutter_svg/svg.dart';
import 'package:iu_mushaf/core/imports/imports.dart';

class SurahNumberContainer extends StatelessWidget {
  const SurahNumberContainer(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36.responsiveWidth(context),
      height: 36.responsiveHeight(context),
      child: Stack(
        children: [
          Center(
            child: BlocBuilder<GlobalCubit, GlobalState>(
              builder: (context, state) {
                return SvgPicture.asset(
                  Assets.imagesMuslimIcon,
                  colorFilter: ColorFilter.mode(
                    context.read<GlobalCubit>().isDark
                        ? AppColors.white
                        : AppColors.black,
                    BlendMode.srcIn,
                  ),
                );
              },
            ),
          ),
          Center(
            child: CustomText(
              (index + 1).toString(),
              style: Styles.style14Medium(context),
            ),
          ),
        ],
      ),
    );
  }
}
