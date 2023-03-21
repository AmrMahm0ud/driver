import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/flavors.dart';
import 'package:untitled/src/config/theme/color_manager.dart';
import 'package:untitled/src/core/resources/image_paths.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_bloc.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_event.dart';
import 'package:untitled/src/presentation/screens/tasks/widget/task_card_widget.dart';
import 'package:untitled/src/presentation/widgets/container_with_icon_widget.dart';

class TasksScreenContent extends StatelessWidget {
  final List<Task> tasks;

  const TasksScreenContent({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        elevation: 0,
        title: Text(
          "Tasks Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Flavors.name != "DRIVER"
              ? Padding(
                  padding: const EdgeInsetsDirectional.only(
                      end: 16, top: 10, bottom: 8),
                  child: ContainerWithIconWidget(
                      backgroundColor: ColorManager.error,
                      borderRadius: 8,
                      width: 40,
                      height: 20,
                      iconColor: ColorManager.white,
                      iconPath: ImagePaths.addSelect,
                      onTap: () {
                        BlocProvider.of<TasksBloc>(context)
                            .add(NavigateToAddTaskScreenEvent());
                      }))
              : const SizedBox(),
        ],
      ),
      body: tasks.isEmpty
          ? Center(
              child: Text("No data found",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      color: ColorManager.error,
                      fontWeight: FontWeight.bold)))
          : ListView.builder(
              itemBuilder: (context, index) {
                return TaskCardWidget(
                    task: tasks[index],
                    onItemTap: () {
                      if (Flavors.name == "DRIVER") {
                        BlocProvider.of<TasksBloc>(context).add(
                            NavigateToTaskDetailScreenEvent(
                                task: tasks[index]));
                      }
                    });
              },
              itemCount: tasks.length),
    );
  }
}
