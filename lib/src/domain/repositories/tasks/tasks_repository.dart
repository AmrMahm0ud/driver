import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_response.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/request/change_status_request.dart';
import 'package:untitled/src/domain/entities/task/task.dart';

abstract class TasksRepository {
  Future<DataState<List<Task>>> getTasks();

  Future<DataState<DriverResponse<List>>> changeTasksStatus(
      ChangeStatusTaskRequest changeStateRequest);
}
