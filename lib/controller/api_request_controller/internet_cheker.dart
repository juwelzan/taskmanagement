import 'dart:async';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:taskmanagement/core/path/path.dart';

class InternetCheker extends ChangeNotifier {
  final SpashProvider spashProvider;
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
