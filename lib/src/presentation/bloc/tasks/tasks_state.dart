import 'package:equatable/equatable.dart';
import 'package:untitled/src/domain/entities/task/task.dart';

abstract class TasksState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class InitialTasksState extends TasksState {}

class LoadingTasksState extends TasksState {}

class NetworkErrorTasksState extends TasksState {
  final String errorMassage;

  NetworkErrorTasksState({required this.errorMassage});

  @override
  List<Object?> get props => [errorMassage];
}

class SuccessApiTasksState extends TasksState {
  final List<Task> tasks;

  SuccessApiTasksState({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class FailApiTasksState extends TasksState {
  final String errorMassage;

  FailApiTasksState({required this.errorMassage});

  @override
  List<Object?> get props => [errorMassage];
}

class NavigateToDetailScreenState extends TasksState {
  final Task task;

  NavigateToDetailScreenState({required this.task});

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PopTasksDialogState extends TasksState {}

class SuccessChangeStatusApiTaskState extends TasksState {}

class FailChangeStatusApiTaskState extends TasksState {
  final String errorMassage;

  FailChangeStatusApiTaskState({required this.errorMassage});
}

class NavigateToAddTaskScreenState extends TasksState {}
