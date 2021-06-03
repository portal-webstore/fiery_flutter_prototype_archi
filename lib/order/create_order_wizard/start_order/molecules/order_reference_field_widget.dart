import 'package:flutter/material.dart';
import 'package:form_input_helpers/form_input_helpers.dart' show validateEmpty;

class OrderReferenceField extends StatelessWidget {
  const OrderReferenceField({
    Key? key,
    required this.onFieldSubmitted,
    required this.onSaved,
    required this.focusNode,
    required this.textEditingController,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function(String?) onFieldSubmitted;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
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

  static String get getLabel {
    return 'Order reference';
  }
}
