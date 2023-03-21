import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_response.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/request/change_status_request.dart';
import 'package:untitled/src/domain/repositories/tasks/tasks_repository.dart';

class ChangeTaskOrderUseCase {
  final TasksRepository _tasksRepository;

  ChangeTaskOrderUseCase(this._tasksRepository);

  Future<DataState<DriverResponse<List>>> call(
      ChangeStatusTaskRequest changeStatusTaskRequest) async {
    return await _tasksRepository.changeTasksStatus(changeStatusTaskRequest);
  }
}
