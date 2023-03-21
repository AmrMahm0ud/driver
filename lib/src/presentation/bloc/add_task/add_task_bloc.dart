import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/request/add_task_request.dart';
import 'package:untitled/src/domain/usecase/add_task/add_task_use_case.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_event.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  final AddTaskUseCase _addTaskUseCase;

  AddTaskBloc(this._addTaskUseCase) : super(InitialAddTaskState()) {
    on<AddTaskApiEvent>(_onAddTaskApiEvent);
    on<PopAddTaskDialogEvent>(_onPopAddTaskDialogEvent);
  }

  Future<void> _onAddTaskApiEvent(
      AddTaskApiEvent event, Emitter<AddTaskState> emit) async {
    emit(LoadingAddTaskState());
    DataState dataState = await _addTaskUseCase.call(AddTaskRequest(
        orderId: 0,
        orderStatus: 1,
        orderAmount: event.orderAmount,
        cod: event.cod,
        assignedTo: event.assignedTo));
    if (dataState is DataSuccess) {
      emit(SuccessAddTaskState());
    } else if (dataState is DataFailed) {
      emit(FailAddTaskState(
          errorMassage: dataState.error?.message ?? "Try again later"));
    }
  }

  void _onPopAddTaskDialogEvent(
      PopAddTaskDialogEvent event, Emitter<AddTaskState> emit) {
    emit(PopAddTaskDialogState());
  }
}
