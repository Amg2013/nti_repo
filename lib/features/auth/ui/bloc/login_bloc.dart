//1 event
// 2 states
// 3 bloc   // on<Event >((event, emit) async { emit(LoginLoading()); await Future.delayed(const Duration(seconds: 2)); emit(LoginSuccess()); });
// 4 provider and builder
// 5 ui  // context.read<LoginBloc>().add(LoginEventLoginButtonPressed(username: 'user', password: 'pass'));
//// 5 if (state is LoginLoading) { return CircularProgressIndicator(); }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_repo/features/auth/ui/bloc/login_events.dart';
import 'package:nti_repo/features/auth/ui/bloc/login_sates.dart';

class LoginBloc extends Bloc<LoginEvent, LoginSates> {
  LoginBloc(super.initialState) {
    //
    on<LoginWithCredentialsEvent>((event, emit) {
      emit(LoginLoadingState());

      if (event.email == 'test' && event.password == '123') {
        ///
        ///
        ///
        emit(LoginSuccessState(userId: '55555', userName: 'Test User'));
      } else {
        emit(LoginFailureState(errorMessage: 'Invalid email or password'));
      }
    });
    //
  }
}
