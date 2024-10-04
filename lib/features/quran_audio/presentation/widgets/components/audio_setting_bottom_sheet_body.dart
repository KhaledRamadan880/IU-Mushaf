import 'package:iu_mushaf/core/imports/imports.dart';

class AudioSettingBottomSheetBody extends StatelessWidget {
  const AudioSettingBottomSheetBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuranAudioCubit, QuranAudioState>(
      builder: (context, state) {
        final cubit = context.read<QuranAudioCubit>();
        return Container(
          width: double.infinity,
          height: 600.responsiveHeight(context),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              //! Title
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(bottom: 16.responsiveHeight(context)),
                color: Theme.of(context).secondaryHeaderColor,
                child: Center(
                  child: CustomText(
                    AppStrings.chooseReciter.tr(context),
                    style: Styles.style18SemiBold(context),
                  ),
                ),
              ),
              //! Reciters Listview
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                      vertical: 24.responsiveHeight(context)),
                  itemCount:
                      cubit.surrecitersAudiosModel!.surrecitersAudios.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        cubit.changeReciter(index);
                      },
                      child: Container(
                        height: 48.responsiveHeight(context),
                        margin: EdgeInsets.only(
                          bottom: 16.responsiveHeight(context),
                          left: 24.responsiveWidth(context),
                          right: 24.responsiveWidth(context),
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).secondaryHeaderColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: cubit.selectedReciter == index
                                ? Theme.of(context).primaryColor
                                : context.read<GlobalCubit>().isDark
                                    ? AppColors.white.withOpacity(.4)
                                    : AppColors.black.withOpacity(.4),
                            width: cubit.selectedReciter == index
                                ? 2.responsiveHeight(context)
                                : .5.responsiveHeight(context),
                          ),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //! Selected Icon
                              cubit.selectedReciter == index
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              8.responsiveWidth(context)),
                                      child: Icon(
                                        Icons.done,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    )
                                  : Container(),
                              //! Reciter Name
                              CustomText(
                                context.read<GlobalCubit>().language == "ar"
                                    ? cubit
                                        .surrecitersAudiosModel!
                                        .surrecitersAudios[index]
                                        .reciterNameArabic
                                    : cubit
                                        .surrecitersAudiosModel!
                                        .surrecitersAudios[index]
                                        .reciterNameEnglish,
                                style: Styles.style16SemiBold(context),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
