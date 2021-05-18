import 'package:drug_repository/drug_repository.dart' show Drug;
import 'package:order_repository/order_repository.dart'
    show DrugDose, ItemOrderStatusCode, PatientTreatmentProductItem;
import 'package:patient_repository/patient_repository.dart' show Patient;
import 'package:product_repository/product_repository.dart' show Product;

const List<PatientTreatmentProductItem> seedPatientTreatmentProducts = [
  PatientTreatmentProductItem(
    drugDoses: [
      DrugDose(
        drug: Drug(
          drugName: 'Rituximab',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
        dose: 640,
      ),
    ],
    patient: Patient(
      patientIdentifier: '1895',
      lastName: 'lastName',
      firstName: 'firstName',
      birthDate: '2000-12-31',
      patientOcsLink: -1,
    ),
    product: Product(
      productName: 'productName',
      drugs: [
        Drug(
          drugName: 'Rituximab',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
      ],
      diluentName: 'diluentName',
      containerName: 'containerName',
      containerCustomName: 'containerCustomName',
      containerVolume: 500,
      containerIsFixedFinalVolume: true,
      administrationRoute: 'IVINF',
      attachmentName: 'None',
      ocsProductLink: -1,
    ),
    quantity: 1,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
  PatientTreatmentProductItem(
    drugDoses: [
      DrugDose(
        drug: Drug(
          drugName: 'Rituximab',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
        dose: 5432,
      ),
    ],
    patient: Patient(
      patientIdentifier: '37352',
      lastName: 'McBlogs',
      firstName: 'Joan',
      birthDate: '2000-12-31',
      patientOcsLink: -1,
    ),
    product: Product(
      productName: 'productName',
      drugs: [
        Drug(
          drugName: 'Cytarabine',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
      ],
      diluentName: 'N/S',
      containerName: 'N/S 500mL Freeflex',
      containerCustomName: '',
      containerVolume: 500,
      containerIsFixedFinalVolume: true,
      administrationRoute: 'IVINF',
      attachmentName: 'None',
      ocsProductLink: -1,
    ),
    quantity: 1,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
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
      lastName: 'Blob',
      firstName: 'firstName T',
      birthDate: '2000-12-31',
      patientOcsLink: -1,
    ),
    product: Product(
      productName: 'productName',
      drugs: [
        Drug(
          drugName: 'Rituximab',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
      ],
      diluentName: 'N/S',
      containerName: '500mL Freeflex',
      containerCustomName: '',
      containerVolume: 500,
      containerIsFixedFinalVolume: true,
      administrationRoute: 'IVINF',
      attachmentName: 'None',
      ocsProductLink: -1,
    ),
    quantity: 1,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
  PatientTreatmentProductItem(
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
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
  PatientTreatmentProductItem(
    drugDoses: [
      DrugDose(
        drug: Drug(
          drugName: 'Cyclophosphamide',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
        dose: 1555,
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
      productName: 'Cyclophosphamide in N/S 500mL Freeflex',
      drugs: [
        Drug(
          drugName: 'Cyclophosphamide',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
      ],
      diluentName: 'N/S',
      containerName: 'N/S 500mL Freeflex',
      containerCustomName: '',
      containerVolume: 500,
      containerIsFixedFinalVolume: true,
      administrationRoute: 'IVINF',
      attachmentName: 'None',
      ocsProductLink: -1,
    ),
    quantity: 1,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
  PatientTreatmentProductItem(
    drugDoses: [
      DrugDose(
        drug: Drug(
          drugName: 'Cyclophosphamide',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
        dose: 389,
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
      productName: 'Cyclophosphamide in N/S 500mL Freeflex',
      drugs: [
        Drug(
          drugName: 'Cyclophosphamide',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
      ],
      diluentName: 'N/S',
      containerName: 'N/S 500mL Freeflex',
      containerCustomName: '',
      containerVolume: 500,
      containerIsFixedFinalVolume: true,
      administrationRoute: 'IVINF',
      attachmentName: 'None',
      ocsProductLink: -1,
    ),
    quantity: 4,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
  PatientTreatmentProductItem(
    drugDoses: [
      DrugDose(
        drug: Drug(
          drugName: 'Cytarabine',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
        dose: 70,
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
      productName: 'Cytarabine in Syringe',
      drugs: [
        Drug(
          drugName: 'Cytarabine',
          drugUnitsOfMeasurement: 'mg',
          ocsDrugLink: -1,
        ),
      ],
      diluentName: '',
      containerName: 'Syringe',
      containerCustomName: '',
      containerVolume: 500,
      containerIsFixedFinalVolume: false,
      administrationRoute: 'ITHEC',
      attachmentName: 'None',
      ocsProductLink: -1,
    ),
    quantity: 4,
    status: ItemOrderStatusCode.awaitingConfirmation,
  ),
];
