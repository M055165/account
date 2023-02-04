import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_calendar/constant/button.dart';
import 'package:my_calendar/globals.dart';

class LoginInput extends StatefulWidget {
  LoginInput(
      {Key? key,
      this.disableUserInput = false,
      required this.userTextController,
      required this.passwordTextController,
      this.onUserChanged,
      this.onPasswordChanged})
      : super(key: key);
  final bool disableUserInput;
  final TextEditingController userTextController;
  final TextEditingController passwordTextController;
  final void Function(String value)? onUserChanged;
  final void Function(String value)? onPasswordChanged;
  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool _showPassword = false;

  BoxDecoration _inputDecoration(BuildContext context) => BoxDecoration(
        color: Get.isDarkMode
            ? context.theme.backgroundColor
            : context.theme.cardColor,
        borderRadius: const BorderRadius.all(kRadiusS),
      );

  @override
  Widget build(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoThemeData(brightness: context.theme.brightness),
      child: Column(
        children: [
          CupertinoTextField(
            enabled: !widget.disableUserInput,
            style: const TextStyle(height: 1.2),
            padding: const EdgeInsets.all(kPaddingM),
            decoration: _inputDecoration(context),
            placeholder: 'Auth.user'.tr,
            autocorrect: false,
            enableSuggestions: false,
            clearButtonMode: OverlayVisibilityMode.editing, // 清除文字輸入
            textInputAction: TextInputAction.next, // 鍵盤右下角活動
            controller: widget.userTextController,
            onChanged: widget.onUserChanged,
          ),
          const SizedBox(height: kPaddingM),
          CupertinoTextField(
            autofocus: widget.disableUserInput, // 進到頁面直接focus
            style: const TextStyle(height: 1.2),
            padding: const EdgeInsets.all(kPaddingM),
            enableSuggestions: false,
            decoration: _inputDecoration(context),
            placeholder: 'Auth.password'.tr,
            obscureText: !_showPassword, // 隱藏密碼
            controller: widget.passwordTextController,
            onChanged: widget.onPasswordChanged,
            suffix: Padding(
              padding: const EdgeInsets.only(right: kPaddingXS),
              child: CupertinoIconButton(
                icon: Icon(
                  _showPassword ? MdiIcons.eye : MdiIcons.eyeOff,
                  color: context.theme.primaryColor,
                ),
                onTap: () => setState(() => _showPassword = !_showPassword),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
