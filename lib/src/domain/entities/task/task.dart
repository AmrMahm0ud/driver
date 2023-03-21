class Task {
  final int orderId;
  final int orderAmount;
  final int cod;
  final int assignedTo;
  final String statusName;
  final String userName;
  final String createdDate;
  final int orderStatusId;

  Task(
      {required this.orderId,
      required this.orderAmount,
      required this.cod,
      required this.assignedTo,
      required this.statusName,
      required this.userName,
      required this.createdDate,
      required this.orderStatusId});
}
