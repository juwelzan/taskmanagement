// ignore_for_file: unused_local_variable, unused_field, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/apps/api/api_call/api_calls.dart';
import 'package:taskmanagement/apps/api/url/urls.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/models/login_model/login_model.dart';
import 'package:taskmanagement/core/models/new_task_add_model/new_task_add_model.dart';
import 'package:taskmanagement/core/models/registration_model/registration_model.dart';
import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
import 'package:taskmanagement/core/models/status_select_model/status_select_model.dart';
import 'package:taskmanagement/core/models/task_model/task_mode.dart';
import 'package:taskmanagement/core/models/udate_profile_model/udate_profile_model.dart';

import 'package:taskmanagement/core/models/user_profile_model/user_prodile_model.dart';
import 'package:taskmanagement/core/path/path.dart';

class ApiRequestBloc extends Bloc<ApiRequestEvent, ApiRequestState> {
  final GoRouter router;
  late StreamSubscription<InternetStatus> _subscription;
  ApiRequestBloc(this.router) : super(ApiRequestState()) {
    on<LoginEvent>(_login);

    on<UserRegistrationEvent>(_userRegistration);

    on<LodingSpin>(_lodingSpin);
    on<UserLoginCheck>(_userLoginCheck);
    on<EmailUseMessage>(_emailUseMessage);
    on<LogoutUser>(_logoutUser);
    on<GetTaskDataEvent>(_getTaskData);
    on<AddNewTaskEvent>(_addNewTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<TaskStatusEvent>(_taskStatus);
    on<ProfileUpdateEvent>(_profileUpdate);
    on<InternetStatusEvent>(_internetStatusCheck);
    on<StatusSelectEvent>(_statusSelect);
    on<StatusDropDownOpen>(_statusDropDownOpen);
    on<GetUseProfileData>(_getUseProfileData);
    on<StatusUpdataApiEvent>(_statusUpdataApiEvent);
    on<ImagePikGallery>(_imagePikGallery);
    on<ImagePikCamera>(_imagePikCamera);
    on<EmailOPTSendEvent>(_emailOPTSend);
    on<ResetPasswordEvent>(_resetPasswordEvent);
    on<OPTVerifyEvent>(_oPTVerifyEvent);
  }

  Future<void> _login(LoginEvent event, Emitter<ApiRequestState> emit) async {
    add(LodingSpin(lodingSpin: true));
    SharedPreferences sharedpre = await SharedPreferences.getInstance();
    emit(
      state.copyWith(
        notFountModel: NotFountModel(status: "", useEmail: ""),
      ),
    );
    LoginModel body = LoginModel(
      email: event.loginDta.email,
      password: event.loginDta.password,
    );
    final response = await ApiCalls.RequestPost(
      uri: Urls.LoginUrl(),
      body: body.toJson(),
    );

    if (response.statusCode == 200) {
      final decodeBody = jsonDecode(response.body);
      final token = decodeBody["token"];
      final data = decodeBody["data"];
      UserProfileModel user = UserProfileModel.fromJson(data);
      print(user.createdDate);
      emit(state.copyWith(userProfileModel: user));

      sharedpre.setString(ApiRequestState.userToken, token);
      sharedpre.setString(ApiRequestState.userKey, jsonEncode(user.toJson()));
      final da = sharedpre.getString(ApiRequestState.userKey);
      add(GetTaskDataEvent());
      router.go("/home");

      add(LodingSpin(lodingSpin: false));
    }

    if (response.statusCode == 404) {
      emit(
        state.copyWith(
          notFountModel: NotFountModel.fromJson(jsonDecode(response.body)),
        ),
      );
      add(LodingSpin(lodingSpin: false));
    }
  }

  Future<void> _userRegistration(
    UserRegistrationEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    add(LodingSpin(lodingSpin: true));
    add(EmailUseMessage(emailUseMessage: ""));
    RegistrationModel body = RegistrationModel(
      email: event.registrationModel.email,
      firstName: event.registrationModel.firstName,
      lastName: event.registrationModel.lastName,
      mobile: event.registrationModel.mobile,
      password: event.registrationModel.password,
    );
    final response = await ApiCalls.RequestPost(
      uri: Urls.RegistrationUrl(),
      body: body.toJson(),
    );
    if (response.statusCode == 200) {
      router.go("/login");
      add(LodingSpin(lodingSpin: false));
    }

    if (response.statusCode == 400) {
      emit(
        state.copyWith(
          notFountModel: NotFountModel.fromJson(jsonDecode(response.body)),
        ),
      );
      add(EmailUseMessage(emailUseMessage: "${state.notFountModel?.useEmail}"));
      add(LodingSpin(lodingSpin: false));
    }
  }

  Future<void> _lodingSpin(
    LodingSpin event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(lodingSpin: event.lodingSpin));
  }

