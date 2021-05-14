part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailFormzInput.pure(),
    this.password = const PasswordFormzInput.pure(),
    this.status = FormzStatus.pure,
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final FormzStatus status;

  @override
  List<Object> get props => [email, password, status];

  LoginState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    FormzStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
