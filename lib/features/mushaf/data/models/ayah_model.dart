class AyahModel {
  final String audio;
  final String text;
  final int numberInSurah;
  final int juz;
  final int page;
  final int pageInSurah;
  final int ayahNumber;

  AyahModel({
    required this.audio,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.page,
    required this.pageInSurah,
    required this.ayahNumber,
  });

  factory AyahModel.fromJson(Map<String, dynamic> jsonData) {
    return AyahModel(
      audio: jsonData["audio"],
      text: jsonData["text"],
      numberInSurah: jsonData["numberInSurah"],
      juz: jsonData["juz"],
      page: jsonData["page"],
      pageInSurah: jsonData["pageInSurah"],
      ayahNumber: jsonData["number"],
    );
  }
}
