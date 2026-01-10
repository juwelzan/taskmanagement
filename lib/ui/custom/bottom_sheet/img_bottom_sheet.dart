// ignore_for_file: must_be_immutable, prefer_final_fields, prefer_const_constructors_in_immutables

import 'package:taskmanagement/core/path/path.dart';

class ImgBottomSheet extends StatelessWidget {
  ImgBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 40.h),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 200.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Color(0xff22bf73),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),

            Gap(10.h),
            Text("Select Profile Photo"),
            Gap(60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 109.w,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffffff),
                      foregroundColor: Color(0xff000000),
                    ),
                    onPressed: () {
                      context.read<ImgPikGallery>().imagePikGallery();
                    },
                    label: Text("Gallery"),
                    icon: Icon(Icons.photo),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: 109.w,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffffffff),
                      foregroundColor: Color(0xff000000),
                    ),
                    onPressed: () {
                      context.read<CameraImgPikController>().imagePikCamera();
                    },
                    label: Text("Camera"),
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
