part of 'sign_up_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailFormzInput.pure(),
    this.password = const PasswordFormzInput.pure(),
    this.confirmedPassword = const ConfirmedPasswordFormzInput.pure(),
    this.status = FormzStatus.pure,
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final ConfirmedPasswordFormzInput confirmedPassword;
  final FormzStatus status;

  @override
  List<Object> get props => [email, password, confirmedPassword, status];

  SignUpState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    ConfirmedPasswordFormzInput? confirmedPassword,
    FormzStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      status: status ?? this.status,
    );
  }
}
