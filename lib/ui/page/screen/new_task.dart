// ignore_for_file: prefer_is_empty, unnecessary_underscores, unrelated_type_equality_checks

import 'package:flutter/cupertino.dart';

import '../../../core/path/path.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xff05339C).withOpacity(0.4)),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<TaskDataController>().getTaskData();
        },
        child: Consumer<TaskDataController>(
          builder: (context, state, child) {
            if (!state.lodigSpin) {
              if (state.newTaskAll == 0 || state.newTaskAll.isEmpty) {
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
                  itemCount: state.newTaskAll.length,
                  itemBuilder: (context, index) {
                    final task = state.newTaskAll[index];
                    return Consumer<ScreenController>(
                      builder: (context, state, _) {
                        return TaskViewContainer(
                          borderColor: "0xff05339C",
                          date: task.createdDate,
                          status: task.status,
                          subTitel: task.description,
                          title: task.title,
                          isShow: index == state.dilog,
                          onLongPress: () {
                            context.read<ScreenController>().Dilog(index);
                            context.read<TaskStususUpdate>().statusSelection(
                              StatusSelectModel(
                                color: '0xff05339C',
                                StstusName: 'New',
                                icon: 'assets/icon/checklist.png',
                              ),
                            );
                          },
                          cancel: () {
                            context.read<ScreenController>().Dilog(
                              349757239475,
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
            if (state.lodigSpin) {
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
