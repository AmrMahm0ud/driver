import 'package:equatable/equatable.dart';

abstract class AddTaskEvent extends Equatable {
  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AddTaskApiEvent extends AddTaskEvent {
  final int? orderAmount, cod, assignedTo;

  AddTaskApiEvent(
      {required this.orderAmount, required this.cod, required this.assignedTo});
}

class PopAddTaskDialogEvent extends AddTaskEvent {}
