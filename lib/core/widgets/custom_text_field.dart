import 'package:iu_mushaf/core/imports/imports.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.focusNode,
    required this.controller,
    required this.onChanged,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: onChanged,
      autofocus: true,
      cursorColor: Theme.of(context).primaryColor,
      style: Styles.style16SemiBold(context).copyWith(
        color: context.read<GlobalCubit>().isDark
            ? AppColors.white
            : AppColors.black,
      ),
      decoration: InputDecoration(
        hintText: AppStrings.search.tr(context),
        hintStyle: Styles.style16(context).copyWith(
          color: context.read<GlobalCubit>().isDark
              ? AppColors.white.withOpacity(.4)
              : AppColors.black.withOpacity(.4),
        ),
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: context.read<GlobalCubit>().isDark
            ? AppColors.white.withOpacity(.4)
            : AppColors.black.withOpacity(.4),
        contentPadding:
            EdgeInsets.symmetric(horizontal: 24.responsiveWidth(context)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: context.read<GlobalCubit>().isDark
                ? AppColors.white.withOpacity(.4)
                : AppColors.black.withOpacity(.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: context.read<GlobalCubit>().isDark
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      ),
    );
  }
}
