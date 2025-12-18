// ignore_for_file: prefer_is_empty

import 'package:card_loading/card_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/controller/page_view_controller/bloc/page_bloc.dart';
import 'package:taskmanagement/ui/custom/alert_bottom_sheet/alert_bottom_sheet.dart';
import 'package:taskmanagement/ui/custom/task_view_container/task_view_container.dart';

import '../../../core/path/path.dart';

class CanceledTask extends StatelessWidget {
  const CanceledTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(color: Color(0xff22bf73).withOpacity(0.2)),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<ApiRequestBloc>().add(GetTaskDataEvent());
        },
        child: BlocBuilder<ApiRequestBloc, ApiRequestState>(
          builder: (context, apiState) {
            if (!apiState.lodingSpin) {
              if (apiState.canceletTaskData!.length == 0 ||
                  apiState.canceletTaskData!.isEmpty) {
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
                  itemCount: apiState.canceletTaskData!.length,
                  itemBuilder: (context, index) {
                    final task = apiState.canceletTaskData?[index];
                    return BlocBuilder<PageBloc, PageState>(
                      builder: (context, pageState) {
                        return TaskViewContainer(
                          date: task?.createdDate,
                          status: task?.status,
                          subTitel: task?.description,
                          title: task?.title,
                          isShow: index == pageState.dilogOpen,
                          edit: () {
                            // showAboutDialog(context: (context)=>)
                          },
                          onLongPress: () {
                            context.read<PageBloc>().add(Dilog(index: index));
                          },
                          cancel: () {
                            context.read<PageBloc>().add(
                              Dilog(index: 349757239475),
                            );
                          },
                          delete: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => AlertBottomSheet(
                                titel: "Delete the task?",
                                onTapCancel: () => Navigator.pop(context),
                                onTapYes: () {
                                  context.read<ApiRequestBloc>().add(
                                    DeleteTaskEvent(id: task!.id),
                                  );
                                  Navigator.pop(context);
                                  context.read<PageBloc>().add(
                                    Dilog(index: 349757239475),
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
            if (apiState.lodingSpin) {
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
