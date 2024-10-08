import 'package:iu_mushaf/features/mushaf/data/models/tafser_model.dart';

class TafsersModel {
  final List<TafserModel> tafserModel;

  TafsersModel({required this.tafserModel});

  factory TafsersModel.fromJson(Map<String, dynamic> jsonMap) {
    return TafsersModel(
      tafserModel: (jsonMap["tafsers"] as List)
          .map((e) => TafserModel.fromJson(e))
          .toList(),
    );
  }
}
