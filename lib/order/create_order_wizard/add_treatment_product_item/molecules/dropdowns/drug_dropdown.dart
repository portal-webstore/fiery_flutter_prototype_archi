import 'package:flutter/material.dart';
import 'package:form_input_helpers/form_input_helpers.dart' show validateEmpty;

/// Replace or add on the autocomplete functionality later.
/// Text-assistive only. Not a replacement for the free-text.
class DrugDropdown extends StatelessWidget {
  const DrugDropdown({
    Key? key,
    required this.focusNode,
    required this.textEditingController,
    required this.onFieldSubmitted,
    required this.onSaved,
  }) : super(key: key);

  static const String getLabel = '';
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function(String? input) onFieldSubmitted;
  final void Function(String? input) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: getLabel,
        helperText: '',
      ),
      focusNode: focusNode,
      controller: textEditingController,
      validator: validateEmpty,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      textInputAction: TextInputAction.next,
    );
  }
}
