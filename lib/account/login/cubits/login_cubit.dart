import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository;
import 'package:bloc/bloc.dart' show Cubit;
import 'package:equatable/equatable.dart' show Equatable;
import 'package:formz/formz.dart' show Formz, FormzStatus, FormzStatusX;
import 'package:formz_inputs/formz_inputs.dart'
    show EmailFormzInput, PasswordFormzInput;

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._firebaseAuthenticationRepository)
      : super(const LoginState());

  final FirebaseAuthenticationRepository _firebaseAuthenticationRepository;

  void emailChanged(String value) {
    final email = EmailFormzInput.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate(
          [email, state.password],
        ),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = PasswordFormzInput.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
          [
            state.email,
            password,
          ],
        ),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _firebaseAuthenticationRepository.logIn(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(
          status: FormzStatus.submissionSuccess,
        ),
      );
    } on Exception {
      /// Code smelly
      /// Why did we create custom exceptions if we simply catch-all
      emit(
        state.copyWith(
          status: FormzStatus.submissionFailure,
        ),
      );
    }
  }
}
