class RecitationModel {
  // final int id;
  final int page, ayahNumber;
  final String ayaTextEmlaey, audioUrl;

  RecitationModel({
    // required this.id,
    required this.page,
    required this.ayahNumber,
    required this.ayaTextEmlaey,
    required this.audioUrl,
  });

  factory RecitationModel.fromJson(Map<String, dynamic> jsonMap) {
    return RecitationModel(
        // id: jsonMap["id"],
        page: jsonMap["page"],
        ayahNumber: jsonMap["aya_no"],
        ayaTextEmlaey: jsonMap["aya_text_emlaey"],
        audioUrl: jsonMap["audio_url"]);
  }
}
