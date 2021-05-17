import 'package:drug_repository/drug_repository.dart';
import 'package:product_repository/product_repository.dart';

const List<Product> seedProducts = [
  Product(
    productName: 'Pralatrexate - Syringe',
    containerName: 'Syringe', // 20mL
    administrationRoute: 'IVINF',
    attachmentName: 'None',
    containerCustomName: '',
    containerIsFixedFinalVolume: false,
    containerVolume: 500,
    diluentName: 'N/S',
    ocsProductLink: -1,
    drugs: [
      Drug(
        drugName: 'Pralatrexate',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
    ],
  ),
  Product(
    productName: 'Pembrolizumab N/S 50mL Freeflex',
    containerName: 'N/S 50mL Freeflex', // 127mL
    attachmentName: 'None',
    containerIsFixedFinalVolume: false,
    containerVolume: 50,
    diluentName: 'N/S',
    containerCustomName: '',
    drugs: [
      Drug(
        drugName: 'Pembrolizumab',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
    ],
    administrationRoute: 'IVENOS',
    ocsProductLink: -1,
  ),
  Product(
    productName: 'Pembrolizumab N/S 100mL Freeflex',
    containerName: 'N/S 100mL Freeflex', // 198mL
    attachmentName: 'None',
    containerIsFixedFinalVolume: false,
    containerVolume: 100,
    diluentName: 'N/S',
    containerCustomName: '',
    drugs: [
      Drug(
        drugName: 'Pembrolizumab',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
    ],
    administrationRoute: 'IVENOS',
    ocsProductLink: -1,
  ),
  Product(
    productName: 'Doxorubicin / Vincristine / Etoposide (E/phos br) - '
        '24-hour Surefuser, Surefuser 250mL 1 day',
    containerName: '24-hour Surefuser, Surefuser 250mL 1 day', // 241mL
    attachmentName: 'None',
    containerIsFixedFinalVolume: true,
    containerVolume: 250,
    diluentName: 'N/S',
    containerCustomName: '',
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
      Drug(
        drugName: 'Etoposide (E/phos br)',
        drugUnitsOfMeasurement: 'mg',
        ocsDrugLink: -1,
      ),
    ],
    administrationRoute: 'IVINF',
    ocsProductLink: -1,
  ),
];
