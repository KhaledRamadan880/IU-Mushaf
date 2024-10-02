class SurahUrlModel {
  final int surahNumber;
  final String url;

  SurahUrlModel({required this.surahNumber, required this.url});

  factory SurahUrlModel.fromJson(Map<String, dynamic> jsonMap) {
    return SurahUrlModel(
      surahNumber: jsonMap["surah_number"],
      url: jsonMap["surah_url"],
    );
  }
}
