import 'package:iu_mushaf/core/imports/imports.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.title, {
    super.key,
    this.style,
    this.textDirection,
    this.textAlign,
    this.lightColor,
    this.showShadow,
  });

  final String title;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final Color? lightColor;
  final bool? showShadow;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Text(
          title,
          style: style!.copyWith(
            color: context.read<GlobalCubit>().isDark
                ? AppColors.white
                : lightColor ?? AppColors.black,
            shadows: [
              showShadow == true
                  ? Shadow(
                      color: context.read<GlobalCubit>().isDark
                          ? AppColors.white
                          : AppColors.black,
                      offset: const Offset(0, 1),
                      blurRadius: 1,
                    )
                  : const Shadow(),
            ],
          ),
          textDirection: textDirection ?? TextDirection.ltr,
          textAlign: textAlign ?? TextAlign.start,
        );
      },
    );
  }
}
