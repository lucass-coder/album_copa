import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/pages/my_styckers/my_stickers_page.dart';
import 'package:fwc_album_app/app/pages/my_styckers/presenter/my_stickers_presenter.dart';
import 'package:fwc_album_app/app/pages/my_styckers/presenter/my_stickers_presenter_impl.dart';
import 'package:fwc_album_app/app/repositoy/stickes/stickers_repository.dart';
import 'package:fwc_album_app/app/repositoy/stickes/stickers_repository_impl.dart';

class MyStickersRoute extends FlutterGetItPageRoute {
  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
            (i) => StickersRepositoryImpl(dio: i())),
        Bind.lazySingleton<MyStickersPresenter>(
            (i) => MyStickersPresenterImpl(stickersRepository: i())),
      ];

  @override
  WidgetBuilder get page =>
      (context) => MyStickersPage(presenter: context.get());
}
