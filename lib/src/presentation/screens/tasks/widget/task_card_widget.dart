import 'package:flutter/material.dart';
import 'package:untitled/src/config/theme/color_manager.dart';
import 'package:untitled/src/domain/entities/task/task.dart';
import 'package:untitled/src/presentation/screens/tasks/widget/status_widget.dart';

class TaskCardWidget extends StatelessWidget {
  final Function()? onItemTap;
  final Task task;

  const TaskCardWidget({Key? key, required this.task, this.onItemTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemTap,
      child: SizedBox(
        child: Card(
            color: ColorManager.lightGrey,
            elevation: 5,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.all(16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        "#${task.orderId}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: ColorManager.black),
                      )),
                      Text(
                        task.createdDate,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: ColorManager.darkGray),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.userName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: ColorManager.darkGray)),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Order Amount",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: ColorManager.darkGray),
                              ),
                            ),
                            Text("${task.orderAmount}")
                          ],
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              "Status",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 14,
                                      color: ColorManager.darkGray),
                            )),
                            StatusWidget(
                                fontSize: 14,
                                backgroundColor: task.orderStatusId == 1
                                    ? ColorManager.yellow
                                    : task.orderStatusId == 2
                                        ? ColorManager.green
                                        : ColorManager.error,
                                label: task.statusName,
                                labelColor: ColorManager.white)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
