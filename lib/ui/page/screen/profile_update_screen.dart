// ignore_for_file: must_be_immutable

import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/controller/api_request_controller/profile_update_controller.dart';
import 'package:taskmanagement/core/models/udate_profile_model/udate_profile_model.dart';
import 'package:taskmanagement/core/path/path.dart';
import 'package:taskmanagement/ui/custom/bottom_sheet/img_bottom_sheet.dart';

class ProfileUpdateScreen extends StatelessWidget {
  ProfileUpdateScreen({super.key});
  TextEditingController lastName = TextEditingController();
  TextEditingController fastName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Consumer2<ProfileUpdateController, GetProfileData>(
          builder: (context, profileupdate, profiledata, _) {
            lastName.text = profiledata.userProfileModel.lastName ?? "";
            fastName.text = profiledata.userProfileModel.firstName ?? "";
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(30.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: Image.asset("assets/icon/back.png", width: 30.sp),
                      ),
                    ],
                  ),
                  Gap(60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Update Profile",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ],
                  ),
                  Gap(20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) => ImgBottomSheet(),
                          );
                        },
                        child: Container(
                          height: 80.h,
                          width: 80.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color(0xff22bf73),
                            ),
                            borderRadius: BorderRadius.circular(100.w),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.w),
                            child: profiledata.image != null
                                ? Image.file(
                                    profiledata.image!,
                                    fit: BoxFit.cover,
                                    width: double.maxFinite,
                                  )
                                : Center(
                                    child: Icon(Icons.person, size: 40.sp),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(20.h),
                  TextFieldWidget(hintText: "Fast Name", controller: fastName),
                  Gap(20.h),
                  TextFieldWidget(hintText: "Last Name", controller: lastName),
                  Gap(50.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.pop(context);
                        },
                        child: Text("Back"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ProfileUpdateController>().profileUpdate(
                            fastName.text,
                            lastName.text,
                          );
                        },
                        child: Text("Update"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
