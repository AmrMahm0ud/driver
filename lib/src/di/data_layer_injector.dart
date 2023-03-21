import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/src/core/utils/network/interceptor.dart';
import 'package:untitled/src/data/sources/local/shared_preference/shared_preferences_manager.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/add_task_service.dart';
import 'package:untitled/src/data/sources/remote/driver/api_key.dart';
import 'package:untitled/src/data/sources/remote/driver/login/login_api_service.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/tasks_service.dart';

final injector = GetIt.instance;

Future<void> initializeDataDependencies() async {
  injector.registerLazySingleton(() => Dio()
    ..options.baseUrl = ApiKeys.baseDevelopment
    ..interceptors.add(CustomInterceptors()));

  injector.registerFactory<LoginApiService>(() => LoginApiService(injector()));

  injector.registerLazySingleton<SharedPreferenceManager>(
      () => SharedPreferenceManager());

  injector.registerFactory<TasksApiService>(() => TasksApiService(injector()));
  injector.registerFactory<AddTaskService>(() => AddTaskService(injector()));
}
