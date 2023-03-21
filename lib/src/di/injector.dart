import 'package:untitled/src/di/bloc_injector.dart';
import 'package:untitled/src/di/data_layer_injector.dart';
import 'package:untitled/src/di/repository_injector.dart';
import 'package:untitled/src/di/use_case_injector.dart';

Future<void> initializeDependencies() async {
  await initializeDataDependencies();
  await initializeRepositoryDependencies();
  await initializeUseCaseDependencies();
  await initializeBlocDependencies();
}
