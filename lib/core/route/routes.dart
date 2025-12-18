import 'package:taskmanagement/ui/page/screen/add_task_screen.dart';
import 'package:taskmanagement/ui/page/screen/profile_screen.dart';
import 'package:taskmanagement/ui/page/screen/profile_update_screen.dart';

import '../path/path.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
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
      path: "/registration",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: RegistrationScreen(),
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
      path: "/addtask",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: AddTaskScreen(),
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
      path: "/profile",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: ProfileScreen(),
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
      path: "/profileupdate",
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: ProfileUpdateScreen(),
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
