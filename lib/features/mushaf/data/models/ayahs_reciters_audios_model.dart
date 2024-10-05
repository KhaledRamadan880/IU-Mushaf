import 'package:iu_mushaf/features/mushaf/data/models/ayahs_reciter_audios_model.dart';

class AyahsRecitersAudiosModel {
  final List<AyahsReciterAudiosModel> reciters;

  AyahsRecitersAudiosModel({required this.reciters});

  factory AyahsRecitersAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return AyahsRecitersAudiosModel(
      reciters: (jsonMap["reciters"] as List)
          .map((e) => AyahsReciterAudiosModel.fromJson(e))
          .toList(),
    );
  }
}
