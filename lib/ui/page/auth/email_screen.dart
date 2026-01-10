// ignore_for_file: prefer_final_fields

import '../../../core/path/path.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Email Address",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Gap(10.h),
            Text(
              "A 6 digit verification pin will send to your email address",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Gap(20.h),
            Form(
              key: _formkey,
              child: TextFieldWidget(
                controller: controller,
                hintText: "email",
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.toString().isEmpty ||
                      value == null ||
                      value == "") {
                    return "enter email";
                  }
                  return null;
                },
              ),
            ),
            Gap(20.h),
            Consumer<OtpSendEmail>(
              builder: (context, state, _) {
                if (state.emailError != "") {
                  return Text(
                    state.emailError,
                    style: TextStyle(color: Colors.red),
                  );
                }
                return SizedBox();
              },
            ),
            Gap(20.h),
            Consumer<OtpSendEmail>(
              builder: (context, state, _) {
                if (!state.isLoding) {
                  return FilledButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        context.read<OtpSendEmail>().emailOPTSend(
                          controller.text.trim(),
                        );
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined, size: 25.sp),
                  );
                }
                if (state.isLoding) {
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
    );
  }
}
