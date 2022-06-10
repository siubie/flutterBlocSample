part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

//tampilan pas mau login ada form nya
class LoginInitial extends LoginState {}

//tampilan pas udah authenticated
class LoginAuthenticated extends LoginState {
  final String email;

  const LoginAuthenticated(this.email);

  @override
  List<Object> get props => ['email'];
}

//tampilan pas authentikasi gagal
class LoginFailed extends LoginState {}

//tampilan pas login lagi loading
class LoginInProgress extends LoginState {}
