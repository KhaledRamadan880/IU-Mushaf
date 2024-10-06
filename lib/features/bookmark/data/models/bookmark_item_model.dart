class BookmarkItemModel {
  final String surahNameEn, surahNameAr, ayahText, mushafTypeEn, mushafTypeAr;
  final int surahNumber, pageNumber;

  BookmarkItemModel({
    required this.surahNameEn,
    required this.surahNameAr,
    required this.ayahText,
    required this.mushafTypeEn,
    required this.mushafTypeAr,
    required this.surahNumber,
    required this.pageNumber,
  });

  factory BookmarkItemModel.fromJson(Map<String, dynamic> jsonMap) {
    return BookmarkItemModel(
      surahNameEn: jsonMap["surah_name_english"],
      surahNameAr: jsonMap["surah_name_arabic"],
      ayahText: jsonMap["ayah_text"],
      mushafTypeEn: jsonMap["mushaf_type_english"],
      mushafTypeAr: jsonMap["mushaf_type_arabic"],
      surahNumber: jsonMap["surah_number"],
      pageNumber: jsonMap["page_number"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "surah_name_english": surahNameEn,
      "surah_name_arabic": surahNameAr,
      "ayah_text": ayahText,
      "mushaf_type_english": mushafTypeEn,
      "mushaf_type_arabic": mushafTypeAr,
      "surah_number": surahNumber,
      "page_number": pageNumber,
    };
  }
}
