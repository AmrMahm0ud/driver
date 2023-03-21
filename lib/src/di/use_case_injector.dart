import 'package:untitled/src/di/data_layer_injector.dart';
import 'package:untitled/src/domain/usecase/add_task/add_task_use_case.dart';
import 'package:untitled/src/domain/usecase/login/login_use_case.dart';
import 'package:untitled/src/domain/usecase/login/set_user_id_use_case.dart';
import 'package:untitled/src/domain/usecase/tasks/change_task_order_use_case.dart';
import 'package:untitled/src/domain/usecase/tasks/get_tasks_use_case.dart';

Future<void> initializeUseCaseDependencies() async {
  injector.registerFactory<LoginUseCase>(() => LoginUseCase(injector()));
  injector
      .registerFactory<SetUserIdUseCase>(() => SetUserIdUseCase(injector()));
  injector.registerFactory<GetTasksUseCase>(() => GetTasksUseCase(injector()));
  injector.registerFactory<ChangeTaskOrderUseCase>(
      () => ChangeTaskOrderUseCase(injector()));
  injector.registerFactory<AddTaskUseCase>(() => AddTaskUseCase(injector()));
}
