import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository;
import 'package:fiery_flutter_prototype_archi/account/login/cubits/login_cubit.dart'
    show LoginCubit;
import 'package:fiery_flutter_prototype_archi/account/login/forms/login_form.dart'
    show LoginForm;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, ReadContext;

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(
            context.read<FirebaseAuthenticationRepository>(),
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
