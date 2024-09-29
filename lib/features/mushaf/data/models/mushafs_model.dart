import 'package:iu_mushaf/features/mushaf/data/models/mushaf_model.dart';

class MushafsModel {
  final List<MushafModel> mushafs;

  MushafsModel({required this.mushafs});

  static List<MushafModel> allMushafs = [
    //! Mushaf 1
    MushafModel(
      id: 1,
      mushafTypeEn: "Hafs",
      mushafTypeAr: "حفص",
      accentEn: "Narrated",
      accentAr: "القارء",
      byEn: "Hafs",
      byAr: "حفص",
      sur: [],
    ),
    //! Mushaf 2
    MushafModel(
      id: 2,
      mushafTypeEn: "Hafs",
      mushafTypeAr: "حفص",
      accentEn: "Narrated",
      accentAr: "القارء",
      byEn: "Hafs",
      byAr: "حفص",
      sur: [],
    ),
  ];
}
