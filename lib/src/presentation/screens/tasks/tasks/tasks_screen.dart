import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/flavors.dart';
import 'package:untitled/src/core/base/widget/base_stateful_widget.dart';
import 'package:untitled/src/core/utils/dialogs/show_ok_dialog.dart';
import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_manager.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_bloc.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_event.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_state.dart';
import 'package:untitled/src/presentation/screens/tasks/add_task/add_task_screen.dart';
import 'package:untitled/src/presentation/screens/tasks/task_detail/task_detail_screen.dart';
import 'package:untitled/src/presentation/screens/tasks/tasks/widget/tasks_screen_content.dart';

class TasksScreen extends BaseStatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _TasksScreenState();
}

class _TasksScreenState extends BaseState<TasksScreen> {
  Task? selectedTask;
  List<Task> tasks = [];

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (Flavors.name != "DRIVER") {
      await SharedPreferenceManager().setUserId(0);
    }
    BlocProvider.of<TasksBloc>(context).add(GetTasksEvent());
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
        if (state is LoadingTasksState) {
          showLoading();
        } else {
          hideLoading();
        }
        if (state is NavigateToDetailScreenState) {
          selectedTask = state.task;
          _navigateToTaskDetailScreen();
        } else if (state is SuccessApiTasksState) {
          tasks = state.tasks;
        } else if (state is FailApiTasksState) {
          showOkDialog(
              context: context,
              onTap: () {
                _popEvent();
              },
              dialogMessage: state.errorMassage);
        } else if (state is PopTasksDialogState) {
          _pop();
        } else if (state is NavigateToAddTaskScreenState) {
          _navigateToAddTaskScreen();
        }
      },
      builder: (context, state) {
        return Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(child: TasksScreenContent(tasks: tasks)),
          ],
        );
      },
    );
  }

  Future<void> _navigateToTaskDetailScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TaskDetailScreen(task: selectedTask!)),
    ).then((value) {
      BlocProvider.of<TasksBloc>(context).add(GetTasksEvent());
    });
  }

  Future<void> _navigateToAddTaskScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    ).then((value) {
      BlocProvider.of<TasksBloc>(context).add(GetTasksEvent());
    });
  }

  void _pop() {
    Navigator.of(context).pop();
  }

  void _popEvent() {
    BlocProvider.of<TasksBloc>(context).add(PopTasksEvent());
  }
}
