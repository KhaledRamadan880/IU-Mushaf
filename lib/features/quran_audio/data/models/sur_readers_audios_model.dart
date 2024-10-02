import 'package:iu_mushaf/features/quran_audio/data/models/sur_reader_audios_model.dart';

class SurReadersAudiosModel {
  final List<SurReaderAudiosModel> surReadersAudios;

  SurReadersAudiosModel({required this.surReadersAudios});

  factory SurReadersAudiosModel.fromJson(Map<String, dynamic> jsonMap) {
    return SurReadersAudiosModel(
      surReadersAudios: (jsonMap["readers"] as List)
          .map((e) => SurReaderAudiosModel.fromJson(e))
          .toList(),
    );
  }
}
