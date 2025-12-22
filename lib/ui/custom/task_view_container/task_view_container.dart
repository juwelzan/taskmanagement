// ignore_for_file: deprecated_member_use

import 'package:intl/intl.dart';
import 'package:taskmanagement/core/path/path.dart';

class TaskViewContainer extends StatelessWidget {
  final VoidCallback? delete;
  final VoidCallback? edit;
  final VoidCallback? cancel;
  final VoidCallback? onLongPress;
  final bool isShow;
  final String? title, subTitel, date, status;
  final String borderColor;

  const TaskViewContainer({
    super.key,
    this.delete,
    this.edit,
    this.cancel,
    required this.isShow,
    this.onLongPress,
    this.title,
    this.subTitel,
    this.date,
    this.status,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            padding: EdgeInsets.all(5.w),
            height: 100.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xffffffff).withOpacity(0.7),
              border: Border.all(
                width: 3.w,
                color: Color(int.parse(borderColor)),
              ),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  title ?? "",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                AutoSizeText(
                  subTitel ?? "",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat(
                        "yyyy-MMM-dd, hh:mm:a",
                      ).format(DateTime.parse(date!)),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      status ?? "",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isShow,
          child: Container(
            height: 100.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Color(0xff000000),
              borderRadius: BorderRadius.circular(10.sp),
              border: Border.all(width: 3.w, color: Color(0xff2dffb5)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: cancel,
                      icon: Image.asset(
                        "assets/icon/remove.png",
                        width: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: edit,
                      icon: Image.asset(
                        "assets/icon/edit.png",
                        width: 30.sp,
                        color: Color(0xff22bf73),
                      ),
                    ),
                    IconButton(
                      onPressed: delete,
                      icon: Image.asset(
                        "assets/icon/trash.png",
                        width: 30.sp,
                        color: Color(0xffff5252),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
