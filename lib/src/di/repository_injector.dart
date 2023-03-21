import 'package:untitled/src/data/repositories/add_task/add_task_repository_implementation.dart';
import 'package:untitled/src/data/repositories/login/login_in_repository_implementation.dart';
import 'package:untitled/src/data/repositories/tasks/tasks_repository_implementation.dart';
import 'package:untitled/src/di/data_layer_injector.dart';
import 'package:untitled/src/domain/repositories/add_task/add_task_repository.dart';
import 'package:untitled/src/domain/repositories/login/login_repository.dart';
import 'package:untitled/src/domain/repositories/tasks/tasks_repository.dart';

Future<void> initializeRepositoryDependencies() async {
  injector.registerFactory<LoginRepository>(
      () => LoginRepositoryImplementation(injector()));

  injector.registerFactory<TasksRepository>(
      () => TasksRepositoryImplementation(injector()));

  injector.registerFactory<AddTaskRepository>(
      () => AddTaskRepositoryImplementation(injector()));
}
