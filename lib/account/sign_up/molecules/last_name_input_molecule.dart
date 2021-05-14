import 'package:fiery_flutter_prototype_archi/account/sign_up/cubits/sign_up_cubit.dart'
    show SignUpCubit, SignUpState;
import 'package:fiery_flutter_prototype_archi/account/sign_up/forms/signup_form_keys.dart'
    show SignUpFormKeys;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;

class LastNameInput extends StatelessWidget {
  const LastNameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.lastName != current.lastName,
      builder: (context, state) {
        return TextField(
          key: const Key(SignUpFormKeys.lastNameInputTextField),
          onChanged: (lastName) =>
              context.read<SignUpCubit>().lastNameChanged(lastName),
          decoration: InputDecoration(
            labelText: 'Last name',
            helperText: '',

            /// Poor Bloc sample UX spamming on last keystroke every change
            errorText: state.lastName.invalid
                ? 'Please check alphanumeric name input \n'
                : null,
          ),
        );
      },
    );
  }
}
