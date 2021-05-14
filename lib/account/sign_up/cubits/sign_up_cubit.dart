import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository;
import 'package:bloc/bloc.dart' show Cubit;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:formz/formz.dart' show Formz, FormzStatus, FormzStatusX;
import 'package:formz_inputs/formz_inputs.dart'
    show
        ConfirmedPasswordFormzInput,
        EmailFormzInput,
        FirstNameFormzInput,
        LastNameFormzInput,
        PasswordFormzInput;

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(
    this._firebaseAuthenticationRepository,
  ) : super(const SignUpState());

  final FirebaseAuthenticationRepository _firebaseAuthenticationRepository;

  void emailChanged(String value) {
    final email = EmailFormzInput.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([
        email,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void firstNameChanged(String value) {
    final FirstNameFormzInput firstName = FirstNameFormzInput.dirty(value);
    emit(state.copyWith(
      firstName: firstName,
      status: Formz.validate([
        state.email,
        firstName,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void lastNameChanged(String value) {
    final LastNameFormzInput lastName = LastNameFormzInput.dirty(value);
    emit(state.copyWith(
      lastName: lastName,
      status: Formz.validate([
        state.email,
        state.firstName,
        lastName,
        state.password,
        state.confirmedPassword,
      ]),
    ));
  }

  void passwordChanged(String value) {
    final password = PasswordFormzInput.dirty(value);
    final confirmedPassword = ConfirmedPasswordFormzInput.dirty(
      password: password.value,
      value: state.confirmedPassword.value,
    );
    emit(state.copyWith(
      password: password,
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        state.firstName,
        state.lastName,
        password,
        state.confirmedPassword,
      ]),
    ));
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPasswordFormzInput.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmedPassword: confirmedPassword,
      status: Formz.validate([
        state.email,
        state.firstName,
        state.lastName,
        state.password,
        confirmedPassword,
      ]),
    ));
  }

  Future<void> signUpFormSubmitted() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _firebaseAuthenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
        displayName: '${state.firstName.value} ${state.lastName.value}',
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
