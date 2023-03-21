import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/src/config/theme/color_manager.dart';

class ContainerWithIconWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Function()? onTap;
  final double? borderRadius;
  final String? iconPath;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconHeight;
  final double elevation;

  const ContainerWithIconWidget(
      {Key? key,
      this.elevation = 3.0,
      this.height = 50,
      this.width = 50,
      required this.onTap,
      required this.iconPath,
      this.borderRadius = 12,
      this.iconColor = ColorManager.white,
      this.backgroundColor = ColorManager.error,
      this.iconHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        child: SvgPicture.asset(
          iconPath!,
          color: iconColor,
          height: iconHeight ?? 30,
          matchTextDirection: true,
        ),
        style: _buttonStyle(),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
        elevation: MaterialStateProperty.all<double>(elevation),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor!));
  }
}
