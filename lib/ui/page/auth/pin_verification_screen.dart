import '../../../core/path/path.dart';

class PinVerificationScreen extends StatelessWidget {
  const PinVerificationScreen({super.key});

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
            Pinput(
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
            Gap(40.h),
            FilledButton(
              onPressed: () {},
              child: Icon(Icons.arrow_circle_right_outlined),
            ),
            Gap(50.h),
            Center(child: HaveAccountWidget()),
          ],
        ),
      ),
    );
  }
}
