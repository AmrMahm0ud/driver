import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/src/data/sources/remote/driver/add_task/request/add_task_request.dart';
import 'package:untitled/src/data/sources/remote/driver/api_key.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_request.dart';
import 'package:untitled/src/data/sources/remote/driver/driver_response.dart';

part 'add_task_service.g.dart';

@RestApi()
abstract class AddTaskService {
  factory AddTaskService(Dio dio) = _AddTaskService;

  @POST(ApiKeys.addTask)
  Future<HttpResponse<DriverResponse<List>>> addTask(
      @Body() DriverRequest<AddTaskRequest> request);
}
