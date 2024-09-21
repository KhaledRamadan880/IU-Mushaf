import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/core/widgets/custom_gradient_body.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/setting_view_body.dart';
import 'package:iu_mushaf/features/settings/presentation/widgets/setting_view_header.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomGradientBody(
        body: Column(
          children: [
            //! Header
            SettingViewHeader(),
            //! Body
            SettingViewBody(),
          ],
        ),
      ),
    );
  }
}

