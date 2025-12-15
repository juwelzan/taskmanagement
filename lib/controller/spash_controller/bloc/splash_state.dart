class SplashState {
  final bool splashEnd;
  SplashState({this.splashEnd = false});
  SplashState copyWith({bool? splashEnd}) {
    return SplashState(splashEnd: splashEnd ?? this.splashEnd);
  }
}
