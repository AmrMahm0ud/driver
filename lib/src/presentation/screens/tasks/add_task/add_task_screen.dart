import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/base/widget/base_stateful_widget.dart';
import 'package:untitled/src/core/utils/dialogs/show_ok_dialog.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_event.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_state.dart';
import 'package:untitled/src/presentation/screens/tasks/add_task/widget/add_task_content.dart';

class AddTaskScreen extends BaseStatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends BaseState<AddTaskScreen> {
  TextEditingController _orderAmountController = TextEditingController();
  TextEditingController _orderCodController = TextEditingController();
  TextEditingController _assignedToController = TextEditingController();

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AddTaskBloc, AddTaskState>(listener: (context, state) {
      if (state is LoadingAddTaskState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is FailAddTaskState) {
        showOkDialog(
            context: context,
            onTap: () {
              _popEvent();
            },
            dialogMessage: state.errorMassage);
      } else if (state is SuccessAddTaskState) {
        _pop();
      } else if (state is PopAddTaskDialogState) {
        _pop();
      }
    }, builder: (context, state) {
      return AddTaskContent(
        assignedToController: _assignedToController,
        orderAmountController: _orderAmountController,
        orderCodController: _orderCodController,
      );
    });
  }

  _popEvent() {
    BlocProvider.of<AddTaskBloc>(context).add(PopAddTaskDialogEvent());
  }

  _pop() {
    Navigator.of(context).pop();
  }
}
