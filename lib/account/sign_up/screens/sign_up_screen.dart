import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository;
import 'package:fiery_flutter_prototype_archi/account/sign_up/cubits/sign_up_cubit.dart'
    show SignUpCubit;
import 'package:fiery_flutter_prototype_archi/account/sign_up/forms/sign_up_form.dart'
    show SignUpForm;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, ReadContext;

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(
            context.read<FirebaseAuthenticationRepository>(),
          ),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
