import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/theme/color_manager.dart';
import '../../core/resources/image_paths.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String? errorMessage;
  final Function(String)? onChange;
  final Color iconColor;
  final String? label;

  const PasswordTextFieldWidget({
    Key? key,
    required this.controller,
    this.errorMessage,
    this.onChange,
    this.iconColor = ColorManager.white,
    this.label,
  }) : super(key: key);

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldWidgetState();
}

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  bool _shouldShowAsPasswordText = true;
  String _passwordIcon = ImagePaths.showPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChange,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: ColorManager.darkGray),
      obscureText: _shouldShowAsPasswordText,
      decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: IconButton(
            icon: SvgPicture.asset(_passwordIcon),
            color: widget.iconColor,
            onPressed: _toggleVisibilityIcon,
          ),
          labelStyle: TextStyle(
              color: widget.errorMessage == null
                  ? ColorManager.grey
                  : ColorManager.error),
          errorText: widget.errorMessage),
    );
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _shouldShowAsPasswordText = !_shouldShowAsPasswordText;
      if (_shouldShowAsPasswordText) {
        _passwordIcon = ImagePaths.showPassword;
      } else {
        _passwordIcon = ImagePaths.hiddenPassword;
      }
    });
  }
}
