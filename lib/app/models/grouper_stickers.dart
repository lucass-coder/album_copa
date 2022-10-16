// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class GrouperStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickersStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;
  GrouperStickers({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickersStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickersStart,
      'stickers_end': stickersEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GrouperStickers.fromMap(Map<String, dynamic> map) {
    return GrouperStickers(
      id: map['id'] as int,
      countryCode: map['country_code'] ?? '',
      countryName: map['country_name'] ?? '',
      stickersStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: List<UserStickerModel>.from(
        (map['stickers'] as List<int>).map<UserStickerModel>(
          (x) => UserStickerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      flag: map['flag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GrouperStickers.fromJson(String source) =>
      GrouperStickers.fromMap(json.decode(source) as Map<String, dynamic>);
}
