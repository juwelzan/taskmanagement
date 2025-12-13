// ignore_for_file: avoid_types_as_parameter_names, unused_element, no_leading_underscores_for_local_identifiers

import '../../../core/path/path.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageState()) {
    on<NewTasks>(_newTask);
    on<Completed>(_completed);
    on<Canceld>(_canceled);
    on<Progress>(_progress);
  }
  Future<void> _newTask(NewTasks event, Emitter<PageState> emit) async {
    emit(state.copyWith(page: 0));
  }

  Future<void> _completed(Completed event, Emitter<PageState> emit) async {
    emit(state.copyWith(page: 1));
  }

  Future<void> _canceled(Canceld event, Emitter<PageState> emit) async {
    emit(state.copyWith(page: 2));
  }

  Future<void> _progress(Progress event, Emitter<PageState> emit) async {
    emit(state.copyWith(page: 3));
  }
}
