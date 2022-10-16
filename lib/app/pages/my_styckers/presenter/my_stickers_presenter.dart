import 'package:fwc_album_app/app/pages/my_styckers/view/my_stickers_view.dart';

import '../../../core/mvp/fwc_presenter.dart';

abstract class MyStickersPresenter extends FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  Future<void> statusFilter(String status);
}
