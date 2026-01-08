// ignore_for_file: unused_local_variable, unused_field, avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/apps/api/api_call/api_calls.dart';
import 'package:taskmanagement/apps/api/url/urls.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/key/key.dart';
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
    // on<TaskStatusEvent>(_taskStatus);

    on<ResetPasswordEvent>(_resetPasswordEvent);
    on<OPTVerifyEvent>(_oPTVerifyEvent);
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
