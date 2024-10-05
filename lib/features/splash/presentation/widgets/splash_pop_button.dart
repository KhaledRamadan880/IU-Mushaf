import 'package:iu_mushaf/core/imports/imports.dart';

class SplahPopButton extends StatelessWidget {
  const SplahPopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 40.responsiveHeight(context),
        left: 16.responsiveWidth(context),
        right: 16.responsiveWidth(context),
      ),
      child: Align(
        alignment: context.read<GlobalCubit>().language == "en"
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: context.read<GlobalCubit>().isDark
                  ? AppColors.white
                  : AppColors.black,
            );
          },
        ),
      ),
    );
  }
}
