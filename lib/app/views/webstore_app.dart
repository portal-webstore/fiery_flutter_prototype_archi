import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository;
import 'package:fiery_flutter_prototype_archi/app/blocs/app_bloc.dart'
    show AppBloc;
import 'package:fiery_flutter_prototype_archi/app/views/webstore_app_view.dart'
    show AppView;
import 'package:flutter/material.dart'
    show BuildContext, Key, StatelessWidget, Widget;
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, RepositoryProvider;

class WebstoreApp extends StatelessWidget {
  const WebstoreApp({
    Key? key,
    required FirebaseAuthenticationRepository authenticationRepository,
  })   : _authenticationRepository = authenticationRepository,
        super(key: key);

  final FirebaseAuthenticationRepository _authenticationRepository;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AppBloc(
          firebaseAuthenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}
