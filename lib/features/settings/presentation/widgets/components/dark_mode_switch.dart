import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/custom_switcher.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return CustomSwitcher(
          isActive: cubit.isDark,
          onTap: () {
            cubit.changeThemeMod();
          },
        );
      },
    );
  }
}