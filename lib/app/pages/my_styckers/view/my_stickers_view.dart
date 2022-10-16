import 'package:fwc_album_app/app/models/grouper_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GrouperStickers> album);
  void error(String message);
  void updateStatusFilter(status);
}
