// ignore_for_file: prefer_final_fields

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/core/models/new_task_add_model/new_task_add_model.dart';
import 'package:taskmanagement/core/path/path.dart';
import 'package:taskmanagement/ui/custom/drawer/drawerr.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> _formState = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      key: _globalKey,
      appBar: AppsBar(dowerOpen: () => _globalKey.currentState?.openDrawer()),
      drawer: Drawerr(),

      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(color: Color(0xff22bf73).withOpacity(0.2)),
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(90.h),
                  Text(
                    "Add New Task",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Gap(20.h),
                  TextFieldWidget(
                    hintText: "Title",
                    controller: titleController,
                    validator: (value) {
                      if (value.toString().isEmpty ||
                          value == "" ||
                          value == null) {
                        return "fill this out.";
                      }
                      return null;
                    },
                  ),
                  Gap(20.h),
                  TextFieldWidget(
                    hintText: "Description",
                    maxLines: 6,
                    controller: descriptionController,
                    validator: (value) {
                      if (value.toString().isEmpty ||
                          value == "" ||
                          value == null) {
                        return "fill this out.";
                      }
                      return null;
                    },
                  ),
                  Gap(40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.h,
                        width: 100.w,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Back"),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                        width: 100.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formState.currentState!.validate()) {
                              context.read<ApiRequestBloc>().add(
                                AddNewTaskEvent(
                                  addNewTaskModel: AddNewTaskModel(
                                    title: titleController.text,
                                    description: titleController.text,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text("Save"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
