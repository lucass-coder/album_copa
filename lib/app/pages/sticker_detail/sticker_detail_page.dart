import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/componnents/button.dart';
import 'package:fwc_album_app/app/core/ui/componnents/rounded_button.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerDetailPage extends StatefulWidget {
  const StickerDetailPage({super.key});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends State<StickerDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe Figurinha'),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/sticker.png'),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'BRA 17',
                    style: context.textStyles.textPrimaryFontBold.copyWith(
                      fontSize: 22,
                    ),
                  ),
                ),
                const Spacer(),
                RoundedButton(icon: Icons.remove, onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    '1',
                    style: context.textStyles.textSecondaryFontMedium,
                  ),
                ),
                RoundedButton(icon: Icons.add, onPressed: () {})
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text('Brasil',
                  style: context.textStyles.textPrimaryFontRegular),
            ),
            Button.primary(
              label: 'Adicionar Figurinha',
              onPressed: () {},
              width: MediaQuery.of(context).size.width * .9,
            ),
            Button(
                label: 'Excluir Figurinha',
                onPressed: () {},
                outline: true,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                style: context.buttonStyles.primaryOutlineButton,
                width: MediaQuery.of(context).size.width * .9),
          ],
        ),
      )),
    );
  }
}
