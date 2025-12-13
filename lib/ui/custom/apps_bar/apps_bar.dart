import '../../../core/path/path.dart';

class AppsBar extends StatelessWidget implements PreferredSizeWidget {
  const AppsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff21bf73),
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.sp),
            child: CircleAvatar(
              radius: 25,
              child: Image.network(
                "https://drive.google.com/uc?export=view&id=1AdeBXMKx6_W97n1Mr2Qz2qKs_3q-3b1Q",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          Gap(10.w),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: "Md Juwel Rana",
              style: Theme.of(context).textTheme.headlineSmall,
              children: [
                TextSpan(text: "\n"),
                TextSpan(
                  text: "juwel@gmail.com",
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall?.copyWith(fontSize: 10.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50.h);
}
