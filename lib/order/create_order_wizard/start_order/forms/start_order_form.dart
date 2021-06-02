import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/atoms/nav_add_patient_button.dart'
    show NavAddPatientButton;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/molecules/order_comments_field_widget.dart'
    show OrderCommentsField;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/molecules/order_reference_field_widget.dart'
    show OrderReferenceField;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/start_order/molecules/order_required_by_delivery_date_field_widget.dart'
    show OrderRequiredByDeliveryDateField;
import 'package:flutter/material.dart';

/// Required date
/// initial notes
class StartOrderForm extends StatefulWidget {
  const StartOrderForm({
    Key? key,
  }) : super(key: key);

  @override
  _StartOrderFormState createState() => _StartOrderFormState();
}

class _StartOrderFormState extends State<StartOrderForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _orderReferenceController =
      TextEditingController();
  final TextEditingController _orderRequiredByDeliveryDateController =
      TextEditingController();
  final TextEditingController _orderCommentsController =
      TextEditingController();

  final FocusNode _orderReferenceFocus = FocusNode();
  final FocusNode _orderRequiredByDeliveryDateFocus = FocusNode();
  final FocusNode _orderCommentsFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OrderReferenceField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _orderReferenceFocus,
            textEditingController: _orderReferenceController,
          ),
          OrderRequiredByDeliveryDateField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _orderRequiredByDeliveryDateFocus,
            textEditingController: _orderRequiredByDeliveryDateController,
          ),
          OrderCommentsField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _orderCommentsFocus,
            textEditingController: _orderCommentsController,
          ),
          const NavAddPatientButton(),
        ],
      ),
    );
  }
}
