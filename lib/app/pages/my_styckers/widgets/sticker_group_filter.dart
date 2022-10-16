// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerGroupFilter extends StatefulWidget {
  const StickerGroupFilter({super.key});

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StickerGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
            ),
          );
        },
        onChange: (value) {},
        choiceItems: S2Choice.listFrom(
            source: [
              {'value': 'BRA', 'title': 'Brasil'},
              {'value': 'FWC', 'title': 'Fifa World Cup'},
            ],
            value: (_, item) => item['value'] ?? '',
            title: (_, item) => item['value'] ?? ''),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }
}

class _StickerGroupTile extends StatelessWidget {
  final String label;
  const _StickerGroupTile({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0XFFF0F0F0),
            borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.filter_list),
              const SizedBox(width: 5),
              Text(
                label,
                style: context.textStyles.textSecondaryFontRegular
                    .copyWith(fontSize: 11),
              )
            ],
          ),
        ));
  }
}
