// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:taskmanagement/core/path/path.dart';

enum PageState { Dilog, Progress, Canceld, Completed, NewTasks }

class ScreenController extends ChangeNotifier {
  PageState pageState = PageState.NewTasks;
  int pageIndex = 0;

  void NewTask() {
    pageState = PageState.NewTasks;
    pageIndex = 0;
    notifyListeners();
  }

  void Completed() {
    pageState = PageState.Completed;
    pageIndex = 1;
    notifyListeners();
  }

  void Canceld() {
    pageState = PageState.Canceld;
    pageIndex = 2;
    notifyListeners();
  }

  void Progress() {
    pageState = PageState.Progress;
    pageIndex = 3;
    notifyListeners();
  }

  void AddNewTaskIndexUpdata() {
    pageIndex = 0;
    notifyListeners();
  }
}
