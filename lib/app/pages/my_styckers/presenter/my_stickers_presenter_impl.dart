// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fwc_album_app/app/models/grouper_stickers.dart';
import 'package:fwc_album_app/app/pages/my_styckers/view/my_stickers_view.dart';
import 'package:fwc_album_app/app/repositoy/stickes/stickers_repository.dart';

import './my_stickers_presenter.dart';

class MyStickersPresenterImpl implements MyStickersPresenter {
  StickersRepository stickersRepository;
  late final MyStickersView _view;
  var album = <GrouperStickers>[];

  MyStickersPresenterImpl({
    required this.stickersRepository,
  });
  @override
  Future<void> getMyAlbum() async {
    album = await stickersRepository.getMyAlbum();
    _view.loadedPage([...album]);
  }

  @override
  set view(MyStickersView view) => _view = view;
}
