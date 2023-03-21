import 'package:equatable/equatable.dart';

class ChangeStatusTaskRequest extends Equatable {
  final int orderId;
  final int orderStatus;

  ChangeStatusTaskRequest({required this.orderId, required this.orderStatus});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['orderStatus'] = orderStatus;
    return data;
  }

  @override
  List<Object?> get props => [orderId, orderStatus];
}
