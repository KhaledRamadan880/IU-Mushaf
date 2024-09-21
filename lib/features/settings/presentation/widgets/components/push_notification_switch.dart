import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/custom_switcher.dart';

class PushNotificationSwitch extends StatelessWidget {
  const PushNotificationSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return CustomSwitcher(
          isActive: cubit.isPushNotification,
          onTap: () {
            cubit.changeNotificationPermission();
          },
        );
      },
    );
  }
}