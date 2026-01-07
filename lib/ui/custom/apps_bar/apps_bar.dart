import 'dart:io';

import '../../../core/path/path.dart';

class AppsBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? dowerOpen;
  const AppsBar({super.key, this.dowerOpen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff21bf73),
      title: Consumer<GetProfileData>(
        builder: (context, state, _) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.sp),
                child: CircleAvatar(
                  radius: 25,
                  child: GestureDetector(
                    onTap: dowerOpen,
                    child: state.image != ""
                        ? Image.file(
                            File(state.image),
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
                      "${state.userProfileModel.firstName} ${state.userProfileModel.lastName}",
                  style: Theme.of(context).textTheme.headlineSmall,
                  children: [
                    TextSpan(text: "\n"),
                    TextSpan(
                      text: state.userProfileModel.email,
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
