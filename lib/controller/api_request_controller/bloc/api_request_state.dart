import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
import 'package:taskmanagement/core/models/user_model/user_model.dart';

class ApiRequestState {
  final UserModel? userModel;
  final bool imgUrlCheck;
  final String imgUrl;
  final String imgUrlError;
  final ResgistrationStatusModel? resgistrationStatusModel;
  final String imgSelectM;
  final bool lodingSpin;
  final String emailUseMessage;

  ApiRequestState({
    this.userModel,
    this.imgUrlCheck = false,
    this.imgUrl = "",
    this.imgUrlError = "",
    this.resgistrationStatusModel,
    this.imgSelectM = "Profile image not set.",
    this.lodingSpin = false,
    this.emailUseMessage = "",
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
    );
  }
}
