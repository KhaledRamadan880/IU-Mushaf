import 'package:iu_mushaf/core/imports/imports.dart';
import 'package:iu_mushaf/features/mushaf/data/models/recitation_model.dart';

class RecitationsContainer extends StatelessWidget {
  const RecitationsContainer(this.recitationsList, {super.key});
  final List<RecitationModel> recitationsList;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushafCubit, MushafState>(
      builder: (context, state) {
        final cubit = context.read<MushafCubit>();
        return recitationsList.isNotEmpty
            ? Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 8.responsiveWidth(context),
                  vertical: 16.responsiveHeight(context),
                ),
                margin: EdgeInsets.only(
                  top: 16.responsiveHeight(context),
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    //! Header
                    CustomText(
                      AppStrings.recitations.tr(context),
                      style: Styles.style18SemiBold(context),
                    ),
                    SizedBox(height: 16.responsiveHeight(context)),
                    //! Tafser
                    Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        recitationsList.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                              bottom: 10.responsiveHeight(context)),
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              //! Play Button
                              InkWell(
                                onTap: () {
                                  cubit.playRecitation(
                                      url: recitationsList[index].audioUrl);
                                },
                                child: CircleAvatar(
                                  radius: 18.responsiveHeight(context),
                                  backgroundColor:
                                      context.read<GlobalCubit>().isDark
                                          ? AppColors.white
                                          : AppColors.black,
                                  child: Icon(
                                    Icons.volume_up,
                                    color: context.read<GlobalCubit>().isDark
                                        ? AppColors.black
                                        : AppColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.responsiveWidth(context)),
                              //! Content
                              Expanded(
                                child: CustomText(
                                  recitationsList[index].ayaTextEmlaey,
                                  style: Styles.style18(context).copyWith(
                                    overflow: TextOverflow.clip,
                                  ),
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}
