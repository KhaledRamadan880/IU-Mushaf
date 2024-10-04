import 'package:iu_mushaf/features/quran_audio/data/models/surah_url_model.dart';

class SurReciterAudiosModel {
  final String reciterNameEnglish, reciterNameArabic, baseUrl;
  final List<SurahUrlModel> surUrls;

  SurReciterAudiosModel({
    required this.reciterNameEnglish,
    required this.reciterNameArabic,
    required this.baseUrl,
    required this.surUrls,
  });

  factory SurReciterAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return SurReciterAudiosModel(
      reciterNameEnglish: jsonMap["reciter_name_english"],
      reciterNameArabic: jsonMap["reciter_name_arabic"],
      baseUrl: jsonMap["base_url"],
      surUrls: generateSurList(jsonMap["base_url"]),
    );
  }

  static List<SurahUrlModel> generateSurList(String baseUrl) {
    final List<SurahUrlModel> ayahsList = [];
    for (int surahNumber = 1; surahNumber <= 114; surahNumber++) {
      ayahsList.add(
        SurahUrlModel(
          surahNumber: surahNumber,
          url: "$baseUrl${surahNumber.toString().padLeft(3, "0")}.mp3",
        ),
      );
    }
    return ayahsList;
  }
}
