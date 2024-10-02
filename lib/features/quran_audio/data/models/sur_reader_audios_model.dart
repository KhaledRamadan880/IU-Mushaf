import 'package:iu_mushaf/features/quran_audio/data/models/surah_url_model.dart';

class SurReaderAudiosModel {
  final String readerNameEnglish, readerNameArabic;
  final List<SurahUrlModel> surUrls;

  SurReaderAudiosModel({
    required this.readerNameEnglish,
    required this.readerNameArabic,
    required this.surUrls,
  });

  factory SurReaderAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return SurReaderAudiosModel(
      readerNameEnglish: jsonMap["reader_name_english"],
      readerNameArabic: jsonMap["reader_name_arabic"],
      surUrls: (jsonMap["sur_url"] as List)
          .map((e) => SurahUrlModel.fromJson(e))
          .toList(),
    );
  }
}
