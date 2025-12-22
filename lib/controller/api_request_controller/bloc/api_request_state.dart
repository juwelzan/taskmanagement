import 'dart:io';

import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
import 'package:taskmanagement/core/models/status_select_model/status_select_model.dart';
import 'package:taskmanagement/core/models/task_data_model/task_data_model.dart';

import 'package:taskmanagement/core/models/user_profile_model/user_prodile_model.dart';

class ApiRequestState {
  final UserProfileModel? userProfileModel;
  final File? profileImg;

  final NotFountModel? notFountModel;

  final bool lodingSpin;

  static const String userToken = "token";
  static const String userKey = "user";
  static const String imgKey = "img";
  final List<TaskDataModel>? newTaskData;
  final List<TaskDataModel>? progressTaskData;
  final List<TaskDataModel>? canceletTaskData;
  final List<TaskDataModel>? completedTaskData;
  final String? taskStatus, otpSendEmai, notUserFount, invalidOTP, otp;
  final StatusSelectModel? statusSelectModel;
  final bool isStatusDropDownOpen;

  ApiRequestState({
    this.notFountModel,

    this.lodingSpin = false,

    this.newTaskData,
    this.progressTaskData,
    this.canceletTaskData,
    this.completedTaskData,
    this.taskStatus = "",
    this.statusSelectModel,
    this.isStatusDropDownOpen = false,
    this.userProfileModel,
    this.profileImg,
    this.otpSendEmai,
    this.notUserFount,
    this.invalidOTP,
    this.otp,
  });

  ApiRequestState copyWith({
    File? profileImg,
    UserProfileModel? userProfileModel,

    NotFountModel? notFountModel,
    bool? lodingSpin,

    List<TaskDataModel>? completedTaskData,
    List<TaskDataModel>? newTaskData,
    List<TaskDataModel>? progressTaskData,
    List<TaskDataModel>? canceletTaskData,
    String? taskStatus,
    otpSendEmai,
    notUserFount,
    invalidOTP,
    otp,
    StatusSelectModel? statusSelectModel,
    bool? isStatusDropDownOpen,
  }) {
    return ApiRequestState(
      notFountModel: notFountModel ?? this.notFountModel,

      lodingSpin: lodingSpin ?? this.lodingSpin,

      completedTaskData: completedTaskData ?? this.completedTaskData,
      canceletTaskData: canceletTaskData ?? this.canceletTaskData,
      newTaskData: newTaskData ?? this.newTaskData,
      progressTaskData: progressTaskData ?? this.progressTaskData,
      taskStatus: taskStatus ?? this.taskStatus,
      statusSelectModel: statusSelectModel ?? this.statusSelectModel,
      isStatusDropDownOpen: isStatusDropDownOpen ?? this.isStatusDropDownOpen,
      userProfileModel: userProfileModel ?? this.userProfileModel,
      profileImg: profileImg ?? this.profileImg,
      invalidOTP: invalidOTP ?? this.invalidOTP,
      notUserFount: notUserFount ?? this.notUserFount,
      otp: otp ?? this.otp,
      otpSendEmai: otpSendEmai ?? this.otpSendEmai,
    );
  }
}
