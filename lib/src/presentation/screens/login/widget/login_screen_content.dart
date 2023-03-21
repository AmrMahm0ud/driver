import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/presentation/bloc/login/login_bloc.dart';
import 'package:untitled/src/presentation/bloc/login/login_event.dart';
import 'package:untitled/src/presentation/screens/login/widget/auth_app_bar_widget.dart';
import 'package:untitled/src/presentation/widgets/custom_button_widget.dart';
import 'package:untitled/src/presentation/widgets/custom_text_field_widget.dart';
import 'package:untitled/src/presentation/widgets/password_text_field_widget.dart';

class LoginScreenContent extends StatefulWidget {
  final TextEditingController userNameController, passwordController;

  const LoginScreenContent(
      {Key? key,
      required this.passwordController,
      required this.userNameController})
      : super(key: key);

  @override
  State<LoginScreenContent> createState() => _LoginScreenContentState();
}

class _LoginScreenContentState extends State<LoginScreenContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const AuthAppBarWidget(title: "Login"),
            const SizedBox(height: 120),
            CustomTextFieldWidget(
                controller: widget.userNameController, labelTitle: "User name"),
            const SizedBox(height: 20),
            PasswordTextFieldWidget(
                controller: widget.passwordController, label: "Password"),
            const SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: CustomButtonWidget(
                    onTap: () {
                      _loginEvent();
                    },
                    buttonTitle: "Login"))
          ],
        ),
      ),
    );
  }

  void _loginEvent() {
    BlocProvider.of<LoginBloc>(context).add(LoginUserEvent(
        userName: widget.userNameController.text.trim(),
        password: widget.passwordController.text.trim()));
  }
}
