// ignore_for_file: use_build_context_synchronously

import '../../../core/path/path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   context.read<InternetCheker>().startListening();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Center(child: Lottie.asset("assets/Task-Loader.json")),
    );
  }
}
