import 'package:drug_repository/drug_repository.dart' show Drug;
import 'package:flutter/material.dart';
import 'package:form_input_helpers/form_input_helpers.dart'
    show allowTwoDecimalPlacesInput, doseInputValidator;

class DoseField extends StatelessWidget {
  const DoseField({
    Key? key,
    required this.drug,
    required this.onFieldSubmitted,
    required this.onSaved,
    required this.focusNode,
    required this.textEditingController,
  }) : super(key: key);

  final Drug drug;

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function(String?) onFieldSubmitted;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: _getDrugDoseLabel,
        helperText: '',
      ),
      focusNode: focusNode,
      controller: textEditingController,
      inputFormatters: [
        allowTwoDecimalPlacesInput,
      ],
      validator: doseInputValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      textInputAction: TextInputAction.next,
    );
  }

  String get _getDrugDoseLabel =>
      '${drug.drugName} dose ' '(${drug.drugUnitsOfMeasurement})';
}
