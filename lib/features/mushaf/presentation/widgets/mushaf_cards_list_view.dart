import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/presentation/cubit/mushaf_cubit.dart';
import 'package:iu_mushaf/features/mushaf/presentation/views/mushaf_reading_view.dart';
import 'package:iu_mushaf/features/mushaf/presentation/widgets/mushaf_card.dart';

class MushafCardsListView extends StatelessWidget {
  const MushafCardsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final globalCubit = context.read<GlobalCubit>();
    return Expanded(
      child: SizedBox(
        width: 326.responsiveWidth(context),
        child: ListView.builder(
          itemCount: globalCubit.mushafsModel!.mushafs.length,
          itemBuilder: (context, index) {
            return MushafCard(
              mushafType: globalCubit.mushafsModel!.mushafs[index].mushafTypeEn,
              accent: globalCubit.mushafsModel!.mushafs[index].accentEn,
              by: globalCubit.mushafsModel!.mushafs[index].byEn,
              onTap: () {
                globalCubit.addAyahsToList();
                PersistentNavBarNavigator.pushDynamicScreen(
                  context,
                  screen: MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) =>
                          MushafCubit()..hideLayoutAfterNavigate(),
                      child: const MushafReadingView(),
                    ),
                  ),
                  withNavBar: false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
