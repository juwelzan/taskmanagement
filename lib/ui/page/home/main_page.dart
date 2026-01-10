// ignore_for_file: prefer_final_fields, must_be_immutable

import '../../../core/path/path.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppsBar(dowerOpen: () => _scaffoldKey.currentState?.openDrawer()),
      drawer: Drawerr(),

      body: BottomNavebar(
        pages: [NewTask(), CompletedTask(), CanceledTask(), ProgressTask()],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 70.h),
        child: FloatingActionButton(
          onPressed: () {
            context.push("/addtask");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
