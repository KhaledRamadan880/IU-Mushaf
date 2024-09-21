import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/home/presentation/widgets/nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  List<Widget> screens() {
    return [
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
      const Placeholder(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomNavBar(
      screens: screens(),
    );
  }
}
