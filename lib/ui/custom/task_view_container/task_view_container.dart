import 'package:taskmanagement/core/path/path.dart';

class TaskViewContainer extends StatelessWidget {
  final VoidCallback? delete;
  final VoidCallback? edit;
  final VoidCallback? cancel;
  final VoidCallback? onLongPress;
  final bool isShow;
  const TaskViewContainer({
    super.key,
    this.delete,
    this.edit,
    this.cancel,
    required this.isShow,
    this.onLongPress,
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
              color: Color(0xffffffff),
              border: Border.all(width: 3.w, color: Color(0xff2dffb5)),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  "Lorem Ipsum is simply dummy, ",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                AutoSizeText(
                  "Lorem Ipsum is simply dummy, ",
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Date : 10:29",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "Status",
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
              color: Color(0xffffffff),
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
                      icon: Image.asset("assets/icon/remove.png", width: 20.sp),
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
