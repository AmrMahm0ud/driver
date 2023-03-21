import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/domain/repositories/tasks/tasks_repository.dart';

class GetTasksUseCase {
  final TasksRepository _tasksRepository;

  GetTasksUseCase(this._tasksRepository);

  Future<DataState<List<Task>>> call() async {
    return await _tasksRepository.getTasks();
  }
}
