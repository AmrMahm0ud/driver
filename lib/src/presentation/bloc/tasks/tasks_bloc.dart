import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/request/change_status_request.dart';
import 'package:untitled/src/domain/usecase/tasks/change_task_order_use_case.dart';
import 'package:untitled/src/domain/usecase/tasks/get_tasks_use_case.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_event.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final GetTasksUseCase _getTasksUseCase;
  final ChangeTaskOrderUseCase _changeTaskOrderUseCase;

  TasksBloc(this._getTasksUseCase, this._changeTaskOrderUseCase)
      : super(InitialTasksState()) {
    on<NavigateToTaskDetailScreenEvent>(_onNavigateToTaskDetailScreenEvent);
    on<GetTasksEvent>(_onGetTasksEvent);
    on<PopTasksEvent>(_onPopTasksEvent);
    on<ChangeTaskStatusOrderEvent>(_onChangeTaskStatusOrderEvent);
    on<PopDialogTasksEvent>(_onPopDialogTasksEvent);
    on<NavigateToAddTaskScreenEvent>(_onNavigateToAddTaskScreenEvent);
  }

  void _onNavigateToTaskDetailScreenEvent(
      NavigateToTaskDetailScreenEvent event, Emitter<TasksState> emit) {
    emit(NavigateToDetailScreenState(task: event.task));
  }

  Future<void> _onGetTasksEvent(
      GetTasksEvent event, Emitter<TasksState> emit) async {
    emit(LoadingTasksState());

    DataState dataState = await _getTasksUseCase.call();
    if (dataState is DataSuccess) {
      emit(SuccessApiTasksState(tasks: dataState.data));
    } else if (dataState is DataFailed) {
      emit(FailApiTasksState(errorMassage: dataState.error?.message ?? ""));
    }
  }

  Future<void> _onChangeTaskStatusOrderEvent(
      ChangeTaskStatusOrderEvent event, Emitter<TasksState> emit) async {
    emit(LoadingTasksState());
    DataState dataState = await _changeTaskOrderUseCase.call(
        ChangeStatusTaskRequest(
            orderId: event.orderId, orderStatus: event.orderStatus));
    if (dataState is DataSuccess) {
      emit(SuccessChangeStatusApiTaskState());
    } else if (dataState is DataFailed) {
      emit(FailChangeStatusApiTaskState(
          errorMassage: dataState.error?.message ?? ""));
    }
  }

  void _onPopTasksEvent(PopTasksEvent event, Emitter<TasksState> emit) {
    emit(PopTasksDialogState());
  }

  void _onPopDialogTasksEvent(
      PopDialogTasksEvent event, Emitter<TasksState> emit) {
    emit(PopTasksDialogState());
  }

  void _onNavigateToAddTaskScreenEvent(
      NavigateToAddTaskScreenEvent event, Emitter<TasksState> emit) {
    emit(NavigateToAddTaskScreenState());
  }
}
