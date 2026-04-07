class LoginEvent {}

class LoginWithCredentialsEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithCredentialsEvent({required this.email, required this.password});
}

class LoginWithGoogleEvent extends LoginEvent {}

class ForgotPasswordEvent extends LoginEvent {
  final String email;

  ForgotPasswordEvent({required this.email});
}
