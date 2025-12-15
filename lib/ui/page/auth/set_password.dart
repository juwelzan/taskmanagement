import '../../../core/path/path.dart';

class SetPassword extends StatelessWidget {
  const SetPassword({super.key});

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
              "Set Password",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Gap(10.h),
            Text(
              "Minimum length password 8 charecter with letter and number combination",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Gap(20.h),

            TextFieldWidget(hintText: "password"),
            Gap(10.h),
            TextFieldWidget(hintText: "confirm password"),
            Gap(40.h),
            FilledButton(onPressed: () {}, child: Text("Confirm")),
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
