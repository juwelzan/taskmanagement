import 'package:taskmanagement/core/path/path.dart';

class AlertBottomSheet extends StatelessWidget {
  final VoidCallback? onTapYes;
  final VoidCallback? onTapCancel;
  const AlertBottomSheet({super.key, this.onTapYes, this.onTapCancel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h, left: 10.w, right: 10.w),
      child: Container(
        padding: EdgeInsets.all(10.sp),
        height: 120.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Do you want to Logout",
              style: Theme.of(
                context,
              ).textTheme.displayMedium?.copyWith(fontSize: 23.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTapCancel,
                  child: Container(
                    height: 45.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: Color(0xff22bf73),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Center(
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onTapYes,
                  child: Container(
                    height: 45.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: Color(0xfff60002).withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8.sp),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
