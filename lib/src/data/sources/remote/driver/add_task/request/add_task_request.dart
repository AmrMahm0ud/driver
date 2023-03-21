class AddTaskRequest {
  final int? orderAmount, orderId, cod, orderStatus, assignedTo;

  AddTaskRequest(
      {this.orderAmount,
      this.orderId,
      this.cod,
      this.orderStatus,
      this.assignedTo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    data['orderAmount'] = orderAmount;
    data['cod'] = cod;
    data['orderStatus'] = orderStatus;
    data['assinedTo'] = assignedTo;
    return data;
  }
}
