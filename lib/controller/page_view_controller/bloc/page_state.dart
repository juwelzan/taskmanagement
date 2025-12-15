class PageState {
  final int page;
  final int dilogOpen;
  PageState({this.page = 0, this.dilogOpen = 349757239475});
  PageState copyWith({int? page, int? dilogOpen}) {
    return PageState(
      page: page ?? this.page,
      dilogOpen: dilogOpen ?? this.dilogOpen,
    );
  }
}
