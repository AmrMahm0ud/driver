import 'package:untitled/src/di/data_layer_injector.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:untitled/src/presentation/bloc/login/login_bloc.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_bloc.dart';

Future<void> initializeBlocDependencies() async {
  injector.registerFactory<LoginBloc>(
      () => LoginBloc(injector(), injector(), injector()));
  injector.registerFactory<TasksBloc>(() => TasksBloc(injector(), injector()));
  injector.registerFactory<AddTaskBloc>(() => AddTaskBloc(injector()));
}
