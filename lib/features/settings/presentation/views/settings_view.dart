import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/setting_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: AppStrings.setting),
      body: const CustomGradientBody(
        body: Column(
          children: [
            //! Body
            SettingViewBody(),
          ],
        ),
      ),
    );
  }
}

