import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/path/path.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackGroundWidget(
        child: BlocBuilder<ApiRequestBloc, ApiRequestState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  Gap(40.h),
                  Text(
                    "Profile",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Gap(30.h),
                  Container(
                    height: 80.h,
                    width: 80.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xff22bf73)),
                      borderRadius: BorderRadius.circular(100.w),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.w),
                      child: Image.network(
                        "${state.userDataLocalModel?.photo}",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Center(child: Icon(Icons.error)),
                      ),
                    ),
                  ),
                  Gap(10),
                  TextButton(
                    onPressed: () {
                      context.push("/profileupdate");
                    },
                    child: Text("Edit"),
                  ),
                  Gap(10.h),
                  SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name:",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "${state.userDataLocalModel?.firstName} ${state.userDataLocalModel?.lastName}",
                        ),
                        Gap(10.h),
                        Text(
                          "Mobile:",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text("${state.userDataLocalModel?.mobile}"),
                        Gap(10.h),
                        Text(
                          "Email:",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text("${state.userDataLocalModel?.email}"),
                      ],
                    ),
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
