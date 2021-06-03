import 'package:drug_repository/drug_repository.dart' show Drug;
import 'package:order_repository/order_repository.dart'
    show DrugDose, ItemOrderStatusCode, PatientTreatmentProductItem;
import 'package:patient_repository/patient_repository.dart' show Patient;
import 'package:product_repository/product_repository.dart' show Product;

/// Taken from [patient_treatment_products_seed]
const mockDataPatientTreatmentFillerSeed = PatientTreatmentProductItem(
  drugDoses: [
    DrugDose(
      drug: Drug(
        drugName: 'Doxorubicin',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
      dose: 76,
    ),
    DrugDose(
      drug: Drug(
        drugName: 'Vincristine',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
      dose: 2,
    ),
  ],
  patient: Patient(
    patientIdentifier: '568544',
    lastName: 'van der Waals',
    firstName: 'firstName',
    birthDate: '2000-12-31',
    patientOcsLink: -1,
  ),
  product: Product(
    productName: 'Doxorubicin / Vincristine in N/S Surefuser 500mL 7 day',
    drugs: [
      Drug(
        drugName: 'Doxorubicin',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
      Drug(
        drugName: 'Vincristine',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
    ],
    diluentName: 'N/S',
    containerName: 'Surefuser',
    containerCustomName: 'Surefuser 500mL 7 day',
    containerVolume: 500,
    containerIsFixedFinalVolume: true,
    administrationRoute: 'IVINF',
    attachmentName: 'None',
    ocsProductLink: -1,
  ),
  quantity: 1,
  status: ItemOrderStatusCode.pendingReviewNotReviewedYet,
);
