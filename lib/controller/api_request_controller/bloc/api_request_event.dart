// ignore_for_file: camel_case_types

import 'package:taskmanagement/core/models/login_model/login_model.dart';
import 'package:taskmanagement/core/models/new_task_add_model/new_task_add_model.dart';
import 'package:taskmanagement/core/models/registration_model/registration_model.dart';

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

class TaskStatusEvent extends ApiRequestEvent {
  final String status;
  TaskStatusEvent({required this.status});
}
