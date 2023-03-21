import 'dart:io';

import 'package:dio/dio.dart';
import 'package:untitled/src/core/resources/data_state.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_request.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_response.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/request/change_status_request.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/tasks_service.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/domain/repositories/tasks/tasks_repository.dart';

class TasksRepositoryImplementation extends TasksRepository {
  final TasksApiService _tasksApiService;

  TasksRepositoryImplementation(this._tasksApiService);

  @override
  Future<DataState<List<Task>>> getTasks() async {
    DriverRequest driverRequest = await DriverRequest().createRequest();
    final httpResponse = await _tasksApiService.getTasks(driverRequest);

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

  @override
  Future<DataState<DriverResponse<List>>> changeTasksStatus(
      ChangeStatusTaskRequest changeStateRequest) async {
    DriverRequest<ChangeStatusTaskRequest> driverRequest =
        await DriverRequest<ChangeStatusTaskRequest>()
            .createRequest(T: changeStateRequest);
    final httpResponse = await _tasksApiService.changeTaskStatus(driverRequest);

    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.resultCode == 1) {
          return DataSuccess(httpResponse.data);
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
