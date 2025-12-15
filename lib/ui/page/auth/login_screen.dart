import '../../../core/path/path.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
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
              TextFieldWidget(hintText: "Email"),
              Gap(20.h),
              TextFieldWidget(hintText: "Password"),
              Gap(30.h),
              FilledButton(
                onPressed: () {},
                child: Icon(Icons.arrow_circle_right_outlined, size: 25.sp),
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
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xff21bf73),
                        ),
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
    );
  }
}
