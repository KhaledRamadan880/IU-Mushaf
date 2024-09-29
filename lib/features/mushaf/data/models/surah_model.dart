import 'ayah_model.dart';

class SurahModel {
  final int number;
  final String name, englishName, surahInfo;
  final List<AyahModel> ayahs;

  SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.surahInfo,
    required this.ayahs,
  });

  factory SurahModel.fromJson(Map<String, dynamic> jsonData) {
    return SurahModel(
      number: jsonData["number"],
      name: jsonData["name"],
      englishName: jsonData["englishName"],
      surahInfo: jsonData["surahInfo"],
      ayahs: (jsonData["ayahs"] as List).map((e)=> AyahModel.fromJson(e)).toList(),
    );
  }
}
