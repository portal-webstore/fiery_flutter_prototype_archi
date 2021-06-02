import 'package:flutter/material.dart';
import 'package:form_input_helpers/form_input_helpers.dart' show validateEmpty;

/// To be replaced with functional patient query searcher **autocomplete**
/// dropdown
///
/// For selecting the realised Patient object with identifier and ocsLink
/// rather than a freely ad hoc-created Patient
///
class PatientDropdown extends StatelessWidget {
  const PatientDropdown({
    Key? key,
    required this.focusNode,
    required this.textEditingController,
    required this.onFieldSubmitted,
    required this.onSaved,
  }) : super(key: key);

  static const String getLabel = 'Search existing patient';
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
