import 'package:iu_mushaf/core/imports/imports.dart';

class CustomText extends StatelessWidget {
  const CustomText( this.title, {super.key, this.style});

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return Text(
          title,
          style: style!.copyWith(
            color: context.read<GlobalCubit>().isDark
                ? AppColors.white
                : AppColors.black,
          ),
        );
      },
    );
  }
}
