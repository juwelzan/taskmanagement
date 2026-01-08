// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:lottie/lottie.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/user_registration.dart';
import 'package:taskmanagement/core/models/registration_model/registration_model.dart';

import '../../../core/path/path.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
  final _formkey = GlobalKey<FormState>();
  String imgPath = "Profile image not set.";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fastNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Gap(120.h),
                Text(
                  "Join with Us",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Gap(20.h),
                Consumer<UserRegistration>(
                  builder: (context, state, _) {
                    return TextFieldWidget(
                      textInputType: TextInputType.emailAddress,
                      errorText: state.emailUseMessage.useEmail != ""
                          ? state.emailUseMessage.useEmail
                          : null,
                      controller: _emailController,
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter email";
                        }
                        return null;
                      },
                    );
                  },
                ),
                Gap(10.h),
                TextFieldWidget(
                  textInputType: TextInputType.name,
                  controller: _fastNameController,
                  hintText: "Fast Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter fast name";
                    }
                    return null;
                  },
                ),
                Gap(10.h),
                TextFieldWidget(
                  textInputType: TextInputType.name,
                  controller: _lastNameController,
                  hintText: "Last Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter  last name";
                    }
                    return null;
                  },
                ),
                Gap(10.h),
                TextFieldWidget(
                  textInputType: TextInputType.number,
                  controller: _mobileController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  hintText: "Mobile",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter mobile number";
                    }
                    return null;
                  },
                ),
                Gap(10.h),
                TextFieldWidget(
                  controller: _passwController,
                  obscureText: true,
                  textInputType: TextInputType.visiblePassword,
                  hintText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter password";
                    }
                    if (value.length < 8) {
                      return "password leaneth 8";
                    }
                    return null;
                  },
                ),
                Gap(10.h),

                Gap(20.h),
                Consumer<UserRegistration>(
                  builder: (context, state, _) {
                    return Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!state.lodingSpin) ...[
                            Expanded(
                              child: FilledButton(
                                onPressed: () async {
                                  if (_formkey.currentState!.validate()) {
                                    context
                                        .read<UserRegistration>()
                                        .userRegistration(
                                          email: _emailController.text,
                                          firstName: _fastNameController.text,
                                          lastName: _lastNameController.text,
                                          mobile: _mobileController.text,
                                          password: _passwController.text,
                                        );
                                  }
                                },
                                child: Icon(Icons.arrow_circle_right_outlined),
                              ),
                            ),
                          ],

                          if (state.lodingSpin) ...[
                            Lottie.asset("assets/loding.json", width: 50.w),
                          ],
                        ],
                      ),
                    );
                  },
                ),
                Gap(40.h),
                Center(
                  child: HaveAccountWidget(
                    onTap: () {
                      context.pushReplacement("/login");
                    },
                  ),
                ),
                Gap(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
