import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:task_list_app/presentation/shared/textfield/label.widget.dart';

class EnumInputWidget<T> extends StatelessWidget {
  EnumInputWidget({
    @required String title,
    @required List<T> items,
    @required String Function(T) itemName,
    @required void Function(T) onChange,
    @required T currentValue,
    this.placeholder,
    this.width = 0.3,
    this.requiredField = true,
  })  : this.title = title,
        this.items = items,
        this.itemName = itemName,
        this.onChange = onChange,
        this.currentValue = currentValue;

  final String title;
  final List<T> items;
  final String Function(T) itemName;
  final void Function(T) onChange;
  T currentValue;
  final String placeholder;
  final double width;
  final bool requiredField;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      padding: const EdgeInsets.only(top: 15.0),
      constraints: BoxConstraints(minWidth: 300),
      child: SmartSelect<T>.single(
        modalFilter: true,
        modalType: S2ModalType.bottomSheet,
        title: title,
        choiceItems: items.map((e) {
          return S2Choice(
            value: e,
            title: itemName(e),
          );
        }).toList(),
        onChange: (S2SingleState<T> value) {
          onChange(value.value);
          currentValue = value.value;
        },
        value: currentValue,
        placeholder: placeholder ?? '',
        tileBuilder: (_, state) {
          state.value = currentValue;
          return S2Tile.fromState(
            state,
            hideValue: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelWidget(label: title, requiredField: requiredField),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    itemName(currentValue) ?? '',
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
