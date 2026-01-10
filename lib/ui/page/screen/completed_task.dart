// ignore_for_file: prefer_is_empty, unnecessary_underscores, deprecated_member_use

import 'package:flutter/cupertino.dart';

import '../../../core/path/path.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xff22bf73).withOpacity(0.4)),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<TaskDataController>().getTaskData();
        },
        child: Consumer<TaskDataController>(
          builder: (context, apiState, child) {
            if (!apiState.lodigSpin) {
              if (apiState.completedTaskAll.length == 0 ||
                  apiState.completedTaskAll.isEmpty) {
                return ListView(
                  children: [
                    SizedBox(
                      height: 550.h,
                      child: Center(child: Text("No Task")),
                    ),
                  ],
                );
              } else {
                return ListView.separated(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    left: 10.w,
                    right: 10.w,
                    bottom: 150.h,
                  ),
                  itemCount: apiState.completedTaskAll.length,
                  itemBuilder: (context, index) {
                    final task = apiState.completedTaskAll[index];
                    print(task.createdDate);
                    return Consumer<ScreenController>(
                      builder: (context, state, _) {
                        return TaskViewContainer(
                          borderColor: "0xff22bf73",
                          date: task.createdDate,
                          status: task.status,
                          subTitel: task.description,
                          title: task.title,
                          isShow: index == state.dilog,
                          onLongPress: () {
                            context.read<ScreenController>().Dilog(index);
                            context.read<TaskStususUpdate>().statusSelection(
                              StatusSelectModel(
                                color: '0xff22bf73',
                                StstusName: 'Completed',
                                icon: 'assets/icon/check-mark.png',
                              ),
                            );
                          },
                          edit: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: false,
                              barrierLabel: "",
                              barrierColor: Colors.transparent,
                              pageBuilder: (_, __, ___) {
                                return CustomAboutDilog(taskId: task.id);
                              },
                            );
                          },
                          cancel: () {
                            context.read<ScreenController>().Dilog(
                              349757239475,
                            );
                          },
                          delete: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => AlertBottomSheet(
                                titel: "Delete the task?",
                                onTapCancel: () => Navigator.pop(context),
                                onTapYes: () {
                                  context
                                      .read<DeleteTaskController>()
                                      .deleteTask(task.id);
                                  Navigator.pop(context);
                                  context.read<ScreenController>().Dilog(
                                    349757239475,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Gap(10),
                );
              }
            }
            if (apiState.lodigSpin) {
              return ListView.separated(
                itemBuilder: (_, _) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: CardLoading(
                    height: 100.h,
                    borderRadius: BorderRadius.circular(10.sp),
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                separatorBuilder: (_, _) => Gap(0),
                itemCount: 100,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
