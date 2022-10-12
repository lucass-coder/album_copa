import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_page.dart';
import 'package:fwc_album_app/app/pages/home/home_page.dart';
import 'package:fwc_album_app/app/pages/splash/splash_route.dart';
import 'package:fwc_album_app/app/repositoy/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repositoy/auth/auth_repository_impl.dart';

import 'app/core/ui/theme/theme_config.dart';

class FwcAlgumApp extends StatelessWidget {
  const FwcAlgumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        // Calable class
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
      ],
      child: MaterialApp(
          title: 'Fifa World Cup Album',
          theme: ThemeConfig.theme,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (_) => const SplashRoute(),
            '/auth/login': (_) => const LoginPage(),
            '/home': (_) => const HomePage(),
          }),
    );
  }
}
