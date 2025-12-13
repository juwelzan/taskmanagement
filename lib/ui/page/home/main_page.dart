import '../../../core/path/path.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(),

      body: BottomNavebar(
        pages: [NewTask(), CompletedTask(), CanceledTask(), ProgressTask()],
      ),
    );
  }
}
