part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginPageLoaded extends LoginEvent {
  @override
  List<Object> get props => [];
}

class AuthenticateEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
