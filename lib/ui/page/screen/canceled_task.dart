// ignore_for_file: prefer_is_empty, deprecated_member_use, unnecessary_underscores

import 'package:flutter/cupertino.dart';

import '../../../core/path/path.dart';

class CanceledTask extends StatelessWidget {
  const CanceledTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xffDE1A58).withOpacity(0.4)),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<TaskDataController>().getTaskData();
        },
        child: Consumer<TaskDataController>(
          builder: (context, apiState, child) {
            if (!apiState.lodigSpin) {
              if (apiState.canceledTaskAll.length == 0 ||
                  apiState.canceledTaskAll.isEmpty) {
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
                  itemCount: apiState.canceledTaskAll.length,
                  itemBuilder: (context, index) {
                    final task = apiState.canceledTaskAll[index];
                    return Consumer2<ScreenController, TaskStususUpdate>(
                      builder: (context, state, taskstutus, _) {
                        return TaskViewContainer(
                          borderColor: "0xffDE1A58",
                          date: task.createdDate,
                          status: task.status,
                          subTitel: task.description,
                          title: task.title,
                          isShow: index == state.dilog,
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
                          onLongPress: () {
                            context.read<ScreenController>().Dilog(index);
                            context.read<TaskStususUpdate>().statusSelection(
                              StatusSelectModel(
                                color: '0xffDE1A58',
                                StstusName: 'Canceled',
                                icon: 'assets/icon/cancel.png',
                              ),
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
