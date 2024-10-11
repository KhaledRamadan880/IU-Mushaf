import 'package:iu_mushaf/features/mushaf/data/models/ayah_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/ayahs_model.dart';

class SurahModel {
  final int number, numberOfAyahs;
  final String name, englishName, revelationType;
  final AyahsModel ayahs;

  SurahModel({
    required this.number,
    required this.numberOfAyahs,
    required this.name,
    required this.englishName,
    required this.revelationType,
    required this.ayahs,
  });

  factory SurahModel.fromJson(
      Map<String, dynamic> jsonMap, AyahsModel ayahs) {
    return SurahModel(
      number: jsonMap["number"],
      numberOfAyahs: jsonMap["numberOfAyahs"],
      name: jsonMap["name"],
      englishName: jsonMap["englishName"],
      revelationType: jsonMap["revelationType"],
      ayahs: addAyahsOfSurah(jsonMap["number"], ayahs),
    );
  }

  static addAyahsOfSurah(int surahNumber, AyahsModel ayahs) {
    List<AyahModel> list = [];
    for (var ayah in ayahs.ayahs) {
      if(ayah.surahNumber == surahNumber){
        list.add(ayah);
      }
    }
    return AyahsModel(ayahs: list);
  }
}
