// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/apps/api/api_call/api_calls.dart';
import 'package:taskmanagement/apps/api/url/urls.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/models/login_model/login_model.dart';
import 'package:taskmanagement/core/models/new_task_add_model/new_task_add_model.dart';
import 'package:taskmanagement/core/models/registration_model/registration_model.dart';
import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
import 'package:taskmanagement/core/models/task_model/task_mode.dart';
import 'package:taskmanagement/core/models/udate_profile_model/udate_profile_model.dart';
import 'package:taskmanagement/core/models/user_model/user_model.dart';
import 'package:taskmanagement/core/path/path.dart';

class ApiRequestBloc extends Bloc<ApiRequestEvent, ApiRequestState> {
  final GoRouter router;
  ApiRequestBloc(this.router) : super(ApiRequestState()) {
    on<RegistrationEvent>(_resgistration);
    on<LoginEvent>(_login);
    on<ImgLinkCheckEvent>(_imgUrlCheck);
    on<ImgUrlfatch>(_imgUrlFatch);
    on<ImgUrlErrorM>(_imgUrlErrorM);
    on<UserRegistrationEvent>(_userRegistration);
    on<ImgSelectMEvent>(_mgSelectM);
    on<LodingSpin>(_lodingSpin);
    on<UserLoginCheck>(_userLoginCheck);
    on<EmailUseMessage>(_emailUseMessage);
    on<LogoutUser>(_logoutUser);
    on<GetTaskDataEvent>(_getTaskData);
    on<AddNewTaskEvent>(_addNewTask);
    on<DeleteTaskEvent>(_deleteTask);
    on<TaskStatusEvent>(_taskStatus);
    on<ProfileUpdateEvent>(_profileUpdate);
  }
  Future<void> _resgistration(
    RegistrationEvent event,
    Emitter<ApiRequestState> emit,
  ) async {}
  Future<void> _login(LoginEvent event, Emitter<ApiRequestState> emit) async {
    SharedPreferences userData = await SharedPreferences.getInstance();
    emit(state.copyWith(emailPassWrongMessg: ""));
    LoginModel body = LoginModel(
      email: event.loginDta.email,
      password: event.loginDta.password,
    );
    final response = await ApiCalls.RequestPost(
      uri: Urls.LoginUrl(),
      body: body.toJson(),
    );

    if (response.statusCode == 200) {
      UserModel data = UserModel.fromJson(jsonDecode(response.body));
      UserDataLocalModel user = UserDataLocalModel.fromJson(data.toJson());
      emit(
        state.copyWith(
          userDataLocalModel: UserDataLocalModel.fromJson(data.toJson()),
        ),
      );

      userData.setString(
        ApiRequestState.userDataKey,
        jsonEncode(user.toJson()),
      );
      add(GetTaskDataEvent());
      router.go("/home");
    }

    if (response.statusCode == 401) {
      emit(state.copyWith(emailPassWrongMessg: "email and password wrong"));
    }
  }

  Future<void> _imgUrlCheck(
    ImgLinkCheckEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(imgUrlCheck: event.imgUrlChe));
  }

  Future<void> _imgUrlFatch(
    ImgUrlfatch event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(imgUrl: event.imgUrl));
  }

  Future<void> _imgUrlErrorM(
    ImgUrlErrorM event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(imgUrlError: event.imgUrlError));
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
      photo: event.registrationModel.photo,
    );
    final response = await ApiCalls.RequestPost(
      uri: Urls.RegistrationUrl(),
      body: body.toJson(),
    );
    if (response.statusCode == 200) {
      emit(
        state.copyWith(
          resgistrationStatusModel: ResgistrationStatusModel.fromJson(
            jsonDecode(response.body),
          ),
        ),
      );
    }
    if (state.resgistrationStatusModel?.status == "fail") {
      add(
        EmailUseMessage(
          emailUseMessage:
              "email already use { ${state.resgistrationStatusModel?.useEmail} }",
        ),
      );
      add(LodingSpin(lodingSpin: false));
    }
    if (state.resgistrationStatusModel?.status == "success") {
      router.go("/login");
      add(LodingSpin(lodingSpin: false));
    }
  }

  Future<void> _mgSelectM(
    ImgSelectMEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    emit(state.copyWith(imgSelectM: "Profile image set."));
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
    emit(state.copyWith(emailUseMessage: event.emailUseMessage));
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
    print("object api");
    SharedPreferences userData = await SharedPreferences.getInstance();
    final data = userData.getString(ApiRequestState.userDataKey);
    if (data != null) {
      emit(
        state.copyWith(
          userDataLocalModel: UserDataLocalModel.fromJson(jsonDecode(data)),
        ),
      );
      add(GetTaskDataEvent());
      router.go("/home");
    }
    if (data == null || data == "") {
      router.go("/login");
    }
  }

  Future<void> _getTaskData(
    GetTaskDataEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    add(LodingSpin(lodingSpin: true));
    try {
      final newTask = await ApiCalls.RequestGet(
        uri: Urls.NewTaskGetUrl(),
        token: state.userDataLocalModel?.token,
      );
      final completedTask = await ApiCalls.RequestGet(
        uri: Urls.CompletedTaskGetUrl(),
        token: state.userDataLocalModel?.token,
      );
      final canceledTask = await ApiCalls.RequestGet(
        uri: Urls.CanceledTaskGetUrl(),
        token: state.userDataLocalModel?.token,
      );
      final progressTask = await ApiCalls.RequestGet(
        uri: Urls.ProgressTaskGetUrl(),
        token: state.userDataLocalModel?.token,
      );
      debugPrint(
        "${progressTask.statusCode}: ${canceledTask.statusCode} : ${completedTask.statusCode} : ${newTask.statusCode}",
      );
      debugPrint("${state.userDataLocalModel?.token}");
      if (newTask.statusCode == 200 &&
          completedTask.statusCode == 200 &&
          canceledTask.statusCode == 200 &&
          progressTask.statusCode == 200) {
        debugPrint("all url ok");
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
        debugPrint(state.newTaskData?.length.toString());
        add(LodingSpin(lodingSpin: false));
      }
    } catch (e) {
      throw (e.toString());
    }
  }

  Future<void> _addNewTask(
    AddNewTaskEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    AddNewTaskModel body = AddNewTaskModel(
      title: event.addNewTaskModel.title,
      description: event.addNewTaskModel.description,
      status: "New",
    );

    final response = await ApiCalls.RequestPost(
      uri: Urls.AddNewTaskUrl(),
      body: body.toJson(),
      token: state.userDataLocalModel?.token,
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
    final response = await ApiCalls.RequestGet(
      uri: Urls.DeleteTaskUrl(event.id),
      token: state.userDataLocalModel?.token,
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

  Future<void> _profileUpdate(
    ProfileUpdateEvent event,
    Emitter<ApiRequestState> emit,
  ) async {
    UdateProfileModel data = UdateProfileModel(
      lastName: event.profileUpdate.lastName,
      firstName: event.profileUpdate.firstName,
      photo: event.profileUpdate.photo,
    );

    final response = await ApiCalls.RequestPost(
      uri: Urls.ProfileUpdateUrl(),
      body: data.toJson(),
      token: state.userDataLocalModel?.token,
    );

    debugPrint(response.statusCode.toString());
  }
}
