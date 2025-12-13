import '../../../core/path/path.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

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
            TextFieldWidget(hintText: "email"),
            Gap(40.h),
            FilledButton(
              onPressed: () {},
              child: Icon(Icons.arrow_circle_right_outlined),
            ),
            Gap(50.h),
            Center(child: HaveAccountWidget(onTap: () {})),
          ],
        ),
      ),
    );
  }
}
