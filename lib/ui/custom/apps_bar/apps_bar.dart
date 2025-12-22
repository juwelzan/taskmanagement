import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';

import '../../../core/path/path.dart';

class AppsBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? dowerOpen;
  const AppsBar({super.key, this.dowerOpen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff21bf73),
      title: BlocBuilder<ApiRequestBloc, ApiRequestState>(
        builder: (context, state) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.sp),
                child: CircleAvatar(
                  radius: 25,
                  child: GestureDetector(
                    onTap: dowerOpen,
                    child: state.profileImg != null
                        ? Image.file(
                            state.profileImg!,
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                          )
                        : Center(child: Icon(Icons.person, size: 40.sp)),
                  ),
                ),
              ),
              Gap(10.w),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text:
                      "${state.userProfileModel?.firstName} ${state.userProfileModel?.lastName}",
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: state.userProfileModel?.email,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(fontSize: 10.sp),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50.h);
}
