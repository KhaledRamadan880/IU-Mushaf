import 'package:iu_mushaf/core/imports/imports.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    this.onTap,
    this.trailing,
  });

  final Function()? onTap;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return ListTile(
          onTap: onTap,
          leading: CustomText(
            title.tr(context),
            style: Styles.style18(context),
          ),
          trailing: trailing ??
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: context.read<GlobalCubit>().isDark
                    ? AppColors.white
                    : AppColors.grey,
              ),
          contentPadding: EdgeInsets.zero,
        );
      },
    );
  }
}
