import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/request/add_task_request.dart';

abstract class  AddTaskRepository {
  Future<DataState<List>> addTask(AddTaskRequest addTaskRequest);
}
