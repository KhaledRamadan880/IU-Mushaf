import 'package:iu_mushaf/features/mushaf/data/models/ayah_tafser_model.dart';

class TafserModel {
  final int id;
  final String nameEnglish, nameArabic;
  final List<AyahTafserModel> ayahsTafserList;

  TafserModel({
    required this.id,
    required this.nameEnglish,
    required this.nameArabic,
    required this.ayahsTafserList,
  });

  factory TafserModel.fromJson(Map<String, dynamic> jsonMap) {
    return TafserModel(
      id: jsonMap["id"],
      nameEnglish: jsonMap["name_english"],
      nameArabic: jsonMap["name_arabic"],
      ayahsTafserList: (jsonMap["ayahs_tafser"] as List)
          .map((e) => AyahTafserModel.fromJson(e))
          .toList(),
    );
  }
}
