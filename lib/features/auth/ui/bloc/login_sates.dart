class LoginSates {}

class LoginInitialState extends LoginSates {}

class LoginLoadingState extends LoginSates {}

class LoginSuccessState extends LoginSates {
  final String userId;
  final String userName;

  LoginSuccessState({required this.userId, required this.userName});
}

class LoginFailureState extends LoginSates {
  final String errorMessage;

  LoginFailureState({required this.errorMessage});
}
