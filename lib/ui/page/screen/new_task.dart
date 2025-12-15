import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskmanagement/controller/page_view_controller/bloc/page_bloc.dart';
import 'package:taskmanagement/ui/custom/task_view_container/task_view_container.dart';

import '../../../core/path/path.dart';

class NewTask extends StatelessWidget {
  const NewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.only(
            top: 30.h,
            left: 10.w,
            right: 10.w,
            bottom: 150.h,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return TaskViewContainer(
              isShow: index == state.dilogOpen,
              onLongPress: () {
                context.read<PageBloc>().add(Dilog(index: index));
              },
              cancel: () {
                context.read<PageBloc>().add(Dilog(index: 349757239475));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => Gap(10),
        );
      },
    );
  }
}
