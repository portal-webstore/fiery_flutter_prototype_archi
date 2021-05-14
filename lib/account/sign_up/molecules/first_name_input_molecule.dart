import 'package:fiery_flutter_prototype_archi/account/sign_up/cubits/sign_up_cubit.dart'
    show SignUpCubit, SignUpState;
import 'package:fiery_flutter_prototype_archi/account/sign_up/forms/signup_form_keys.dart'
    show SignUpFormKeys;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

class FirstNameInput extends StatelessWidget {
  const FirstNameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.firstName != current.firstName,
      builder: (context, state) {
        return TextField(
          key: const Key(SignUpFormKeys.firstNameInputTextField),
          onChanged: (firstName) =>
              context.read<SignUpCubit>().firstNameChanged(firstName),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'First name',
            helperText: '',

            /// Poor Bloc sample UX spamming on first keystroke every change
            errorText: state.firstName.invalid
                ? 'Please check alphanumeric name input \n'
                : null,
          ),
        );
      },
    );
  }
}
