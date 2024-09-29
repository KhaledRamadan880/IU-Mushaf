import 'surah_model.dart';

class MushafModel {
  final int id;
  final String mushafTypeEn, mushafTypeAr, accentEn, accentAr, byEn, byAr;
  final List<SurahModel> sur;

  MushafModel({
    required this.id,
    required this.mushafTypeEn,
    required this.mushafTypeAr,
    required this.accentEn,
    required this.accentAr,
    required this.byEn,
    required this.byAr,
    required this.sur,
  });

  factory MushafModel.fromJson(Map<String, dynamic> jsonData) {
    return MushafModel(
      id: jsonData["id"],
      mushafTypeEn: jsonData["mushafTypeEn"],
      mushafTypeAr: jsonData["mushafTypeAr"],
      accentEn: jsonData["accentEn"],
      accentAr: jsonData["accentAr"],
      byEn: jsonData["byEn"],
      byAr: jsonData["byAr"],
      sur: jsonData["sur"],
    );
  }
}
