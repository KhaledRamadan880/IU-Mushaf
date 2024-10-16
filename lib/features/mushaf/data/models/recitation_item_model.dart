import 'package:iu_mushaf/features/mushaf/data/models/recitation_model.dart';

class RecitationItemModel {
  final int surahNUmber;
  final List<RecitationModel> ayahsRecitation;

  RecitationItemModel({
    required this.surahNUmber,
    required this.ayahsRecitation,
  });

  factory RecitationItemModel.fromJson(Map<String, dynamic> jsonMap) {
    return RecitationItemModel(
      surahNUmber: jsonMap["surah_number"],
      ayahsRecitation: (jsonMap["recitations"] as List)
          .map((e) => RecitationModel.fromJson(e))
          .toList(),
    );
  }
}
