// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/my_styckers/presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickerGroupFilter({
    Key? key,
    required this.countries,
  }) : super(key: key);

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StickerGroupTile(
              label: state.selected.title?.join(', ') ?? 'Filtro',
              clearCallback: () {
                setState(() {
                  selected = null;
                  context.get<MyStickersPresenter>().countryFilter(selected);
                });
              },
            ),
          );
        },
        selectedValue: selected ?? [],
        onChange: (selectedValue) {
          setState(() {
            selected = selectedValue.value;
          });
          context.get<MyStickersPresenter>().countryFilter(selected);
        },
        choiceItems: S2Choice.listFrom(
            source: widget.countries.entries
                .map((e) => {'value': e.key, 'title': e.value})
                .toList(),
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
  final VoidCallback clearCallback;
  const _StickerGroupTile({
    Key? key,
    required this.label,
    required this.clearCallback,
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
              Expanded(
                child: Text(
                  label,
                  style: context.textStyles.textSecondaryFontRegular
                      .copyWith(fontSize: 11),
                ),
              ),
              InkWell(
                onTap: clearCallback,
                child: const Icon(Icons.clear),
              )
            ],
          ),
        ));
  }
}
