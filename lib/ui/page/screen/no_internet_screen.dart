import 'package:lottie/lottie.dart';
import 'package:taskmanagement/core/path/path.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Center(child: Lottie.asset("assets/No-Internet!.json")),
      ),
    );
  }
}
