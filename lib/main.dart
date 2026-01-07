import 'package:taskmanagement/controller/page_view_controller/screen_controller.dart';

import '../../../core/path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ApiRequestBloc(router)),
        BlocProvider(create: (context) => PageBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TaskDataController()),
          ChangeNotifierProvider(create: (_) => ScreenController()),
          ChangeNotifierProvider(create: (_) => AddTaskController()),
          ChangeNotifierProvider(create: (_) => LogoutController()),
          ChangeNotifierProvider(create: (_) => GetProfileData()),
          ChangeNotifierProxyProvider2<
            TaskDataController,
            GetProfileData,
            SpashProvider
          >(
            create: (_) =>
                SpashProvider(TaskDataController(), GetProfileData()),
            update: (_, task, profile, _) => SpashProvider(task, profile),
          ),
          ChangeNotifierProxyProvider<SpashProvider, InternetCheker>(
            create: (_) => InternetCheker(
              SpashProvider(TaskDataController(), GetProfileData()),
            ),
            update: (_, splash, _) => InternetCheker(splash),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: light,
          routerConfig: router,
        ),
      ),
    );
  }
}
