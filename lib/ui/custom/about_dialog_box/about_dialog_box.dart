import 'package:flutter/material.dart';
import 'package:taskmanagement/core/path/path.dart';

class AboutDialogBox extends StatelessWidget {
  const AboutDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 300.w,
      decoration: BoxDecoration(color: Color(0xff22bf73)),
    );
  }
}
