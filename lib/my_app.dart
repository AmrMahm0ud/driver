import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/flavors.dart';
import 'package:untitled/src/config/theme/app_theme_manager.dart';
import 'package:untitled/src/di/data_layer_injector.dart';
import 'package:untitled/src/presentation/bloc/add_task/add_task_bloc.dart';
import 'package:untitled/src/presentation/bloc/login/login_bloc.dart';
import 'package:untitled/src/presentation/bloc/tasks/tasks_bloc.dart';
import 'package:untitled/src/presentation/screens/login/login_screen.dart';
import 'package:untitled/src/presentation/screens/tasks/tasks/tasks_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => injector()),
        BlocProvider<TasksBloc>(create: (context) => injector()),
        BlocProvider<AddTaskBloc>(create: (context) => injector())
      ],
      child: MaterialApp(
        title: 'Driver',
        theme: getApplicationTheme(),
        debugShowCheckedModeBanner: false,
        home: Flavors.name == "DRIVER"
            ? const LoginScreen()
            : const TasksScreen(),
      ),
    );
  }
}
