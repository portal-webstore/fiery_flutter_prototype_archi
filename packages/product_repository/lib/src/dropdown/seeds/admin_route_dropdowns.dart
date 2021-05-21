import 'package:product_repository/src/dropdown/models/admin_route_dropdown_model.dart'
    show AdminRouteDropdown;

/// Product administration routes for dropdown-assistive free text
const List<AdminRouteDropdown> adminRouteDropdowns = <AdminRouteDropdown>[
  AdminRouteDropdown(
    adminRouteCode: 'IVINF',
    adminRouteDescription: 'Intravenous Infusion',
    defaultDirectionsHeaderText: 'For IV infusion',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'IVBOL',
    adminRouteDescription: 'Intravenous Bolus',
    defaultDirectionsHeaderText: 'For intravenous use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'IVENOS',
    adminRouteDescription: 'Intravenous',
    defaultDirectionsHeaderText: 'For intravenous use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'IMUSC',
    adminRouteDescription: 'Intramuscular',
    defaultDirectionsHeaderText: 'For intramuscular use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'IPERI',
    adminRouteDescription: 'Intraperitoneal',
    defaultDirectionsHeaderText: 'For intraperitoneal use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'ITHEC',
    adminRouteDescription: 'Intrathecal',
    defaultDirectionsHeaderText: 'For intrathecal use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'IVESIC',
    adminRouteDescription: 'Intravesical',
    defaultDirectionsHeaderText: 'For intravesical use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'ORAL',
    adminRouteDescription: 'Oral',
    defaultDirectionsHeaderText: 'For oral use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'SCUTAN',
    adminRouteDescription: 'Subcutaneous',
    defaultDirectionsHeaderText: 'For subcutaneous use',
  ),
  AdminRouteDropdown(
    adminRouteCode: 'CONC',
    adminRouteDescription: 'Concentrate',
    defaultDirectionsHeaderText:
        'Concentrate (for further dilution prior to use)',
  ),
];
