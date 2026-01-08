// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables

import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/task_stusus_update.dart';
import 'package:taskmanagement/controller/page_view_controller/screen_controller.dart';
import 'package:taskmanagement/core/models/status_select_model/status_select_model.dart';

import 'package:taskmanagement/core/path/path.dart';

class CustomAboutDilog extends StatelessWidget {
  final String taskId;
  CustomAboutDilog({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        context.read<ApiRequestBloc>().add(
          StatusDropDownOpen(isStatusDropDownOpen: false),
        );
      },
      child: Consumer<TaskStususUpdate>(
        builder: (context, state, _) {
          return Stack(
            children: [
              Container(
                color: Colors.black.withOpacity(0.4),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Edit Status.",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TaskStususUpdate>()
                                  .statusDropDownOpen(!state.isDropDownOpen);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 9.sp),
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(
                                  int.parse(state.statusSelectModel.color),
                                ),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    state.statusSelectModel.icon,
                                    width: 35.sp,
                                    color: Color(0xffffffff),
                                  ),
                                  Gap(10.w),
                                  Text(
                                    state.statusSelectModel.StstusName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 18.sp,
                                          color: Color(0xffffffff),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Back"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<ScreenController>().Dilog(
                                    349757239475,
                                  );
                                  Navigator.pop(context);

                                  context
                                      .read<TaskStususUpdate>()
                                      .taskstatusUpdata(
                                        taskId,
                                        state.statusSelectModel.StstusName,
                                      );
                                },
                                child: Text("Update"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state.isDropDownOpen)
                Positioned(
                  top: 362.h,
                  left: 63.w,
                  right: 63.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(color: Colors.transparent),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TaskStususUpdate>()
                                  .statusDropDownOpen(!state.isDropDownOpen);
                              context.read<TaskStususUpdate>().statusSelection(
                                StatusSelectModel(
                                  color: '0xff05339C',
                                  StstusName: 'New',
                                  icon: 'assets/icon/checklist.png',
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 9.sp),
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xff05339C),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icon/checklist.png",
                                    width: 35.sp,
                                    color: Color(0xffffffff),
                                  ),
                                  Gap(10.w),
                                  Text(
                                    "New",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 17.sp,
                                          color: Color(0xffffffff),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TaskStususUpdate>()
                                  .statusDropDownOpen(!state.isDropDownOpen);
                              context.read<TaskStususUpdate>().statusSelection(
                                StatusSelectModel(
                                  color: '0xff22bf73',
                                  StstusName: 'Completed',
                                  icon: 'assets/icon/check-mark.png',
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 9.sp),
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xff22bf73),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icon/check-mark.png",
                                    width: 35.sp,
                                    color: Color(0xffffffff),
                                  ),
                                  Gap(10.w),
                                  Text(
                                    "Completed",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 18.sp,
                                          color: Color(0xffffffff),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TaskStususUpdate>()
                                  .statusDropDownOpen(!state.isDropDownOpen);
                              context.read<TaskStususUpdate>().statusSelection(
                                StatusSelectModel(
                                  color: '0xffDE1A58',
                                  StstusName: 'Canceled',
                                  icon: 'assets/icon/cancel.png',
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 9.sp),
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xffDE1A58),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icon/cancel.png",
                                    width: 35.sp,
                                    color: Color(0xffffffff),
                                  ),
                                  Gap(10.w),
                                  Text(
                                    "Canceled",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 18.sp,
                                          color: Color(0xffffffff),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Gap(10.h),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<TaskStususUpdate>()
                                  .statusDropDownOpen(!state.isDropDownOpen);
                              context.read<TaskStususUpdate>().statusSelection(
                                StatusSelectModel(
                                  color: '0xff360185',
                                  StstusName: 'Progress',
                                  icon: 'assets/icon/processing-time.png',
                                ),
                              );
                              context.read<ApiRequestBloc>().add(
                                StatusSelectEvent(
                                  StstusName: "Progress",
                                  color: "0xff360185",
                                  icon: "assets/icon/processing-time.png",
                                ),
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(left: 9.sp),
                              height: 45.h,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Color(0xff360185),
                                borderRadius: BorderRadius.circular(8.sp),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/icon/processing-time.png",
                                    width: 35.sp,
                                    color: Color(0xffffffff),
                                  ),
                                  Gap(10.w),
                                  Text(
                                    "Profress",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 18.sp,
                                          color: Color(0xffffffff),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
