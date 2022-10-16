import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_route.dart';
import 'package:fwc_album_app/app/pages/auth/register/register_route.dart';
import 'package:fwc_album_app/app/pages/home/home.route.dart';
import 'package:fwc_album_app/app/pages/my_styckers/my_sticker_page.dart';
import 'package:fwc_album_app/app/pages/splash/splash_route.dart';
import 'package:fwc_album_app/app/repositoy/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repositoy/auth/auth_repository_impl.dart';

import 'app/core/ui/global/global_context.dart';
import 'app/core/ui/global/global_context_impl.dart';
import 'app/core/ui/theme/theme_config.dart';

class FwcAlgumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  FwcAlgumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        // Calable class
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>((i) =>
            GlobalContextImpl(navigatorKey: navigatorKey, authRepository: i())),
      ],
      child: MaterialApp(
          title: 'Fifa World Cup Album',
          theme: ThemeConfig.theme,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          routes: {
            '/': (_) => const SplashRoute(),
            '/auth/login': (_) => const LoginRoute(),
            '/auth/register': (_) => const RegisterRoute(),
            '/home': (_) => const HomeRoute(),
            '/my-stickers': (_) => const MyStickerPage(),
          }),
    );
  }
}
