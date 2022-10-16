import 'package:fwc_album_app/app/models/grouper_stickers.dart';

abstract class StickersRepository {
  Future<List<GrouperStickers>> getMyAlbum();
}
