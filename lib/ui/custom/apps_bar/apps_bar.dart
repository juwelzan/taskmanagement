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
                    child: Image.network(
                      state.userDataLocalModel!.photo.toString(),
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                ),
              ),
              Gap(10.w),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text:
                      "${state.userDataLocalModel?.firstName} ${state.userDataLocalModel?.lastName}",
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: state.userDataLocalModel?.email,
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
