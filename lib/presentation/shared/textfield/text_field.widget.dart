import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_list_app/helpers/platform_checker.dart';
import 'package:task_list_app/presentation/shared/textfield/type_text_field.enum.dart';

import 'label.widget.dart';

class TextFieldWidget extends StatefulWidget {
  /// Label que fica acima do textfield
  final String label;

  /// Valor de ```.0 até 1``` definindo o tamanho do TextField
  final double width;

  /// OnChange para guardar o valor do text field em alguma variavel
  final void Function(String) onChanged;

  /// Quando o text field está ativo ou não
  final bool enabled;

  /// Quando o campo é obrigatório
  final bool requiredField;

  /// Tipo do text field
  ///
  /// ```TypeTextField.TEXT```
  ///
  /// ```TypeTextField.DATE```
  final TypeTextField type;

  final void Function(DateTime) onDateChanged;

  final Rx<DateTime> dateInitialValue;

  final String textInitialValue;

  final bool obscureText;

  final String helperText;

  TextFieldWidget(
      {@required this.label,
      this.width,
      this.onChanged,
      this.enabled = true,
      this.requiredField = false,
      this.type = TypeTextField.TEXT,
      this.onDateChanged,
      this.dateInitialValue,
      this.textInitialValue,
      this.obscureText = false,
      this.helperText = ''});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  DateTime _dateTime;
  final _controller = TextEditingController();

  @override
  void didUpdateWidget(_) {
    super.didUpdateWidget(_);
    if (widget.textInitialValue != null) {
      _controller.text = widget.textInitialValue;
    } else {
      _controller.clear();
    }
  }

  void _getDateTime() {
    if (widget.dateInitialValue?.value != null &&
        widget.dateInitialValue.value.year != 1970) {
      _dateTime = widget.dateInitialValue.value;
    } else {
      _dateTime = DateTime.now();
      _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day);
    }
  }

  void openDatePicker() async {
    _getDateTime();

    var result = await showDatePicker(
      context: context,
      firstDate: DateTime.now().subtract(Duration(days: 730)),
      initialDate: _dateTime,
      lastDate: DateTime.now().add(Duration(days: 730)),
    );

    var timeResult = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 0, minute: 0));

    _dateTime = DateTime(
      result?.year ?? _dateTime.year,
      result?.month ?? _dateTime.month,
      result?.day ?? _dateTime.day,
      timeResult?.hour ?? _dateTime.hour,
      timeResult?.minute ?? _dateTime.minute,
    );

    setState(() {
      _controller.text = DateFormat('dd/MM/yyyy HH:mm').format(_dateTime);
    });
    widget.onDateChanged(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == TypeTextField.DATE) {
      if (widget.dateInitialValue?.value != null) {
        _controller.text = widget.dateInitialValue.value.year != 1970
            ? DateFormat('dd/MM/yyyy HH:mm').format(widget.dateInitialValue.value)
            : '';
      } else {
        _controller.clear();
      }
    }

    if (widget.type == TypeTextField.TEXT) {
      _controller.text = widget.textInitialValue ?? _controller.text ?? '';
    }

    return Container(
      padding: const EdgeInsets.all(15.0),
      constraints: BoxConstraints(
        minWidth: PlatformChecker.isMobile() ? MediaQuery.of(context).size.width * .7 : MediaQuery.of(context).size.width * .1,
      ),
      width: MediaQuery.of(context).size.width * (widget.width ?? .1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelWidget(label: widget.label, requiredField: widget.requiredField),
          SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  obscureText: widget.obscureText,
                  onChanged: widget.onChanged,
                  controller: _controller,
                  enabled: widget.enabled && widget.type != TypeTextField.DATE,
                  decoration: InputDecoration(
                    helperText:
                        widget.helperText.isNotEmpty ? widget.helperText : null,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0,
                        color: PlatformChecker.isMobile() ? Colors.black.withOpacity(.7) : Colors.grey.withOpacity(.5),
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                  ),
                ),
              ),
              if (widget.type == TypeTextField.DATE)
                Row(
                  children: [
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: widget.enabled ? openDatePicker : null,
                      icon: Icon(Icons.date_range),
                    ),
                  ],
                )
            ],
          ),
        ],
      ),
    );
  }
}
