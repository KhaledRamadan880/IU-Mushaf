class AyahTafserModel {
  final int id, surah, ayah;
  final String text;

  AyahTafserModel({
    required this.id,
    required this.surah,
    required this.ayah,
    required this.text,
  });

  factory AyahTafserModel.fromJson(Map<String, dynamic> jsonMap) {
    return AyahTafserModel(
      id: jsonMap["id"],
      surah: jsonMap["sura"],
      ayah: jsonMap["aya"],
      text: jsonMap["text"],
    );
  }
}
