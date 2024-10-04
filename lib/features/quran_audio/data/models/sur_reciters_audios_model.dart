import 'package:iu_mushaf/features/quran_audio/data/models/sur_reciter_audios_model.dart';

class SurRecitersAudiosModel {
  final List<SurReciterAudiosModel> surrecitersAudios;

  SurRecitersAudiosModel({required this.surrecitersAudios});

  factory SurRecitersAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return SurRecitersAudiosModel(
      surrecitersAudios: (jsonMap["reciters"] as List)
          .map((e) => SurReciterAudiosModel.fromJson(e))
          .toList(),
    );
  }
}
