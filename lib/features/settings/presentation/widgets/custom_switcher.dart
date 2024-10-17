import 'package:iu_mushaf/core/imports/imports.dart';

class CustomSwitcher extends StatelessWidget {
  const CustomSwitcher({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 56.responsiveWidth(context),
            height: 29.responsiveHeight(context),
            padding: EdgeInsets.symmetric(
              vertical: 4.responsiveHeight(context),
            ),
            decoration: BoxDecoration(
              color: isActive ? AppColors.pink : AppColors.lightGrey2,
              borderRadius: BorderRadius.circular(25),
            ),
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment:
                  isActive
                  ? context.read<GlobalCubit>().language == "en"
                      ? Alignment.centerRight
                      : Alignment.centerLeft
                  : context.read<GlobalCubit>().language == "en"
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
              child: const CircleAvatar(
                backgroundColor: AppColors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
