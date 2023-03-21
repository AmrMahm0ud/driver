import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/add_task_service.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/request/add_task_request.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_request.dart';
import 'package:untitled/src/domain/repositories/add_task/add_task_repository.dart';

class AddTaskRepositoryImplementation extends AddTaskRepository {
  final AddTaskService _addTaskService;

  AddTaskRepositoryImplementation(this._addTaskService);

  @override
  Future<DataState<List>> addTask(AddTaskRequest addTaskRequest) async {
    DriverRequest<AddTaskRequest> driverRequest =
        await DriverRequest<AddTaskRequest>().createRequest(T: addTaskRequest);
    final httpResponse = await _addTaskService.addTask(driverRequest);

    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.resultCode == 1) {
          return DataSuccess(httpResponse.data.data!);
        } else {
          return DataFailed(DioError(
            error: httpResponse.data.resultMassage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
          ));
        }
      }
      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        requestOptions: httpResponse.response.requestOptions,
        response: httpResponse.response,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
