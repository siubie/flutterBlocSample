import 'package:bloc/bloc.dart';
import 'package:demo/services/authentication_service.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationService _authenticationService;

  LoginBloc(this._authenticationService) : super(LoginInitial()) {
    on<LoginPageLoaded>((event, emit) {
      emit(LoginInitial());
    });

    on<AuthenticateEvent>((event, emit) async {
      emit(LoginInProgress());
      final login = await _authenticationService.login();
      print(login);
      if (login.status == "Success") {
        emit(LoginAuthenticated(login.data.token));
      } else {
        emit(LoginFailed());
      }
    });
  }
}
