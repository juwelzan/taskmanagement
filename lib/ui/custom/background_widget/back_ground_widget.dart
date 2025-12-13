import '../../../core/path/path.dart';

class BackGroundWidget extends StatelessWidget {
  final Widget? child;
  const BackGroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset("assets/background.svg", fit: BoxFit.cover),
          ),
          ?child,
        ],
      ),
    );
  }
}
