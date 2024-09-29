import 'package:iu_mushaf/features/mushaf/data/models/surah_model.dart';

class SurModel {
  final List<SurahModel> sur;

  SurModel({required this.sur});

  factory SurModel.fromJson(Map<String, dynamic> jsonData) {
    return SurModel(
        sur: (jsonData["data"]["surahs"] as List).map((e)=> SurahModel.fromJson(e)).toList(),
        );
  }
}
