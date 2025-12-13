import '../../../core/path/path.dart';

class UserDataFormScreen extends StatelessWidget {
  const UserDataFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Join with Us",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Gap(20.h),
            TextFieldWidget(hintText: "Email"),
            Gap(10.h),
            TextFieldWidget(hintText: "Fast Name"),
            Gap(10.h),
            TextFieldWidget(hintText: "Last Name"),
            Gap(10.h),
            TextFieldWidget(hintText: "Mobile"),
            Gap(10.h),
            TextFieldWidget(hintText: "Password"),
            Gap(20.h),
            FilledButton(
              onPressed: () {},
              child: Icon(Icons.arrow_circle_right_outlined),
            ),
            Gap(40.h),
            Center(child: HaveAccountWidget()),
          ],
        ),
      ),
    );
  }
}
