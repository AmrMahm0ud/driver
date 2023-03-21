import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/src/data/sources/remote/driver/api_key.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_request.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_response.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/models/remote_tasks.dart';
import 'package:untitled/src/data/sources/remote/driver/tasks/request/change_status_request.dart';

part 'tasks_service.g.dart';

@RestApi()
abstract class TasksApiService {
  factory TasksApiService(Dio dio) = _TasksApiService;

  @POST(ApiKeys.getTasks)
  Future<HttpResponse<DriverResponse<List<RemoteTask>>>> getTasks(
      @Body() DriverRequest request);

  @POST(ApiKeys.changeStatus)
  Future<HttpResponse<DriverResponse<List>>> changeTaskStatus(
      @Body() DriverRequest<ChangeStatusTaskRequest> request);
}
