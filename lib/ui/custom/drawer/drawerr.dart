import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/path/path.dart';
import 'package:taskmanagement/ui/custom/alert_bottom_sheet/alert_bottom_sheet.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 50.h, left: 10.w, right: 10.w),
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(color: Color(0xff22bf73).withOpacity(0.2)),

        child: BlocBuilder<ApiRequestBloc, ApiRequestState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45.sp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 2, color: Color(0xff22bf73)),
                      ),
                      child: Image.network(
                        state.userDataLocalModel!.photo.toString(),
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Icon(Icons.error));
                        },
                      ),
                    ),
                  ),
                ),
                Gap(10.h),
                Text(
                  "${state.userDataLocalModel?.firstName} ${state.userDataLocalModel?.lastName}",
                ),
                Gap(1.h),
                Text("${state.userDataLocalModel?.email} "),
                Gap(10.h),
                Divider(),
                Gap(10.h),
                Container(
                  height: 40.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Color(0xff22bf73),
                    borderRadius: BorderRadius.circular(7.sp),
                  ),
                  child: ListTile(
                    leading: SvgPicture.asset(
                      "assets/profile-circle-svgrepo-com.svg",
                      width: 35.w,
                    ),
                    title: Text("Profile"),
                    trailing: SvgPicture.asset(
                      "assets/arrow-next-small-svgrepo-com.svg",
                      width: 35.w,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(),
                      Gap(10.h),
                      Container(
                        height: 40.h,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Color(0xff22bf73),
                          borderRadius: BorderRadius.circular(7.sp),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                            "assets/error-svgrepo-com.svg",
                            width: 35.w,
                          ),
                          title: Text("Logout"),
                          trailing: SvgPicture.asset(
                            "assets/arrow-right-svgrepo-com.svg",
                            width: 30.w,
                          ),
                          onTap: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return AlertBottomSheet(
                                  titel: "Do you want to Logout",
                                  onTapCancel: () {
                                    Navigator.pop(context);
                                  },
                                  onTapYes: () {
                                    Navigator.pop(context);
                                    context.read<ApiRequestBloc>().add(
                                      LogoutUser(),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Gap(40.h),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
