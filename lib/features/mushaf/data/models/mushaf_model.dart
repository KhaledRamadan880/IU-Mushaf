class MushafModel {
  final int id, narratedId;
  final String mushafTypeEn, mushafTypeAr, narratedEn, narratedAr, byEn, byAr;

  MushafModel({
    required this.id,
    required this.narratedId,
    required this.mushafTypeEn,
    required this.mushafTypeAr,
    required this.narratedEn,
    required this.narratedAr,
    required this.byEn,
    required this.byAr,
  });

  factory MushafModel.fromJson(Map<String, dynamic> jsonData) {
    return MushafModel(
      id: jsonData["id"],
      mushafTypeEn: jsonData["mushafTypeEn"],
      mushafTypeAr: jsonData["mushafTypeAr"],
      narratedId: jsonData["narratedId"],
      narratedEn: jsonData["narratedEn"],
      narratedAr: jsonData["narratedAr"],
      byEn: jsonData["byEn"],
      byAr: jsonData["byAr"],
    );
  }
}
