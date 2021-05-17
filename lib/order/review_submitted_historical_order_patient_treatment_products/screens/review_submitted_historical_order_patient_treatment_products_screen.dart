import 'package:fiery_flutter_prototype_archi/order/review_submitted_historical_order_patient_treatment_products/molecules/patient_treatment_product_list_item.dart'
    show PatientTreatmentProductListItem;
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';

/// Review the multiple patients + products within a single consolidated order
class ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreen
    extends StatefulWidget {
  const ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Review ordered patient treatments';

  static Page page() => const MaterialPage<void>(
      child: ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) =>
          const ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreen(),
    );
  }

  @override
  _ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreenState
      createState() =>
          _ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreenState();
}

class _ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreenState
    extends State<
        ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ReviewSubmittedHistoricalOrderPatientTreatmentProductsScreen.title,
        ),
        actions: const <Widget>[],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: const <Widget>[
          PatientTreatmentProductListItem(
            treatmentProductStatus: 'Awaiting confirmation',
            patientNameTitleLine: 'McBlogs, Joan (31/12/1900) 1293123',
            multiProductAndQuantityContentLines:
                'Qty: 1; 1prod Test, test test test tet test setestset es tsets \n'
                'Qty: 1; 2prod adae in dextr test test test',
          ),
          PatientTreatmentProductListItem(
            treatmentProductStatus: 'Awaiting confirmation',
            patientNameTitleLine: 'McJoe, Blob (31/01/1960) 64754',
            multiProductAndQuantityContentLines:
                'Qty: 1; 1mg Pralatrexate in Syringe, ',
          ),
          PatientTreatmentProductListItem(
            treatmentProductStatus: 'Awaiting confirmation',
            patientNameTitleLine: 'McBlob, Jane (01/01/1960) 45712',
            multiProductAndQuantityContentLines:
                'Qty: 2; 5460mg Cytarabine in N/S 500mL Freeflex, IVINF',
          ),
          PatientTreatmentProductListItem(
            treatmentProductStatus: 'Awaiting confirmation',
            patientNameTitleLine: 'Soup, Rock (01/01/1901) 984374',
            multiProductAndQuantityContentLines:
                'Qty: 1; 700mg Rituximab in N/S 500mL Freeflex, IVINF \n'
                'Qty: 1; Doxorubicin 76mg; Vincristine 2mg in N/S Surefuser 500mL 7-day, IVINF \n'
                'Qty: 1; 1555mg Cyclophosphamide in N/S 500mL Freeflex, IVINF \n'
                'Qty: 4; 389mg Cyclophosphamide in N/S 500mL Freeflex, IVINF \n'
                'Qty: 2; 70mg Cytarabine in Syringe, ITHEC \n',
          ),
        ],
      ),
    );
  }
}
