import 'package:flutter_bloc/flutter_bloc.dart';
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
            context.pushReplacement("/login");
          }
        },
        child: Center(child: SvgPicture.asset("assets/logo.svg")),
      ),
    );
  }
}
