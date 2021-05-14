import 'package:fiery_flutter_prototype_archi/account/sign_up/cubits/sign_up_cubit.dart'
    show SignUpCubit, SignUpState;
import 'package:fiery_flutter_prototype_archi/account/sign_up/forms/signup_form_keys.dart'
    show SignUpFormKeys;
import 'package:fiery_flutter_prototype_archi/account/sign_up/molecules/first_name_input_molecule.dart'
    show FirstNameInput;
import 'package:fiery_flutter_prototype_archi/account/sign_up/molecules/last_name_input_molecule.dart'
    show LastNameInput;
import 'package:fiery_flutter_prototype_archi/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, ReadContext;
import 'package:formz/formz.dart' show FormzStatusX;

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          _showSnackText(
            context,
            'Sign up failure. \n' 'Please try again or email support',
          );
          return;
        }
        if (state.status.isSubmissionSuccess) {
          // Could micro-optimise pattern match or conditionals structures
          // const SnackBar for each state.

          _showSnackText(
            context,
            'Sign up success',
          );

          Navigator.of(context).push(
            HomeScreen.route(),
          );
          return;
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: FocusTraversalGroup(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _EmailInput(),
              const SizedBox(height: 8.0),
              const FirstNameInput(),
              const SizedBox(height: 8.0),
              const LastNameInput(),
              const SizedBox(height: 8.0),
              _PasswordInput(),
              const SizedBox(height: 8.0),
              _ConfirmPasswordInput(),
              const SizedBox(height: 8.0),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  ScaffoldMessengerState _showSnackText(
    BuildContext context,
    String snackText,
  ) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            snackText,
          ),
        ),
      );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key(SignUpFormKeys.emailInputTextField),
          onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            helperText: '',
            errorText: state.email.invalid ? 'Please check email format' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key(SignUpFormKeys.passwordInputTextField),
          onChanged: (password) =>
              context.read<SignUpCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            helperText: '',

            /// Poor Bloc sample UX spamming on first keystroke every change
            errorText: state.password.invalid
                ? 'Please check password \n'
                    'Case-sensitive alphanumeric + some special characters allowed \n'
                    'Eight character-minimum'
                : null,
          ),
        );
      },
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return TextField(
          key: const Key(SignUpFormKeys.confirmedPasswordInputTextField),
          onChanged: (confirmPassword) => context
              .read<SignUpCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm password',
            helperText: '',
            errorText: state.confirmedPassword.invalid
                ? 'Please check passwords match'
                : null,
          ),
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key(SignUpFormKeys.signupContinueButton),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  primary: Colors.orangeAccent,
                ),
                onPressed: state.status.isValidated
                    ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                    : null,
                child: const Text('Sign up'),
              );
      },
    );
  }
}
