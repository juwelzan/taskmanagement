// ignore_for_file: prefer_final_fields

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/models/login_model/login_model.dart';

import '../../../core/path/path.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Started With",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.displayMedium,
                ),

                Gap(30.h),
                TextFieldWidget(
                  hintText: "Email",
                  controller: _emailController,
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return "enter email";
                    }
                    return null;
                  },
                ),
                Gap(20.h),
                TextFieldWidget(
                  hintText: "Password",
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value == null) {
                      return "enter password";
                    }
                    return null;
                  },
                ),
                Gap(10.h),
                BlocBuilder<ApiRequestBloc, ApiRequestState>(
                  builder: (context, state) {
                    return Visibility(
                      visible: state.emailPassWrongMessg != "",
                      child: Text(
                        state.emailPassWrongMessg,
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.red),
                      ),
                    );
                  },
                ),
                Gap(20.h),
                BlocBuilder<ApiRequestBloc, ApiRequestState>(
                  builder: (context, state) {
                    return FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ApiRequestBloc>().add(
                            LoginEvent(
                              loginDta: LoginModel(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 25.sp,
                      ),
                    );
                  },
                ),
                Gap(40.h),

                Center(
                  child: RichText(
                    textAlign: TextAlign.center,

                    text: TextSpan(
                      text: "Forget Password ?",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color(0xff888888),
                        fontSize: 14.sp,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.push("/email");
                        },
                      children: [
                        TextSpan(text: "\n"),
                        TextSpan(text: "\n"),
                        TextSpan(
                          text: "Don't have accaunt? ",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        TextSpan(
                          text: "Sign up",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Color(0xff21bf73)),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push("/registration");
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
