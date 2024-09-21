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
    return ListTile(
      onTap: onTap,
      leading: Text(
        title.tr(context),
        style: Styles.style18(context),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios_outlined),
      contentPadding: EdgeInsets.zero,
    );
  }
}
