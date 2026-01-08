import 'package:taskmanagement/controller/api_request_controller/camera_img_pik_controller.dart';
import 'package:taskmanagement/controller/api_request_controller/delete_task_controller.dart';
import 'package:taskmanagement/controller/api_request_controller/img_pik_gallery.dart';
import 'package:taskmanagement/controller/api_request_controller/otp_send_email.dart';
import 'package:taskmanagement/controller/api_request_controller/profile_update_controller.dart';
import 'package:taskmanagement/controller/api_request_controller/task_stusus_update.dart';
import 'package:taskmanagement/controller/api_request_controller/user_login_controller.dart';
import 'package:taskmanagement/controller/api_request_controller/user_registration.dart';
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
      providers: [BlocProvider(create: (context) => ApiRequestBloc(router))],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => TaskDataController()),
          ChangeNotifierProvider(create: (_) => ImgPikGallery()),
          ChangeNotifierProvider(create: (_) => CameraImgPikController()),
          ChangeNotifierProvider(create: (_) => ScreenController()),
          ChangeNotifierProvider(create: (_) => AddTaskController()),
          ChangeNotifierProvider(create: (_) => LogoutController()),
          ChangeNotifierProvider(create: (_) => GetProfileData()),
          ChangeNotifierProvider(create: (_) => OtpSendEmail()),
          ChangeNotifierProxyProvider<TaskDataController, DeleteTaskController>(
            create: (_) => DeleteTaskController(TaskDataController()),
            update: (context, value, previous) => DeleteTaskController(value),
          ),
          ChangeNotifierProxyProvider2<
            TaskDataController,
            GetProfileData,
            UserLoginController
          >(
            create: (_) =>
                UserLoginController(TaskDataController(), GetProfileData()),
            update: (context, value, value2, previous) =>
                UserLoginController(value, value2),
          ),
          ChangeNotifierProvider(create: (_) => UserRegistration()),
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
      ),
    );
  }
}
