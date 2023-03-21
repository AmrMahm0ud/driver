import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/base/widget/base_stateful_widget.dart';
import 'package:untitled/src/core/utils/dialogs/show_ok_dialog.dart';
import 'package:untitled/src/presentation/bloc/login/login_bloc.dart';
import 'package:untitled/src/presentation/bloc/login/login_event.dart';
import 'package:untitled/src/presentation/bloc/login/login_state.dart';
import 'package:untitled/src/presentation/screens/login/widget/login_screen_content.dart';
import 'package:untitled/src/presentation/screens/tasks/tasks/tasks_screen.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state is LoginLoadingState) {
        showLoading();
      } else {
        hideLoading();
      }
      if (state is LoginNetworkErrorState) {
        showOkDialog(
            context: context,
            onTap: () {
              _popEvent();
            },
            dialogMessage: state.errorMassage ?? "Network error");
      } else if (state is FailLoginState) {
        showOkDialog(
            context: context,
            onTap: () {
              _popEvent();
            },
            dialogMessage: state.errorMassage ?? "Invalid Data");
      } else if (state is LoginPopState) {
        _pop();
      } else if (state is SuccessLoginState) {
        _navigateToTasksScreen();
      }
    }, builder: (context, state) {
      return _buildScreen();
    });
  }

  Widget _buildScreen() {
    return LoginScreenContent(
        passwordController: _passwordController,
        userNameController: _userNameController);
  }

  void _pop() {
    Navigator.of(context).pop();
  }

  void _popEvent() {
    BlocProvider.of<LoginBloc>(context).add(LoginPopEvent());
  }

  _navigateToTasksScreen() async {
    return await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const TasksScreen()));
  }
}
