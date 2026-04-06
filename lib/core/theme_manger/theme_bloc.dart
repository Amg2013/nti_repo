import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_repo/core/theme_manger/theme_event.dart';
import 'package:nti_repo/core/theme_manger/theme_states.dart';

class ThemeManagerBloc extends Bloc<ThemeEvent, ThemeStates> {
  ThemeManagerBloc() : super(LightModeState()) {
    on<LightModeEvent>((event, emit) {


      emit(LightModeState());
    });
  }


}
