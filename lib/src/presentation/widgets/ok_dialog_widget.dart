import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/theme/color_manager.dart';
import '../../config/theme/values_manager.dart';
import '../../core/resources/image_paths.dart';
import 'custom_button_widget.dart';

class OkDialogWidget extends StatelessWidget {
  final String dialogMessage;
  final Function() onTap;

  const OkDialogWidget({
    Key? key,
    required this.dialogMessage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSize.s16),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        child: Column(
          children: [
            //SvgPicture.asset(ImagePaths.ask),
            const SizedBox(height: AppSize.s14),
            Expanded(
              child: Text(
                dialogMessage,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: ColorManager.darkGray),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: AppSize.s32),
            SizedBox(
              width: AppSize.s144,
              child: CustomButtonWidget(
                  onTap: onTap, buttonTitle: "Ok"),
            )
          ],
        ),
      ),
    );
  }
}
