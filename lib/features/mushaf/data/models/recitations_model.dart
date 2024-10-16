import 'package:iu_mushaf/features/mushaf/data/models/recitation_item_model.dart';

class RecitationsModel {
  final List<RecitationItemModel> recitations;

  RecitationsModel({required this.recitations});

  factory RecitationsModel.fromJson(Map<String, dynamic> jsonMap) {
    return RecitationsModel(
      recitations: (jsonMap["recitation_data"] as List)
          .map((e) => RecitationItemModel.fromJson(e))
          .toList(),
    );
  }
}
