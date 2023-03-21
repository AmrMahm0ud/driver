import 'package:flutter/material.dart';
import 'package:untitled/src/config/theme/color_manager.dart';


// ignore: must_be_immutable
class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelTitle;
  String? hintTitle;
  final String? errorMessage;
  final Function(String)? onChange;
  final TextInputType textInputType;
  TextStyle? labelStyle;

  CustomTextFieldWidget({
    Key? key,
    required this.controller,
    this.hintTitle,
    required this.labelTitle,
    this.onChange,
    this.labelStyle,
    this.errorMessage,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType,
      controller: controller,
      onChanged: onChange,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: ColorManager.darkGray),
      decoration: InputDecoration(
          errorText: errorMessage,
          hintText: hintTitle,
          labelText: labelTitle,
          labelStyle: TextStyle(
              color: errorMessage == null
                  ? ColorManager.grey
                  : ColorManager.error) ,
          errorMaxLines: 2),
    );
  }
}
