import 'package:iu_mushaf/features/quran_audio/data/models/sur_reciter_audios_model.dart';

class SurrecitersAudiosModel {
  final List<SurreciterAudiosModel> surrecitersAudios;

  SurrecitersAudiosModel({required this.surrecitersAudios});

  factory SurrecitersAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return SurrecitersAudiosModel(
      surrecitersAudios: (jsonMap["reciters"] as List)
          .map((e) => SurreciterAudiosModel.fromJson(e))
          .toList(),
    );
  }
}
