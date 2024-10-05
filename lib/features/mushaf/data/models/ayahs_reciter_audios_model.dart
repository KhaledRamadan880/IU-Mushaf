import 'package:iu_mushaf/features/mushaf/data/models/ayah_url_model.dart';

class AyahsReciterAudiosModel {
  final String reciterNameEnglish, reciterNameArabic, baseUrl;
  final List<AyahUrlModel> ayahsUrls;

  AyahsReciterAudiosModel({
    required this.reciterNameEnglish,
    required this.reciterNameArabic,
    required this.baseUrl,
    required this.ayahsUrls,
  });

  factory AyahsReciterAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return AyahsReciterAudiosModel(
      reciterNameEnglish: jsonMap["reciter_name_english"],
      reciterNameArabic: jsonMap["reciter_name_arabic"],
      baseUrl: jsonMap["base_url"],
      ayahsUrls: ayahGenerator(jsonMap["base_url"]),
    );
  }

  static List<AyahUrlModel> ayahGenerator(String baseUrl) {
    final List<AyahUrlModel> ayahsList = [];
    for (int ayahNumber = 1; ayahNumber < 6236; ayahNumber++) {
      ayahsList.add(
        AyahUrlModel(
          ayahNumber: ayahNumber,
          url: "$baseUrl$ayahNumber.mp3",
        ),
      );
    }
    return ayahsList;
  }
}
