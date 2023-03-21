import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/config/theme/color_manager.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_event.dart';
import 'package:untitled/src/presentation/widgets/custom_button_widget.dart';
import 'package:untitled/src/presentation/widgets/custom_text_field_widget.dart';

class AddTaskContent extends StatefulWidget {
  final TextEditingController orderAmountController,
      orderCodController,
      assignedToController;

  const AddTaskContent(
      {Key? key,
      required this.assignedToController,
      required this.orderAmountController,
      required this.orderCodController})
      : super(key: key);

  @override
  State<AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<AddTaskContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.white,
        elevation: 0,
        title: Text(
          "Add Task Screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  CustomTextFieldWidget(
                      controller: widget.assignedToController,
                      labelTitle: "Assigned to",
                      textInputType: TextInputType.number),
                  const SizedBox(height: 20),
                  CustomTextFieldWidget(
                      controller: widget.orderAmountController,
                      labelTitle: "Order Amount",
                      textInputType: TextInputType.number),
                  const SizedBox(height: 20),
                  CustomTextFieldWidget(
                      controller: widget.orderCodController,
                      labelTitle: "COD",
                      textInputType: TextInputType.number),
                  const SizedBox(height: 20),
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      child: CustomButtonWidget(
                          onTap: () {
                            _addTaskEvent();
                          },
                          buttonTitle: "Add Task")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _addTaskEvent() {
    BlocProvider.of<AddTaskBloc>(context).add(AddTaskApiEvent(
        orderAmount: int.tryParse(widget.orderAmountController.text),
        cod: int.tryParse(widget.orderCodController.text),
        assignedTo: int.tryParse(widget.assignedToController.text)));
  }
}
