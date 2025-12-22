import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';

import '../../../core/path/path.dart';

class SetPassword extends StatelessWidget {
  SetPassword({super.key});
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set Password",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Gap(10.h),
              Text(
                "Minimum length password 8 charecter with letter and number combination",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Gap(20.h),

              TextFieldWidget(
                controller: passController,
                hintText: "password",
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value.toString().isEmpty || value == "") {
                    return "Enter Strong Password";
                  }
                  if (value != conPassController.text) {
                    return "Password not Mess";
                  }
                  return null;
                },
              ),
              Gap(10.h),
              TextFieldWidget(
                controller: conPassController,
                hintText: "confirm password",
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value.toString().isEmpty || value == "") {
                    return "Enter Strong Password";
                  }
                  if (value != passController.text) {
                    return "Password not Mess";
                  }
                  return null;
                },
              ),
              Gap(40.h),
              BlocBuilder<ApiRequestBloc, ApiRequestState>(
                builder: (context, state) {
                  if (!state.lodingSpin) {
                    return FilledButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          context.read<ApiRequestBloc>().add(
                            ResetPasswordEvent(
                              email: state.otpSendEmai.toString(),
                              otp: state.otp.toString(),
                              password: conPassController.text,
                            ),
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 25.sp,
                      ),
                    );
                  }
                  if (state.lodingSpin) {
                    return Center(
                      child: Lottie.asset("assets/loding.json", width: 40.w),
                    );
                  }
                  return SizedBox();
                },
              ),
              Gap(50.h),
              Center(
                child: HaveAccountWidget(
                  onTap: () {
                    context.go("/login");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
