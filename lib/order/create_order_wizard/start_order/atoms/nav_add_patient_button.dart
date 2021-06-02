import 'package:fiery_flutter_prototype_archi/shared/routes/routes.dart'
    show Routes;
import 'package:flutter/material.dart';

class NavAddPatientButton extends StatelessWidget {
  const NavAddPatientButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(
          Routes.wizardAddPatient,
        );
      },
      child: const Text('Next'),
    );
  }
}
