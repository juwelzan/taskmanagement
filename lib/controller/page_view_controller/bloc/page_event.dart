// ignore_for_file: unused_import

import '../../../core/path/path.dart';

class PageEvent {}

class NewTasks extends PageEvent {}

class Completed extends PageEvent {}

class Canceld extends PageEvent {}

class Progress extends PageEvent {}

class Dilog extends PageEvent {
  final int index;
  Dilog({this.index = 349757239475});
}
