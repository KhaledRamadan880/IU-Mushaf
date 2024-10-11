class AyahModel {
  final int surahNumber, verseNumber, numberInQuran;
  final String qcfData, content;

  AyahModel({
    required this.surahNumber,
    required this.verseNumber,
    required this.numberInQuran,
    required this.qcfData,
    required this.content,
  });

  factory AyahModel.fromJson(Map<String, dynamic> jsonMap, {required int ayahNumber}) {
    return AyahModel(
      surahNumber: jsonMap["surah_number"],
      verseNumber: jsonMap["verse_number"],
      numberInQuran: ayahNumber,
      qcfData: jsonMap["qcfData"],
      content: jsonMap["content"],
    );
  }
}
