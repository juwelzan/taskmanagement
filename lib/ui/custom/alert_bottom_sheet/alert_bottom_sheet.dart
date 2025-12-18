import 'package:taskmanagement/core/path/path.dart';

class AlertBottomSheet extends StatelessWidget {
  final VoidCallback? onTapYes;
  final VoidCallback? onTapCancel;
  final String titel;
  const AlertBottomSheet({
    super.key,
    this.onTapYes,
    this.onTapCancel,
    required this.titel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h, left: 10.w, right: 10.w),
      child: Stack(
        children: [
          Container(
            height: 120.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11.sp),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10.sp,
              right: 10.sp,
              bottom: 10.sp,
              top: 20.sp,
            ),
            height: 120.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xff22bf73).withOpacity(0.4),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titel,
                  style: Theme.of(
                    context,
                  ).textTheme.displayMedium?.copyWith(fontSize: 19.sp),
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
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
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
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
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
        ],
      ),
    );
  }
}
