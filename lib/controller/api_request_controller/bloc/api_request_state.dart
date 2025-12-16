import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
import 'package:taskmanagement/core/models/task_model/task_mode.dart';
import 'package:taskmanagement/core/models/user_model/user_model.dart';

class ApiRequestState {
  final UserModel? userModel;
  final bool imgUrlCheck;
  final String imgUrl;
  final String imgUrlError;
  final ResgistrationStatusModel? resgistrationStatusModel;
  final String imgSelectM;
  final bool lodingSpin;
  final String emailUseMessage, emailPassWrongMessg;
  final UserDataLocalModel? userDataLocalModel;
  static const String userDataKey = "userData";
  final TaskMode? taskMode;

  ApiRequestState({
    this.userModel,
    this.imgUrlCheck = false,
    this.imgUrl = "",
    this.imgUrlError = "",
    this.resgistrationStatusModel,
    this.imgSelectM = "Profile image not set.",
    this.lodingSpin = false,
    this.emailUseMessage = "",
    this.userDataLocalModel,
    this.emailPassWrongMessg = "",
    this.taskMode,
  });

  ApiRequestState copyWith({
    UserModel? userModel,
    bool? imgUrlCheck,
    String? imgUrl,
    String? imgUrlError,
    ResgistrationStatusModel? resgistrationStatusModel,
    String? imgSelectM,
    bool? lodingSpin,
    String? emailUseMessage,
    String? emailPassWrongMessg,
    UserDataLocalModel? userDataLocalModel,
    TaskMode? taskMode,
  }) {
    return ApiRequestState(
      userModel: userModel ?? this.userModel,
      imgUrlCheck: imgUrlCheck ?? this.imgUrlCheck,
      imgUrl: imgUrl ?? this.imgUrl,
      imgUrlError: imgUrlError ?? this.imgUrlError,
      resgistrationStatusModel:
          resgistrationStatusModel ?? this.resgistrationStatusModel,
      imgSelectM: imgSelectM ?? this.imgSelectM,
      lodingSpin: lodingSpin ?? this.lodingSpin,
      emailUseMessage: emailUseMessage ?? this.emailUseMessage,
      userDataLocalModel: userDataLocalModel ?? this.userDataLocalModel,
      emailPassWrongMessg: emailPassWrongMessg ?? this.emailPassWrongMessg,
      taskMode: taskMode ?? this.taskMode,
    );
  }
}
