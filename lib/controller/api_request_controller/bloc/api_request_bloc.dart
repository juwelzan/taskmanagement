import 'package:taskmanagement/apps/api/api_call/api_calls.dart';
import 'package:taskmanagement/apps/api/url/urls.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/models/registration_model/registration_model.dart';
import 'package:taskmanagement/core/models/resgistration_status_model/resgistration_status_model.dart';
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
    on<EmailUseMessage>(_emailUseMessage);
  }
  Future<void> _resgistration(
    RegistrationEvent event,
    Emitter<ApiRequestState> emit,
  ) async {}
  Future<void> _login(LoginEvent event, Emitter<ApiRequestState> emit) async {}

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
      Urls.RegistrationUrl(),
      body.toJson(),
    );
    emit(
      state.copyWith(
        resgistrationStatusModel: ResgistrationStatusModel.fromJson(response),
      ),
    );
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
}
