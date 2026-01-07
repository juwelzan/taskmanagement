// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:provider/provider.dart';
import 'package:taskmanagement/controller/spash_controller/spash_provider.dart';
import 'package:taskmanagement/core/path/path.dart';

class InternetCheker extends ChangeNotifier {
  final SpashProvider spashProvider;
  StreamSubscription<InternetStatus>? _subscription;
  InternetCheker(this.spashProvider);
  Future<void> internetStatusCheck() async {
    _subscription = InternetConnection().onStatusChange.listen((onData) {
      if (onData == InternetStatus.connected) {
        spashProvider.SplashEnd();
        print("object");
      } else {
        router.go("/oninternet");
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
