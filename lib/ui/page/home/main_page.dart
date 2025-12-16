import 'package:taskmanagement/ui/custom/drawer/drawerr.dart';

import '../../../core/path/path.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(),
      drawer: Drawerr(),

      body: BottomNavebar(
        pages: [NewTask(), CompletedTask(), CanceledTask(), ProgressTask()],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 70.h),
        child: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      ),
    );
  }
}
