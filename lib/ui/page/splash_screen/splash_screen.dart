import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/spash_controller/bloc/splash_bloc.dart';
import 'package:taskmanagement/controller/spash_controller/bloc/splash_state.dart';

import '../../../core/path/path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.splashEnd) {
            context.read<ApiRequestBloc>().add(InternetStatusEvent());
          }
        },
        child: Center(child: Lottie.asset("assets/Task-Loader.json")),
      ),
    );
  }
}
