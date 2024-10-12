import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/views/ayah_search_view.dart';

class MushafReadingHeader extends StatelessWidget {
  const MushafReadingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        return GestureDetector(
          onTap: () {},
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: context.read<MushafCubit>().isLayoutHiddin ? 0 : 1,
            child: Container(
              width: double.infinity,
              height: 62.responsiveHeight(context),
              margin: EdgeInsets.symmetric(
                horizontal: 9.responsiveWidth(context),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Row(
                children: [
                  //! Pop Button
                  CustomButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icons.arrow_back,
                  ),
                  const Spacer(),
                  //! Title
                  CustomText(
                    "${AppStrings.mushaf.tr(context)} ${AppStrings.warsh.tr(context)}",
                    style: Styles.style18SemiBold(context),
                  ),
                  const Spacer(),
                  //! Search Button
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                            value: cubit,
                            child: const AyahSearchView(),
                          ),
                        ),
                      );
                    },
                    icon: Icons.search,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: BlocBuilder<GlobalCubit, GlobalState>(
        builder: (context, state) {
          return Icon(
            icon,
            color: context.read<GlobalCubit>().isDark
                ? AppColors.white
                : AppColors.grey,
          );
        },
      ),
    );
  }
}
