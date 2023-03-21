import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/base/widget/base_stateful_widget.dart';
import 'package:untitled/src/core/utils/dialogs/show_ok_dialog.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_bloc.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_event.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_state.dart';
import 'package:untitled/src/presentation/screens/tasks/task_detail/widget/task_detail_content.dart';

class TaskDetailScreen extends BaseStatefulWidget {
  final Task task;

  const TaskDetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends BaseState<TaskDetailScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is LoadingTasksState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is FailChangeStatusApiTaskState) {
          showOkDialog(
              context: context,
              onTap: () {
                _popEvent();
              },
              dialogMessage: state.errorMassage);
        } else if (state is SuccessChangeStatusApiTaskState) {
          _pop();
        }
      },
      builder: (context, state) {
        return TaskDetailContent(task: widget.task);
      },
    );
  }

  void _pop() {
    Navigator.of(context).pop();
  }

  _popEvent() {
    BlocProvider.of<TasksBloc>(context).add(PopDialogTasksEvent());
  }
}
