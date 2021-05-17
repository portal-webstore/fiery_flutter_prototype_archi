import 'package:drug_repository/drug_repository.dart';
import 'package:order_repository/order_repository.dart';
import 'package:product_repository/product_repository.dart';

const List<PatientTreatmentProductItem> seedPatientTreatmentProducts = [
  PatientTreatmentProductItem(
    drugDoses: [
      DrugDose(
        drug: Drug(
          drugName: 'Rituximab',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
        dose: 700,
      ),
    ],
    patient: Patient(
        patientIdentifier: '1895',
        lastName: 'lastName',
        firstName: 'firstName',
        birthDate: '2000-12-31',
        patientOcsLink: -1),
    product: Product(
        productName: 'productName',
        drugs: [
          Drug(
            drugName: 'Rituximab',
            drugUnitsOfMeasurement: 'mg',
            ocsDrugLink: -1,
          )
        ],
        diluentName: 'diluentName',
        containerName: 'containerName',
        containerCustomName: 'containerCustomName',
        containerVolume: 500,
        containerIsFixedFinalVolume: true,
        administrationRoute: 'IVINF',
        attachmentName: 'None',
        ocsProductLink: -1),
    quantity: 1,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
];
