// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:taskmanagement/core/models/login_model/login_model.dart';
import 'package:taskmanagement/core/models/new_task_add_model/new_task_add_model.dart';
import 'package:taskmanagement/core/models/registration_model/registration_model.dart';
import 'package:taskmanagement/core/models/udate_profile_model/udate_profile_model.dart';

class ApiRequestEvent {}

class RegistrationEvent extends ApiRequestEvent {
  final RegistrationModel registrationData;
  RegistrationEvent({required this.registrationData});
  RegistrationEvent copyWith({RegistrationModel? registrationData}) {
    return RegistrationEvent(
      registrationData: registrationData ?? this.registrationData,
    );
  }
}

class LoginEvent extends ApiRequestEvent {
  final LoginModel loginDta;
  LoginEvent({required this.loginDta});
}

class ImgLinkCheckEvent extends ApiRequestEvent {
  final bool imgUrlChe;
  ImgLinkCheckEvent({required this.imgUrlChe});
}

class ImgUrlfatch extends ApiRequestEvent {
  final String imgUrl;
  ImgUrlfatch({required this.imgUrl});
}

class ImgUrlErrorM extends ApiRequestEvent {
  final String imgUrlError;
  ImgUrlErrorM({required this.imgUrlError});
}

class UserRegistrationEvent extends ApiRequestEvent {
  final RegistrationModel registrationModel;
  UserRegistrationEvent({required this.registrationModel});
}

class ImgSelectMEvent extends ApiRequestEvent {}

class LodingSpin extends ApiRequestEvent {
  final bool lodingSpin;
  LodingSpin({required this.lodingSpin});
}

class EmailUseMessage extends ApiRequestEvent {
  final String emailUseMessage;
  EmailUseMessage({required this.emailUseMessage});
}

class UserLoginCheck extends ApiRequestEvent {}

class LogoutUser extends ApiRequestEvent {}

class GetTaskDataEvent extends ApiRequestEvent {}

class AddNewTaskEvent extends ApiRequestEvent {
  final AddNewTaskModel addNewTaskModel;
  AddNewTaskEvent({required this.addNewTaskModel});
}

class DeleteTaskEvent extends ApiRequestEvent {
  final String id;
  DeleteTaskEvent({required this.id});
}

// class TaskStatusEvent extends ApiRequestEvent {
//   final String status;
//   TaskStatusEvent({required this.status});
// }

class ProfileUpdateEvent extends ApiRequestEvent {
  final UdateProfileModel profileUpdate;
  ProfileUpdateEvent({required this.profileUpdate});
}

class InternetStatusEvent extends ApiRequestEvent {}

class StatusDropDownOpen extends ApiRequestEvent {
  final bool isStatusDropDownOpen;
  StatusDropDownOpen({required this.isStatusDropDownOpen});
}

class StatusSelectEvent extends ApiRequestEvent {
  final String color, icon;
  final String StstusName;

  StatusSelectEvent({
    required this.color,
    required this.StstusName,
    required this.icon,
  });
}

class StatusUpdataApiEvent extends ApiRequestEvent {
  final String StstusName, taskId;

  StatusUpdataApiEvent({required this.StstusName, required this.taskId});
}

class GetUseProfileData extends ApiRequestEvent {}

class ImagePikGallery extends ApiRequestEvent {}

class ImagePikCamera extends ApiRequestEvent {}

class EmailOPTSendEvent extends ApiRequestEvent {
  final String email;

  EmailOPTSendEvent({required this.email});
}

class OPTVerifyEvent extends ApiRequestEvent {
  final String email, otp;

  OPTVerifyEvent({required this.email, required this.otp});
}

class ResetPasswordEvent extends ApiRequestEvent {
  final String email, otp, password;

  ResetPasswordEvent({
    required this.email,
    required this.otp,
    required this.password,
  });
}
