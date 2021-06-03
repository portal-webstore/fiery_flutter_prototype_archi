import 'package:drug_repository/drug_repository.dart' show Drug;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/forms/hard_coded_mock_form_data_seed.dart'
    show mockDataPatientTreatmentFillerSeed;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/molecules/dropdowns/administration_route_dropdown.dart'
    show AdministrationRouteDropdown;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/molecules/dropdowns/container_dropdown.dart'
    show ContainerDropdown;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/molecules/dropdowns/diluent_dropdown.dart'
    show DiluentDropdown;
import 'package:fiery_flutter_prototype_archi/order/create_order_wizard/add_treatment_product_item/molecules/dropdowns/dongle_dropdown.dart'
    show DongleDropdown;
import 'package:fiery_flutter_prototype_archi/shared/routes/routes.dart'
    show Routes;
import 'package:flutter/material.dart';
import 'package:form_input_helpers/form_input_helpers.dart' show validateEmpty;
import 'package:order_repository/order_repository.dart'
    show
        DrugDose,
        ItemOrderStatusCode,
        PatientTreatmentProductItem,
        DrugDoseDescription;

const PatientTreatmentProductItem mockData = mockDataPatientTreatmentFillerSeed;

class AddTreatmentProductItemForm extends StatefulWidget {
  const AddTreatmentProductItemForm({
    Key? key,
  }) : super(key: key);

  @override
  _AddTreatmentProductItemFormState createState() =>
      _AddTreatmentProductItemFormState();
}

class _AddTreatmentProductItemFormState
    extends State<AddTreatmentProductItemForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  /// Hard-coded for easy reuse.
  /// Otherwise we can regenerate on product selection
  ///
  /// These could alternatively be handled within the [DrugDoseFields] Widget
  /// and only require a callback stream of the valid drug dose values
  final List<FocusNode> _drugDosesFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  final List<FocusNode> _drugFocusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  /// Hard-coded for easy reuse.
  /// Otherwise we can regenerate on product selection
  ///
  /// These could alternatively be handled within the [DrugDoseFields] Widget
  /// and only require a callback stream of the valid drug dose values
  ///
  final List<TextEditingController> _drugDosesControllers = [
    TextEditingController(text: '76'),
    TextEditingController(text: '2'),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  final List<TextEditingController> _drugControllers = [
    TextEditingController(
      text: mockData.product.drugs[0].drugName,
    ),
    TextEditingController(
      text: mockData.product.drugs[1].drugName,
    ),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  final TextEditingController _drugController = TextEditingController();

  final TextEditingController _diluentController = TextEditingController(
    text: mockData.product.diluentName,
  );
  final TextEditingController _containerController = TextEditingController(
    text: mockData.product.containerCustomName,
  );
  final TextEditingController _volumeController = TextEditingController(
    text: '${mockData.product.containerVolume}',
  );
  final TextEditingController _adminRouteController = TextEditingController(
    text: mockData.product.administrationRoute,
  );
  final TextEditingController _dongleController = TextEditingController();

  final FocusNode _drugFocus = FocusNode();

  final FocusNode _diluentFocus = FocusNode();
  final FocusNode _containerFocus = FocusNode();
  final FocusNode _volumeFocus = FocusNode();
  final FocusNode _adminRouteFocus = FocusNode();
  final FocusNode _dongleFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Drug 1',
              helperText: '',
            ),
            focusNode: _drugFocusNodes[0],
            controller: _drugControllers[0],
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: _getDoseLabel(
                mockData.product.drugs[0],
              ),
              helperText: '',
            ),
            focusNode: _drugDosesFocusNodes[0],
            controller: _drugDosesControllers[0],
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Drug 2',
              helperText: '',
            ),
            focusNode: _drugFocusNodes[1],
            controller: _drugControllers[1],
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: _getDoseLabel(
                mockData.product.drugs[1],
              ),
              helperText: '',
            ),
            focusNode: _drugDosesFocusNodes[1],
            controller: _drugDosesControllers[1],
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Drug 3',
              helperText: '',
            ),
            focusNode: _drugFocusNodes[2],
            controller: _drugControllers[2],
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              labelText: _getDoseLabel(
                mockData.product.drugs[0],
              ),
              helperText: '',
            ),
            focusNode: _drugDosesFocusNodes[2],
            controller: _drugDosesControllers[2],
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          DiluentDropdown(
            focusNode: _diluentFocus,
            textEditingController: _diluentController,
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
          ),
          ContainerDropdown(
            focusNode: _containerFocus,
            textEditingController: _containerController,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Volume',
              helperText: '',
            ),
            focusNode: _volumeFocus,
            controller: _volumeController,
            validator: validateEmpty,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
            textInputAction: TextInputAction.next,
          ),
          AdministrationRouteDropdown(
            focusNode: _adminRouteFocus,
            textEditingController: _adminRouteController,
            onFieldSubmitted: (String? input) {
              return;
            },
            onSaved: (String? input) {
              return;
            },
          ),
          DongleDropdown(
            focusNode: _dongleFocus,
            textEditingController: _dongleController,
            onFieldSubmitted: (String? input) {},
            onSaved: (String? input) {},
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                Routes.wizardReviewAddChoice,
              );
            },
            child: const Text('Review/Continue'),
          )
        ],
      ),
    );
  }

  static String _getDoseLabel(Drug drug) =>
      'Dose (${drug.drugUnitsOfMeasurement})';
}
