import 'package:iu_mushaf/core/imports/imports.dart';

class QuranAudioSearchButton extends StatelessWidget {
  const QuranAudioSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        final cubit = context.read<GlobalCubit>();
        return GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            color: cubit.isDark ? AppColors.white : AppColors.grey,
          ),
        );
      },
    );
  }
}