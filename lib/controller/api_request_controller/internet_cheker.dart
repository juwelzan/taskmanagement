import 'package:taskmanagement/core/path/path.dart';

class InternetCheker extends ChangeNotifier {
  SpashProvider spashProvider;
  StreamSubscription<InternetStatus>? _subscription;

  InternetCheker(this.spashProvider) {
    startListening();
  }

  void startListening() {
    _subscription?.cancel();

    _subscription = InternetConnection().onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        spashProvider.SplashEnd();
      } else {
        router.go("/oninternet");
      }

      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();

    super.dispose();
  }
}
