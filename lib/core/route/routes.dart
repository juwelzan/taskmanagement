import '../path/path.dart';

final GoRouter router = GoRouter(
  initialLocation: "/home",
  routes: [
    GoRoute(
      path: "/",

      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/login",

      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/home",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: MainPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/email",

      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: EmailScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/pinveri",

      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: PinVerificationScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/setpassword",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: SetPassword(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
    GoRoute(
      path: "/userdatainput",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: UserDataFormScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
