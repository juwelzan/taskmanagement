import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/page_view_controller/bloc/page_bloc.dart';
import 'package:taskmanagement/controller/spash_controller/bloc/splash_bloc.dart';
import 'package:taskmanagement/controller/spash_controller/bloc/splash_event.dart';

import '../../../core/path/path.dart';

void main() {
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
        BlocProvider(create: (context) => SplashBloc()..add(StartSplash())),
        BlocProvider(create: (context) => ApiRequestBloc(router)),
        BlocProvider(create: (context) => PageBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: light,
        routerConfig: router,
      ),
    );
  }
}
