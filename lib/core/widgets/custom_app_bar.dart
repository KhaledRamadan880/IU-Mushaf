import 'package:iu_mushaf/core/imports/imports.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  Widget? icon,
  bool? showPop,
}) {
  return AppBar(
    title: CustomText(
      title.tr(context),
      style: Styles.style18SemiBold(context),
    ),
    centerTitle: true,
    actions: [
      icon ?? Container(),
      SizedBox(width: 20.responsiveWidth(context)),
    ],
    leading: showPop == true
        ? BlocBuilder<GlobalCubit, GlobalState>(
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: context.read<GlobalCubit>().isDark
                    ? AppColors.white
                    : AppColors.black,
              );
            },
          )
        : Container(),
    backgroundColor: Theme.of(context).secondaryHeaderColor,
    toolbarHeight: 62.responsiveHeight(context),
    surfaceTintColor: AppColors.transparent,
  );
}
