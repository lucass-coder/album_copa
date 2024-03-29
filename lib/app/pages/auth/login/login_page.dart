import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/componnents/button.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/auth/login/presenter/login_presenter.dart';
import 'package:fwc_album_app/app/pages/auth/login/view/login_view_impl.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({Key? key, required this.presenter}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_login.png'),
                fit: BoxFit.cover),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          (MediaQuery.of(context).size.width > 350
                              ? .30
                              : .25)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Text(
                        'Login',
                        style: context.textStyles.titleWhite,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                        label: Text('E-mail'),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text('Senha'),
                        floatingLabelBehavior: FloatingLabelBehavior.never),
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Esqueceu a senha?',
                      style: context.textStyles.textSecondaryFontMedium
                          .copyWith(color: context.colors.yellow, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    width: MediaQuery.of(context).size.width * .9,
                    onPressed: () {
                      final formValid =
                          formKey.currentState?.validate() ?? false;
                      if (formValid) {
                        showLoader();
                        widget.presenter.login(emailEC.text, passwordEC.text);
                      }
                    },
                    style: context.buttonStyles.yellowButton,
                    labelStyle: context
                        .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Entrar',
                  ),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  const Spacer(),
                  Text.rich(
                    TextSpan(text: 'Não possio uma conta?', children: [
                      TextSpan(
                        text: 'Cadastre-se',
                        style:
                            context.textStyles.textSecondaryFontMedium.copyWith(
                          color: context.colors.yellow,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.of(context).pushNamed('/auth/register'),
                      )
                    ]),
                    style: context.textStyles.textSecondaryFontMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
