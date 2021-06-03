import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_patient/molecules/molecules.dart'
    show
        PatientBirthDateField,
        PatientDropdown,
        PatientFirstNameField,
        PatientIdentifierField,
        PatientLastNameField;
import 'package:fiery_flutter_prototype_archi/shared/routes/routes.dart'
    show Routes;
import 'package:flutter/material.dart';

class AddPatientForm extends StatefulWidget {
  const AddPatientForm({
    Key? key,
  }) : super(key: key);

  @override
  _AddPatientFormState createState() => _AddPatientFormState();
}

class _AddPatientFormState extends State<AddPatientForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _patientIdentifierController =
      TextEditingController();
  final TextEditingController _patientLastNameController =
      TextEditingController();
  final TextEditingController _patientFirstNameController =
      TextEditingController();
  final TextEditingController _patientBirthDateController =
      TextEditingController();

  final FocusNode _patientIdentifierFocus = FocusNode();
  final FocusNode _patientLastNameFocus = FocusNode();
  final FocusNode _patientFirstNameFocus = FocusNode();
  final FocusNode _patientBirthDateFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PatientDropdown(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _patientIdentifierFocus,
            textEditingController: _patientIdentifierController,
          ),
          PatientIdentifierField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _patientIdentifierFocus,
            textEditingController: _patientIdentifierController,
          ),
          PatientLastNameField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _patientLastNameFocus,
            textEditingController: _patientLastNameController,
          ),
          PatientFirstNameField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _patientFirstNameFocus,
            textEditingController: _patientFirstNameController,
          ),
          PatientBirthDateField(
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
            focusNode: _patientBirthDateFocus,
            textEditingController: _patientBirthDateController,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                Routes.wizardAddTreatmentProductItem,
              );
            },
            child: const Text('Next'),
          )
        ],
      ),
    );
  }
}
