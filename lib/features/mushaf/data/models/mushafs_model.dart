import 'package:iu_mushaf/features/mushaf/data/models/mushaf_model.dart';

class MushafsModel {
  final List<MushafModel> mushafs;

  MushafsModel({required this.mushafs});

  factory MushafsModel.fromJson(Map<String, dynamic> jsonMap) {
    return MushafsModel(
      mushafs: (jsonMap["mushafs"] as List)
          .map((e) => MushafModel.fromJson(e))
          .toList(),
    );
  }
}
