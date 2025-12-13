// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/page_view_controller/bloc/page_bloc.dart';

import '../../../core/path/path.dart';

class BottomNavebar extends StatelessWidget {
  final List<Widget>? pages;
  BottomNavebar({super.key, required this.pages});
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    context.read<PageBloc>();
    return Stack(
      children: [
        BlocBuilder<PageBloc, PageState>(
          builder: (context, state) {
            if (state is NewTasks) {
              _pageController.animateToPage(
                0,
                duration: Duration(milliseconds: 300),
                curve: Curves.elasticIn,
              );
            }
            if (state is Completed) {
              _pageController.animateToPage(
                1,
                duration: Duration(milliseconds: 300),
                curve: Curves.elasticIn,
              );
            }
            if (state is Canceld) {
              _pageController.animateToPage(
                2,
                duration: Duration(milliseconds: 300),
                curve: Curves.elasticIn,
              );
            }
            if (state is Progress) {
              _pageController.animateToPage(
                3,
                duration: Duration(milliseconds: 300),
                curve: Curves.elasticIn,
              );
            }
            return PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                state.copyWith(page: value);
              },
              itemBuilder: (context, index) {
                return pages?[state.page];
              },
            );
          },
        ),
        Positioned(
          bottom: 20.h,
          left: 10.w,
          right: 10.w,
          child: Container(
            padding: EdgeInsets.all(9.w),
            height: 60.h,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: Color(0xffffffff),
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black38)],
            ),
            child: BlocBuilder<PageBloc, PageState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    bottomButton(
                      context: context,
                      img: "assets/icon/checklist.png",
                      leble: "New Task",
                      index: 2,
                      btnColor: state.page == 0
                          ? Color(0xff22bf73)
                          : Colors.transparent,
                      textColor: state.page == 0
                          ? Color(0xffffffff)
                          : Colors.black,
                      shado: state.page == 0,
                      onTap: () => context.read<PageBloc>().add(NewTasks()),
                    ),
                    bottomButton(
                      context: context,
                      img: "assets/icon/check-mark.png",
                      leble: "Completed",
                      index: 2,
                      btnColor: state.page == 1
                          ? Color(0xff22bf73)
                          : Colors.transparent,
                      textColor: state.page == 1
                          ? Color(0xffffffff)
                          : Colors.black,
                      shado: state.page == 1,
                      onTap: () => context.read<PageBloc>().add(Completed()),
                    ),
                    bottomButton(
                      context: context,
                      img: "assets/icon/cancel.png",
                      leble: "Canceled",
                      index: 1,
                      btnColor: state.page == 2
                          ? Color(0xff22bf73)
                          : Colors.transparent,
                      textColor: state.page == 2
                          ? Color(0xffffffff)
                          : Colors.black,
                      shado: state.page == 2,
                      onTap: () => context.read<PageBloc>().add(Canceld()),
                    ),
                    bottomButton(
                      context: context,
                      img: "assets/icon/processing-time.png",
                      leble: "Progress",
                      index: 1,
                      btnColor: state.page == 3
                          ? Color(0xff22bf73)
                          : Colors.transparent,
                      textColor: state.page == 3
                          ? Color(0xffffffff)
                          : Colors.black,
                      shado: state.page == 3,
                      onTap: () => context.read<PageBloc>().add(Progress()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

////custom button
Widget bottomButton({
  required BuildContext context,
  required String img,
  required String leble,
  required int index,
  required Color btnColor,
  required Color textColor,
  required bool shado,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: double.maxFinite,
      width: 60.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.sp),
        color: btnColor,
        boxShadow: shado
            ? [BoxShadow(color: Colors.black38, blurRadius: 10)]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img, width: 25.sp, color: textColor),
          AutoSizeText(
            leble,
            minFontSize: 2,
            maxFontSize: double.maxFinite,
            style: Theme.of(
              context,
            ).textTheme.labelSmall?.copyWith(color: textColor),
          ),
        ],
      ),
    ),
  );
}
