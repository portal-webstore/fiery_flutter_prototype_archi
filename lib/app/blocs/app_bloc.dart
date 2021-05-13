import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart'
    show FirebaseAuthenticationRepository, User;
import 'package:bloc/bloc.dart' show Bloc;
import 'package:equatable/equatable.dart' show Equatable;

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required FirebaseAuthenticationRepository firebaseAuthenticationRepository,
  })   : _firebaseAuthenticationRepository = firebaseAuthenticationRepository,
        super(
          firebaseAuthenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(
                  firebaseAuthenticationRepository.currentUser,
                )
              : const AppState.unauthenticated(),
        ) {
    _userSubscription = _firebaseAuthenticationRepository.user.listen(
      _onUserChanged,
    );
  }

  final FirebaseAuthenticationRepository _firebaseAuthenticationRepository;
  late final StreamSubscription<User> _userSubscription;

  void _onUserChanged(User user) {
    add(
      AppUserChanged(
        user,
      ),
    );
  }

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    /// async* is there any issue in using yield + return
    /// compared to yield else
    /// does yield need to keep going
    /// performance
    if (event is AppUserChanged) {
      yield _mapUserChangedToState(event, state);
    } else if (event is AppLogoutRequested) {
      // ignore: unawaited_futures
      _firebaseAuthenticationRepository.logOut();
    }
  }

  AppState _mapUserChangedToState(
    AppUserChanged event,
    AppState state,
  ) {
    if (event.user.isEmpty) {
      return const AppState.unauthenticated();
    }

    return AppState.authenticated(
      event.user,
    );
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
