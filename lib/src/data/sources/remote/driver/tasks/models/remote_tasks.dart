import 'package:untitled/src/domain/entities/task/task.dart';

class RemoteTask extends Task {
  final int orderId;
  final int orderAmount;
  final int cod;
  final int assignedTo;
  final String statusName;
  final String userName;
  final String createdDate;
  final int orderStatusId;

  RemoteTask(
      {required this.orderId,
      required this.orderAmount,
      required this.cod,
      required this.assignedTo,
      required this.statusName,
      required this.userName,
      required this.createdDate,
      required this.orderStatusId})
      : super(
            statusName: statusName,
            orderId: orderId,
            orderAmount: orderAmount,
            createdDate: createdDate,
            cod: cod,
            assignedTo: assignedTo,
            userName: userName,
            orderStatusId: orderStatusId);

  factory RemoteTask.fromJson(Map<String, dynamic> json) => RemoteTask(
      userName: json['userName'],
      assignedTo: json['assinedTo'],
      cod: json['cod'],
      createdDate: "",
      orderAmount: json['orderAmount'],
      orderId: json['orderId'],
      statusName: json['statusName'],
      orderStatusId: json['orderStatus']);
}
