import 'package:fiery_flutter_prototype_archi/account/login/cubits/login_cubit.dart'
    show LoginCubit, LoginState;
import 'package:fiery_flutter_prototype_archi/account/login/forms/login_form_keys.dart';
import 'package:fiery_flutter_prototype_archi/account/login/molecules/login_button_molecule.dart';
import 'package:fiery_flutter_prototype_archi/account/sign_up/screens/sign_up_screen.dart'
    show SignUpScreen;
import 'package:fiery_flutter_prototype_archi/shared/widgets/logo/molecules/app_logo_image_banner_molecule.dart'
    show AppLogoImageBanner;
import 'package:fiery_flutter_prototype_archi/spacing/spacing.dart'
    show DeprioritisedLowerSpacer, InterSpacer, TopSpacer;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocBuilder, BlocListener, ReadContext;
import 'package:formz/formz.dart' show FormzStatusX;

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(
                  'Authentication Failure',
                ),
              ),
            );
        }
      },
      child: Align(
        // - FIXME: MAGIC NUMBERS IN SAMPLE CODE
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogoImageBanner(),
              const TopSpacer(),
              _EmailInput(),
              const InterSpacer(),
              _PasswordInput(),
              const InterSpacer(),
              _LoginButton(),
              const DeprioritisedLowerSpacer(),
              _SignUpButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key(LoginFormKeys.emailInputTextField),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'email',
            helperText: '',
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key(LoginFormKeys.passwordInputTextField),
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            helperText: '',
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return loginLoadingButton(state, context);
      },
    );
  }

  /// Deter duplicate fires by presenting a loading spinner while in progress.
  Widget loginLoadingButton(LoginState state, BuildContext context) {
    return state.status.isSubmissionInProgress
        ? const CircularProgressIndicator()
        : LoginButton(
            onPressed: state.status.isValidated
                ? () => context.read<LoginCubit>().logInWithCredentials()
                : null,
          );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      key: const Key(LoginFormKeys.createAccountButton),
      onPressed: () => Navigator.of(context).push<void>(SignUpScreen.route()),
      child: Text(
        'CREATE ACCOUNT',
        style: TextStyle(color: theme.primaryColor),
      ),
    );
  }
}
