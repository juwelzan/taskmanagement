import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
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
        child: BlocBuilder<ApiRequestBloc, ApiRequestState>(
          builder: (context, state) {
            lastName.text = state.userDataLocalModel?.lastName ?? "";
            fastName.text = state.userDataLocalModel?.firstName ?? "";
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                          child: Image.network(
                            state.imgUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Center(
                                  child: Icon(
                                    Icons.broken_image_rounded,
                                    size: 60.sp,
                                  ),
                                ),
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
                        context.read<ApiRequestBloc>().add(
                          ProfileUpdateEvent(
                            profileUpdate: UdateProfileModel(
                              lastName: lastName.text,
                              firstName: fastName.text,
                              photo: state.imgUrl,
                            ),
                          ),
                        );
                      },
                      child: Text("Update"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
