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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskDataController()),
        ChangeNotifierProvider(create: (_) => ImgPikGallery()),
        ChangeNotifierProvider(create: (_) => CameraImgPikController()),
        ChangeNotifierProvider(create: (_) => ScreenController()),
        ChangeNotifierProvider(create: (_) => AddTaskController()),
        ChangeNotifierProvider(create: (_) => LogoutController()),
        ChangeNotifierProvider(create: (_) => GetProfileData()),
        ChangeNotifierProvider(create: (_) => SetPasswordController()),
        //OtpVerifyController
        ChangeNotifierProxyProvider<SetPasswordController, OtpVerifyController>(
          create: (context) =>
              OtpVerifyController(context.read<SetPasswordController>()),
          update: (context, value, previous) {
            if (previous == null) {
              return OtpVerifyController(value);
            }
            return previous;
          },
        ),
        //OtpSendEmail
        ChangeNotifierProxyProvider<OtpVerifyController, OtpSendEmail>(
          create: (context) =>
              OtpSendEmail(context.read<OtpVerifyController>()),
          update: (context, value, previous) {
            if (previous == null) {
              return OtpSendEmail(value);
            }
            return previous;
          },
        ),
        //DeleteTaskController
        ChangeNotifierProxyProvider<TaskDataController, DeleteTaskController>(
          create: (context) =>
              DeleteTaskController(context.read<TaskDataController>()),
          update: (context, value, previous) {
            if (previous == null) {
              return DeleteTaskController(value);
            }
            return previous;
          },
        ),

        //UserLoginController
        ChangeNotifierProxyProvider2<
          TaskDataController,
          GetProfileData,
          UserLoginController
        >(
          create: (context) => UserLoginController(
            context.read<TaskDataController>(),
            context.read<GetProfileData>(),
          ),
          update: (context, value, value2, previous) =>
              UserLoginController(value, value2),
        ),
        //SpashProvider
        ChangeNotifierProvider(create: (context) => UserRegistration()),
        ChangeNotifierProxyProvider2<
          TaskDataController,
          GetProfileData,
          SpashProvider
        >(
          create: (context) => SpashProvider(
            context.read<TaskDataController>(),
            context.read<GetProfileData>(),
          ),
          update: (_, task, profile, _) => SpashProvider(task, profile),
        ),
        //InternetCheker
        ChangeNotifierProxyProvider<SpashProvider, InternetCheker>(
          lazy: false,
          create: (context) => InternetCheker(context.read<SpashProvider>()),
          update: (context, splash, previous) {
            if (previous == null) {
              final checker = InternetCheker(splash);

              return checker;
            }
            return previous;
          },
        ),
        //TaskStususUpdate
        ChangeNotifierProxyProvider2<
          TaskDataController,
          ScreenController,
          TaskStususUpdate
        >(
          lazy: false,
          create: (context) => TaskStususUpdate(
            context.read<TaskDataController>(),
            context.read<ScreenController>(),
          ),
          update: (context, task, scree, previous) {
            if (previous == null) {
              final checker = TaskStususUpdate(task, scree);

              return checker;
            }
            return previous;
          },
        ),
        //ProfileUpdateController
        ChangeNotifierProxyProvider<GetProfileData, ProfileUpdateController>(
          lazy: false,
          create: (context) =>
              ProfileUpdateController(context.read<GetProfileData>()),
          update: (context, value, previous) {
            if (previous == null) {
              return ProfileUpdateController(value);
            }
            return previous;
          },
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: light,
        routerConfig: router,
      ),
    );
  }
}
