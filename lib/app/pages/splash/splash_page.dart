import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/componnents/button.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/splash/presenter/splash_presenter.dart';
import 'package:fwc_album_app/app/pages/splash/view/splash_view_impl.dart';

class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_splash.png'),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    // ATALHO - FU-SH
                    // Insere um padding de 8% da tela
                    top: MediaQuery.of(context).size.height * .08),
                child: Image.asset(
                  'assets/images/fifa_logo.png',
                  // Insere um padding de 25% da tela
                  height: MediaQuery.of(context).size.height * .25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * .19),
                child: Button(
                    width: MediaQuery.of(context).size.width * .9,
                    onPressed: () {
                      widget.presenter.checkLogin();
                    },
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Acessar'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/bandeiras.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
