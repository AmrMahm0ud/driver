import 'package:equatable/equatable.dart';
import 'package:untitled/src/domain/entities/task/task.dart';

abstract class TasksEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetTasksEvent extends TasksEvent {}

class NavigateToTaskDetailScreenEvent extends TasksEvent {
  final Task task;

  NavigateToTaskDetailScreenEvent({required this.task});

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PopTasksEvent extends TasksEvent {}

class ChangeTaskStatusOrderEvent extends TasksEvent {
  final int orderId, orderStatus;

  ChangeTaskStatusOrderEvent(
      {required this.orderStatus, required this.orderId});
}


class PopDialogTasksEvent extends TasksEvent {}

class NavigateToAddTaskScreenEvent extends TasksEvent {}
