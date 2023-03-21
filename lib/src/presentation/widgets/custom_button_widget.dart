import 'package:flutter/material.dart';

import '../../config/theme/color_manager.dart';
import '../../config/theme/values_manager.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String buttonTitle;
  final Color backgroundColor;
  final Color borderColor;
  final Color titleColor;

  const CustomButtonWidget({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    this.backgroundColor = ColorManager.primary,
    this.borderColor = ColorManager.primary,
    this.titleColor = ColorManager.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: borderColor,
            width: AppSize.s1,
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child: Text(
        buttonTitle,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: titleColor),
      ),
    );
  }
}
