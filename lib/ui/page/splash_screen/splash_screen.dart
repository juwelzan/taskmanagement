import '../../../core/path/path.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Center(child: SvgPicture.asset("assets/logo.svg")),
    );
  }
}
