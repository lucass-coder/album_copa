// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/models/grouper_stickers.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class StickerGroup extends StatelessWidget {
  final GrouperStickers group;

  const StickerGroup({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                    alignment: const Alignment(0, -0.1),
                    widthFactor: 0.5,
                    heightFactor: 0.1,
                    child: Image.network(
                      group.flag,
                      cacheHeight:
                          (MediaQuery.of(context).size.width * 1.8).toInt(),
                    )
                    // Image.asset('assets/images/flags/BRA.png',cacheHeight:
                    //       (MediaQuery.of(context).size.width * 3).toInt(),
                    // ),
                    ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';

              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickerNumber);

              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              return Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const Sticker({
    Key? key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          color: sticker != null ? context.colors.primary : context.colors.grey,
          child: Column(children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  sticker?.duplicate.toString() ?? '',
                  style: context.textStyles.textSecondaryFontMedium
                      .copyWith(color: context.colors.yellow),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black),
            ),
          ]),
        ));
  }
}