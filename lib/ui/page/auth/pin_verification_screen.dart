// ignore_for_file: prefer_final_fields, unnecessary_null_comparison, must_be_immutable

import '../../../core/path/path.dart';

class PinVerificationScreen extends StatelessWidget {
  PinVerificationScreen({super.key});
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
              "PIN Verification",
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
              child: Pinput(
                controller: controller,
                forceErrorState: true,
                validator: (value) {
                  if (value!.length < 6 || value == null) {
                    return "Enter 6 digit OTP";
                  }
                  return null;
                },
                length: 6,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                defaultPinTheme: PinTheme(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(8.sp),
                  ),
                  height: 45.h,
                  width: 55.w,
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Gap(10.h),
            Consumer<OtpVerifyController>(
              builder: (context, state, _) {
                if (state.invalidOTP != null ||
                    state.invalidOTP != "" ||
                    state.invalidOTP!.isNotEmpty) {
                  return Text(
                    state.invalidOTP ?? "",
                    style: TextStyle(color: Colors.red),
                  );
                }
                return SizedBox();
              },
            ),
            Gap(10.h),
            Consumer<OtpVerifyController>(
              builder: (context, state, _) {
                if (!state.lodingSpin) {
                  return FilledButton(
                    onPressed: () {
                      if (_formkey.currentState?.validate() ?? false) {
                        if (state.email != "") {
                          context.read<OtpVerifyController>().otpVerifyEvent(
                            state.email,
                            controller.text,
                          );
                        }
                      }
                    },
                    child: Icon(Icons.arrow_circle_right_outlined, size: 25.sp),
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
            Center(child: HaveAccountWidget()),
          ],
        ),
      ),
    );
  }
}
