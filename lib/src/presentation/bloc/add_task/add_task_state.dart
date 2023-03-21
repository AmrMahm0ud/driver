import 'package:equatable/equatable.dart';

abstract class AddTaskState extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class InitialAddTaskState extends AddTaskState {}

class LoadingAddTaskState extends AddTaskState {}

class SuccessAddTaskState extends AddTaskState {}

class FailAddTaskState extends AddTaskState {
  final String errorMassage;

  FailAddTaskState({required this.errorMassage});
}

class PopAddTaskDialogState extends AddTaskState {}
