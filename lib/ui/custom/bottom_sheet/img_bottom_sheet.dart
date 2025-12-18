// ignore_for_file: must_be_immutable, prefer_final_fields, prefer_const_constructors_in_immutables

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_bloc.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_event.dart';
import 'package:taskmanagement/controller/api_request_controller/bloc/api_request_state.dart';
import 'package:taskmanagement/core/path/path.dart';

class ImgBottomSheet extends StatefulWidget {
  ImgBottomSheet({super.key});

  @override
  State<ImgBottomSheet> createState() => _ImgBottomSheetState();
}

class _ImgBottomSheetState extends State<ImgBottomSheet> {
  late final TextEditingController controller;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 40.h),
      child: Container(
        padding: EdgeInsets.all(8),
        height: 300.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: Color(0xff22bf73).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: BlocBuilder<ApiRequestBloc, ApiRequestState>(
          builder: (context, state) {
            return Column(
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

                if (!state.imgUrlCheck) ...[
                  Gap(50.h),
                  Form(
                    key: _formKey,
                    child: TextFieldWidget(
                      errorText: state.imgUrlError,
                      controller: controller,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "enter img url";
                        }
                        return null;
                      },
                      hintText: "Enter Image URL",
                    ),
                  ),

                  Gap(40.h),
                  SizedBox(
                    width: 180.w,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<ApiRequestBloc>().add(
                            ImgUrlfatch(imgUrl: controller.text.trim()),
                          );
                          context.read<ApiRequestBloc>().add(
                            ImgLinkCheckEvent(imgUrlChe: true),
                          );
                        }
                      },
                      child: Text("Check Image"),
                    ),
                  ),
                ],
                if (state.imgUrlCheck) ...[
                  Gap(20.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(
                      radius: 60.sp,

                      child: Image.network(
                        state.imgUrl,
                        fit: BoxFit.cover,
                        width: double.maxFinite,
                        errorBuilder: (context, error, stackTrace) {
                          context.read<ApiRequestBloc>().add(
                            ImgUrlErrorM(imgUrlError: "img url error"),
                          );
                          context.read<ApiRequestBloc>().add(
                            ImgLinkCheckEvent(imgUrlChe: false),
                          );

                          return Container(
                            height: 120,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.broken_image,
                              color: Colors.red,
                              size: 40,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }

                          return SizedBox(
                            height: 120,
                            width: 120,
                            child: Center(
                              child: CircularProgressIndicator(
                                value:
                                    loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Gap(40.h),
                  SizedBox(
                    width: 180.w,
                    child: FilledButton(
                      onPressed: () async {
                        context.read<ApiRequestBloc>().add(ImgSelectMEvent());
                        context.read<ApiRequestBloc>().add(
                          ImgLinkCheckEvent(imgUrlChe: false),
                        );
                        Navigator.pop(context);
                      },
                      child: Text("Save"),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
