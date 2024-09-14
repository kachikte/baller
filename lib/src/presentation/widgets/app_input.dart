import 'package:baller/src/config/app_decorations.dart';
import 'package:baller/src/presentation/providers/pin_input_provider.dart';
import 'package:baller/src/utils/app_colors.dart';
import 'package:baller/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppInput extends ConsumerWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String errorText;
  final bool enabled;
  final Widget? icon;
  final Widget? suffixIcon;
  final String type;
  final bool isError;
  final double height;
  final double width;
  final String label;
  final TextInputType textInputType;
  final double textFieldHeight;

  AppInput(
      {required this.textEditingController,
      this.textInputType = TextInputType.text,
      required this.hintText,
      required this.errorText,
      this.enabled = true,
      this.icon = const SizedBox(),
      this.type = 'text',
      this.suffixIcon,
      this.isError = false,
      required this.width,
      required this.label,
      this.textFieldHeight = 70,
      required this.height});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinObscure = ref.watch(pinInputCompleteProvider);

    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: width,
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          SizedBox(
            height: height * .01,
          ),
          Container(
            height: textFieldHeight,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              obscureText:
                  (type == Constants.passwordFieldType) && (pinObscure),
              enabled: enabled,
              keyboardType: textInputType,
              style: TextStyle(
                  color: isError ? AppColors.appRed : AppColors.appBlack),
              controller: textEditingController,
              cursorColor: isError ? AppColors.appRed : AppColors.appBlack,
              decoration: InputDecoration(
                  suffixIcon: suffixIcon,
                  suffixIconColor: AppColors.appBlack,
                  prefixIcon: icon,
                  border: AppDecorations.borderOutline,
                  enabledBorder: isError
                      ? AppDecorations.borderError
                      : AppDecorations.borderOutline,
                  disabledBorder: AppDecorations.borderOutline,
                  hintText: hintText,
                  hintStyle: TextStyle(
                      color: AppColors.appBlack.withOpacity(.4), fontSize: 14),
                  focusedBorder: isError
                      ? AppDecorations.borderError
                      : AppDecorations.borderOutline,
                  errorBorder: AppDecorations.borderError,
                  errorStyle: TextStyle(color: AppColors.appRed)),
              validator: (value) {
                if (value == "") {
                  return errorText;
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: height * .02,
          ),
        ],
      ),
    );
  }
}
