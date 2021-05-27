import 'package:fiery_flutter_prototype_archi/order/review_historical_order/molecules/patient_treatment_product_list_item.dart'
    show PatientTreatmentProductListItem;
import 'package:fiery_flutter_prototype_archi/order/review_historical_order/seeds/patient_treatment_products_seed.dart'
    show seedPatientTreatmentProducts;
import 'package:fiery_flutter_prototype_archi/shared/drawer/drawer.dart'
    show SideMenuNavigationDrawer;
import 'package:flutter/material.dart';
import 'package:order_repository/order_repository.dart'
    show
        FirebaseOrderRepository,
        OrderRepository,
        Order,
        PatientTreatmentProductItem,
        ProductDescription;
import 'package:patient_repository/patient_repository.dart'
    show Patient, PatientBirthDateAustralian;

/// Review the multiple patients + products within a single consolidated order
class ReviewHistoricalOrderScreen extends StatefulWidget {
  const ReviewHistoricalOrderScreen({
    Key? key,
  }) : super(key: key);

  static const title = 'Review ordered patient treatments';

  static Page page() =>
      const MaterialPage<void>(child: ReviewHistoricalOrderScreen());

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ReviewHistoricalOrderScreen(),
    );
  }

  @override
  _ReviewHistoricalOrderScreenState createState() =>
      _ReviewHistoricalOrderScreenState();
}

class _ReviewHistoricalOrderScreenState
    extends State<ReviewHistoricalOrderScreen> {
  late final OrderRepository _orderRepository;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _load() {
    const String clinicID = 'TEST';
    _orderRepository = FirebaseOrderRepository(
      clinicID: clinicID,
    );

    _orderRepository
        .addNewOrder(
          Order(
            orderID: '',
            orderReference: 'orderReference free text',
            createdAt: DateTime.now().millisecondsSinceEpoch,
            updatedAt: DateTime.now().millisecondsSinceEpoch,
            requiredByDeliveryDate: '2021-05-20',
            comments: 'comments',
            isDraft: true,
            patientTreatmentProductItems: seedPatientTreatmentProducts,
          ),
        )
        .onError((error, stackTrace) => print)
        .catchError(
      () {
        print('add new order error');
      },
    ).then((value) {
      print('wahoo order added');
    });

    _orderRepository.orders().listen((
      List<Order> orders,
    ) {
      print('orders found and parsed');
      print(orders.toString());
    }).onError((
      Object err,
      StackTrace stackTrace,
    ) {
      print('err listening to orders');
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ReviewHistoricalOrderScreen.title,
        ),
        actions: const <Widget>[],
      ),
      drawer: const SideMenuNavigationDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          const PatientTreatmentProductListItem(
            treatmentProductStatusCode: 'Awaiting confirmation',
            patientNameTitleLine: 'McBlogs, Joan (31/12/1900) 1293123',
            multiProductAndQuantityContentLines:
                'Qty: 1; 1prod Test, test test test tet test setestset es tsets \n'
                'Qty: 1; 2prod adae in dextr test test test',
          ),
          const PatientTreatmentProductListItem(
            treatmentProductStatusCode: 'Awaiting confirmation',
            patientNameTitleLine: 'McJoe, Blob (31/01/1960) 64754',
            multiProductAndQuantityContentLines:
                'Qty: 1; 1mg Pralatrexate in Syringe, ',
          ),
          const PatientTreatmentProductListItem(
            treatmentProductStatusCode: 'Awaiting confirmation',
            patientNameTitleLine: 'McBlob, Jane (01/01/1960) 45712',
            multiProductAndQuantityContentLines:
                'Qty: 2; 5460mg Cytarabine in N/S 500mL Freeflex, IVINF',
          ),
          const PatientTreatmentProductListItem(
            treatmentProductStatusCode: 'Awaiting confirmation',
            patientNameTitleLine: 'Soup, Rock (01/01/1901) 984374',
            multiProductAndQuantityContentLines:
                'Qty: 1; 700mg Rituximab in N/S 500mL Freeflex, IVINF \n'
                'Qty: 1; Doxorubicin 76mg; Vincristine 2mg in N/S Surefuser 500mL 7-day, IVINF \n'
                'Qty: 1; 1555mg Cyclophosphamide in N/S 500mL Freeflex, IVINF \n'
                'Qty: 4; 389mg Cyclophosphamide in N/S 500mL Freeflex, IVINF \n'
                'Qty: 2; 70mg Cytarabine in Syringe, ITHEC \n',
          ),
          ..._getSeedListItems(),
        ],
      ),
    );
  }

  List<Widget> _getSeedListItems() {
    final List<ListItemAdaptedFromPatientTreatmentProduct> listItems =
        seedPatientTreatmentProducts
            .map(
              (
                PatientTreatmentProductItem e,
              ) =>
                  ListItemAdaptedFromPatientTreatmentProduct(
                patientTreatmentProductItem: e,
              ),
            )
            .toList();

    return listItems;
  }
}

class ListItemAdaptedFromPatientTreatmentProduct extends StatelessWidget {
  const ListItemAdaptedFromPatientTreatmentProduct({
    Key? key,
    required this.patientTreatmentProductItem,
  }) : super(key: key);

  final PatientTreatmentProductItem patientTreatmentProductItem;
  @override
  Widget build(BuildContext context) {
    return PatientTreatmentProductListItem(
      treatmentProductStatusCode: patientTreatmentProductItem.status,
      patientNameTitleLine:
          patientTreatmentProductItem.patient.getNameTextFromPatient(),
      multiProductAndQuantityContentLines:
          patientTreatmentProductItem.getQuantifiedDosedProductText(),
    );
  }
}