  Future<void> _emailUseMessage(
    EmailUseMessage event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        notFountModel: NotFountModel(
          status: "",
          useEmail: event.emailUseMessage,
        ),
      ),
    );
  }

  Future<void> _logoutUser(
    LogoutUser event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences userDara = await SharedPreferences.getInstance();
    userDara.clear();
    router.go("/login");
  }

  Future<void> _userLoginCheck(
    UserLoginCheck event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final data = userData.getString(ApiRequestState.userToken);
    if (data != null) {
      emit(state.copyWith());
      add(GetTaskDataEvent());
      router.go("/home");
      add(GetUseProfileData());
    }
    if (data == null || data == "") {
      router.go("/login");
    }
  }

  Future<void> _getTaskData(
    GetTaskDataEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(ApiRequestState.userToken);
    add(LodingSpin(lodingSpin: true));
    try {
      final newTask = await ApiCalls.RequestGet(
        uri: Urls.NewTaskGetUrl(),
        token: token,
      );
      final completedTask = await ApiCalls.RequestGet(
        uri: Urls.CompletedTaskGetUrl(),
        token: token,
      );
      final canceledTask = await ApiCalls.RequestGet(
        uri: Urls.CanceledTaskGetUrl(),
        token: token,
      );
      final progressTask = await ApiCalls.RequestGet(
        uri: Urls.ProgressTaskGetUrl(),
        token: token,
      );

      if (newTask.statusCode == 200 &&
          completedTask.statusCode == 200 &&
          canceledTask.statusCode == 200 &&
          progressTask.statusCode == 200) {
        add(GetUseProfileData());
        TaskMode newTaskData = TaskMode.formJson(jsonDecode(newTask.body));
        TaskMode completedTaskData = TaskMode.formJson(
          jsonDecode(completedTask.body),
        );
        TaskMode canceledTaskData = TaskMode.formJson(
          jsonDecode(canceledTask.body),
        );
        TaskMode progressTaskData = TaskMode.formJson(
          jsonDecode(progressTask.body),
        );
        emit(
          state.copyWith(
            newTaskData: newTaskData.taskData,
            completedTaskData: completedTaskData.taskData,
            canceletTaskData: canceledTaskData.taskData,
            progressTaskData: progressTaskData.taskData,
          ),
        );
        add(LodingSpin(lodingSpin: false));
      }
    } catch (e) {
      throw (e.toString());
    }
    add(LodingSpin(lodingSpin: false));
  }

  Future<void> _addNewTask(
    AddNewTaskEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(ApiRequestState.userToken);
    AddNewTaskModel body = AddNewTaskModel(
      title: event.addNewTaskModel.title,
      description: event.addNewTaskModel.description,
      status: "New",
    );

    final response = await ApiCalls.RequestPost(
      uri: Urls.AddNewTaskUrl(),
      body: body.toJson(),
      token: token,
    );

    if (response.statusCode == 200) {
      add(GetTaskDataEvent());
      router.go("/home");
    }
  }

  Future<void> _deleteTask(
    DeleteTaskEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    print("delete");
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(ApiRequestState.userToken);
    final response = await ApiCalls.RequestGet(
      uri: Urls.DeleteTaskUrl(event.id),
      token: token,
    );

    if (response.statusCode == 200) {
      add(GetTaskDataEvent());
    }
  }

  Future<void> _taskStatus(
    TaskStatusEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(taskStatus: event.status));
  }

  Future<void> _statusDropDownOpen(
    StatusDropDownOpen event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(isStatusDropDownOpen: event.isStatusDropDownOpen));
  }

  Future<void> _statusSelect(
    StatusSelectEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(
      state.copyWith(
        statusSelectModel: StatusSelectModel(
          icon: event.icon,
          color: event.color,
          StstusName: event.StstusName,
        ),
      ),
    );
  }

  Future<void> _internetStatusCheck(
    InternetStatusEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    _subscription = InternetConnection().onStatusChange.listen((onData) {
      if (onData == InternetStatus.connected) {
        add(UserLoginCheck());
        add(LodingSpin(lodingSpin: false));
      } else {
        router.go("/oninternet");
      }
    });
  }

  Future<void> _profileUpdate(
    ProfileUpdateEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    final token = userData.getString(ApiRequestState.userToken);
    UdateProfileModel data = UdateProfileModel(
      lastName: event.profileUpdate.lastName,
      firstName: event.profileUpdate.firstName,
    );

    final response = await ApiCalls.RequestPost(
      uri: Urls.ProfileUpdateUrl(),
      body: data.toJson(),
      token: token,
    );
    print(token);
    if (response.statusCode == 200) {
      add(GetUseProfileData());
      router.pop("/profile");
    }
  }

  Future<void> _statusUpdataApiEvent(
    StatusUpdataApiEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    final token = sharedPre.getString(ApiRequestState.userToken);
    final response = await ApiCalls.RequestGet(
      uri: Urls.UpdateTaskStatusUrl(
        taskID: event.taskId,
        status: event.StstusName,
      ),
      token: token,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      add(GetTaskDataEvent());
    }
  }

  Future<void> _getUseProfileData(
    GetUseProfileData event,
    Emitter<ApiRequestState> emit,
  ) async {
    SharedPreferences sharedpre = await SharedPreferences.getInstance();
    final token = sharedpre.getString(ApiRequestState.userToken);
    print(token);
    if (token != null) {
      final response = await ApiCalls.RequestGet(
        uri: Urls.ProfileDetailsUrl(),
        token: token,
      );
      print(token);

      if (response.statusCode == 200) {
        final deCodeData = jsonDecode(response.body);
        final data = deCodeData["data"][0];

        UserProfileModel user = UserProfileModel.fromJson(data);
        sharedpre.setString(ApiRequestState.userKey, jsonEncode(user.toJson()));

        emit(state.copyWith(userProfileModel: user));
      }
    }

    final img = sharedpre.getString(ApiRequestState.imgKey);

    if (img != null && File(img).existsSync()) {
      emit(state.copyWith(profileImg: File(img)));
    }
  }

  Future<void> _imagePikGallery(
    ImagePikGallery event,
    Emitter<ApiRequestState> emit,
  ) async {
    try {
      final picker = ImagePicker();
      final XFile? gallery = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (gallery == null) return;

      final directory = await getApplicationDocumentsDirectory();
      final prefs = await SharedPreferences.getInstance();

      final savedImage = File('${directory.path}/${gallery.name}');
      await File(gallery.path).copy(savedImage.path);

      await prefs.setString(ApiRequestState.imgKey, savedImage.path);

      emit(state.copyWith(profileImg: savedImage));
      router.pop();
    } catch (e) {
      debugPrint('Image pick error: $e');
    }
  }

  Future<void> _imagePikCamera(
    ImagePikCamera event,
    Emitter<ApiRequestState> emit,
  ) async {
    try {
      final picker = ImagePicker();
      final XFile? gallery = await picker.pickImage(source: ImageSource.camera);

      if (gallery == null) return;

      final directory = await getApplicationDocumentsDirectory();
      final prefs = await SharedPreferences.getInstance();

      final savedImage = File('${directory.path}/${gallery.name}');
      await File(gallery.path).copy(savedImage.path);

      await prefs.setString(ApiRequestState.imgKey, savedImage.path);

      emit(state.copyWith(profileImg: savedImage));
      router.pop();
    } catch (e) {
      debugPrint('Image pick error: $e');
    }
  }

  Future<void> _emailOPTSend(
    EmailOPTSendEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(lodingSpin: true, notUserFount: ""));

    final response = await ApiCalls.RequestGet(
      uri: Urls.EmaiOTPSendUrl(event.email),
    );

    if (response.statusCode == 200) {
      router.push("/pinveri");
      emit(state.copyWith(otpSendEmai: event.email));
      emit(state.copyWith(lodingSpin: false));
    }
    if (response.statusCode == 404) {
      final decode = jsonDecode(response.body);
      emit(state.copyWith(notUserFount: decode["data"]));
      emit(state.copyWith(lodingSpin: false));
    }
    emit(state.copyWith(lodingSpin: false));
  }

  Future<void> _oPTVerifyEvent(
    OPTVerifyEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(lodingSpin: true, invalidOTP: ""));
    final response = await ApiCalls.RequestGet(
      uri: Urls.OTPVerifyUrl(event.email, event.otp),
    );

    if (response.statusCode == 200) {
      router.push("/setpassword");
      emit(state.copyWith(lodingSpin: false, otp: event.otp));
    }

    if (response.statusCode == 406) {
      final deCode = jsonDecode(response.body);
      emit(state.copyWith(invalidOTP: deCode["data"], lodingSpin: false));
    }
    emit(state.copyWith(lodingSpin: false));
  }

  Future<void> _resetPasswordEvent(
    ResetPasswordEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(lodingSpin: true));
    print("djkshfgsjg");
    final response = await ApiCalls.RequestPost(
      uri: Urls.ResetPasswordyUrl(),
      body: {
        "email": event.email,
        "OTP": event.otp,
        "password": event.password,
      },
    );
    print(event.email);
    print(event.otp);
    print(event.password);
    if (response.statusCode == 200) {
      router.go("/login");
      emit(state.copyWith(lodingSpin: false));
    }

    emit(state.copyWith(lodingSpin: false));
  }
}
