// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:taskmanagement/core/path/path.dart';

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

        child: Consumer<GetProfileData>(
          builder: (context, state, _) {
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
                      child: state.image != null
                          ? Image.file(
                              state.image!,
                              fit: BoxFit.cover,
                              width: double.maxFinite,
                            )
                          : Center(child: Icon(Icons.person, size: 40.sp)),
                    ),
                  ),
                ),
                Gap(10.h),
                Text(
                  "${state.userProfileModel.firstName} ${state.userProfileModel.lastName}",
                ),
                Gap(1.h),
                Text("${state.userProfileModel.email} "),
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
                    onTap: () {
                      context.push("/profile");
                    },
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
                                    context
                                        .read<LogoutController>()
                                        .logoutUser();
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
