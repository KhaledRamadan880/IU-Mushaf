import 'package:iu_mushaf/features/mushaf/data/models/ayah_model.dart';

class AyahsModel {
  final List<AyahModel> ayahs;

  AyahsModel({required this.ayahs});

  factory AyahsModel.fromJson(Map<String, dynamic> jsonMap) {
    return AyahsModel(
      ayahs: (jsonMap["ayahs"] as List)
          .asMap()
          .entries
          .map(
            (entry) => AyahModel.fromJson(
              entry.value,
              ayahNumber: entry.key + 1,
            ),
          )
          .toList(),
    );
  }
}
