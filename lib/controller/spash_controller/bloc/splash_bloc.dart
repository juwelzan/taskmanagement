import 'package:bloc/bloc.dart';
import 'package:taskmanagement/controller/spash_controller/bloc/splash_event.dart';
import 'package:taskmanagement/controller/spash_controller/bloc/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    on<StartSplash>((event, emit) async {
      await Future.delayed(Duration(seconds: 5), () {
        add(EndSplash());
      });
    });
    on<EndSplash>((event, emit) {
      emit(state.copyWith(splashEnd: true));
    });
  }
}
