import 'package:fwc_album_app/app/core/mvp/fwc_presenter.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';

abstract class StickerDetailPresenter extends FwcPresenter {
  Future<void> load({
    required String countryCode,
    required String stickerNumber,
    required String countryName,
    UserStickerModel? stickerUser,
  });

  void incrementAmount();
  void decrementAmount();

  Future<void> saveSticker();
  Future<void> deleteSticker();
}
