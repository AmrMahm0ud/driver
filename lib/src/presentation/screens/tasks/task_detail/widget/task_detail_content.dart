import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/config/theme/color_manager.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_bloc.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_event.dart';
import 'package:untitled/src/presentation/screens/tasks/widget/task_card_widget.dart';
import 'package:untitled/src/presentation/widgets/custom_button_widget.dart';

class TaskDetailContent extends StatefulWidget {
  final Task task;

  const TaskDetailContent({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetailContent> createState() => _TaskDetailContentState();
}

class _TaskDetailContentState extends State<TaskDetailContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,

        elevation: 0,
        title: Text(
          "#${widget.task.orderId}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskCardWidget(task: widget.task),
                  const SizedBox(height: 20),
                  Text("Details",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorManager.darkGray,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  _labelWithValue(
                      label: "Driver name:", value: widget.task.userName),
                  const SizedBox(height: 20),
                  _labelWithValue(
                      label: "Order id:",
                      value: widget.task.orderId.toString()),
                  const SizedBox(height: 20),
                  _labelWithValue(
                      label: "Created date:", value: widget.task.createdDate),
                  const SizedBox(height: 20),
                  _labelWithValue(
                      label: "Order amount",
                      value: widget.task.orderAmount.toString()),
                  const SizedBox(height: 20),
                  _labelWithValue(
                      label: "Cod:", value: widget.task.cod.toString()),
                  const SizedBox(height: 20),
                  _labelWithValue(
                      label: "Order status:", value: widget.task.statusName),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButtonWidget(
                          onTap: () {
                            changeTaskStatus(
                                orderStatus: 2, orderId: widget.task.orderId);
                          },
                          buttonTitle: "Delivered",
                          backgroundColor: ColorManager.green),
                      CustomButtonWidget(
                          onTap: () {
                            changeTaskStatus(
                                orderStatus: 3, orderId: widget.task.orderId);
                          },
                          buttonTitle: "Returned",
                          backgroundColor: ColorManager.error,
                          borderColor: ColorManager.error),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _labelWithValue({required String label, required String value}) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 14, color: ColorManager.grey),
        ),
        const SizedBox(width: 16),
        Text(
          value,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 14, color: ColorManager.darkGray),
        ),
      ],
    );
  }

  void changeTaskStatus({required int orderId, required int orderStatus}) {
    BlocProvider.of<TasksBloc>(context).add(
        ChangeTaskStatusOrderEvent(orderId: orderId, orderStatus: orderStatus));
  }
}
