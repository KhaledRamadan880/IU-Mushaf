import 'package:iu_mushaf/features/bookmark/data/models/bookmark_item_model.dart';

class BookmarksModel {
  final List<BookmarkItemModel> bookmarks;

  BookmarksModel({required this.bookmarks});

  factory BookmarksModel.fromJson(Map<String, dynamic> jsonMap) {
    return BookmarksModel(
      bookmarks: (jsonMap["bookmarks"] as List)
          .map((e) => BookmarkItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "bookmarks" : bookmarks.map((e)=> e.toMap()).toList(),
    };
  }
}
