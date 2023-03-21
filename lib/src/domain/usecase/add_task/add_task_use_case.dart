import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/request/add_task_request.dart';
import 'package:untitled/src/domain/repositories/add_task/add_task_repository.dart';

class AddTaskUseCase {
  final AddTaskRepository _addTaskRepository;

  AddTaskUseCase(this._addTaskRepository);

  Future<DataState> call(AddTaskRequest addTaskRequest) async {
    return await _addTaskRepository.addTask(addTaskRequest);
  }
}
