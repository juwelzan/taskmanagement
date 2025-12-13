import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/page_view_controller/bloc/page_bloc.dart';

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
    return BlocProvider(
      create: (context) => PageBloc(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: light,
        routerConfig: router,
      ),
    );
  }
}
