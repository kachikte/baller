import 'package:baller/src/config/app_decorations.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  late TextEditingController textEditingController;
  final String hintText;
  final String errorText;
  final bool enabled;
  final Widget? icon;
  final String type;

  AppInput({super.key, required this.textEditingController, required this.hintText, required this.errorText, this.enabled = true, this.icon = const SizedBox(), this.type = 'text'});


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: type == Constants.passwordFieldType,
      enabled: enabled,
      style: const TextStyle(color: Colors.white),
      controller: textEditingController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: icon,
          border: AppDecorations.borderOutline,
          enabledBorder: AppDecorations.borderOutline,
          disabledBorder: AppDecorations.borderOutline,
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.appBlack),
          focusedBorder: AppDecorations.borderOutline,
          errorBorder: AppDecorations.borderError,
          errorStyle: TextStyle(color: AppColors.primaryColor)
      ),
      validator: (value) {
        if (value == "") {
          return errorText;
        } else {
          return null;
        }
      },
    );
  }
}
