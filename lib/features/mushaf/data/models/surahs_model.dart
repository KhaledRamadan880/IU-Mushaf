import 'package:iu_mushaf/features/mushaf/data/models/ayahs_model.dart';
import 'package:iu_mushaf/features/mushaf/data/models/surah_model.dart';

class SurahsModel {
  final List<SurahModel> surahs;

  SurahsModel({required this.surahs});

  factory SurahsModel.fromJson(Map<String, dynamic> jsonMap, AyahsModel ayahs) {
    return SurahsModel(
      surahs: (jsonMap["surahs"] as List)
          .map((e) => SurahModel.fromJson(e, ayahs))
          .toList(),
    );
  }
}
