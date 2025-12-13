class PageState {
  final int page;
  PageState({this.page = 0});
  PageState copyWith({int? page}) {
    return PageState(page: page ?? this.page);
  }
}
