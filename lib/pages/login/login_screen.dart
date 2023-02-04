import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:my_calendar/pages/calender/calender_screen.dart';
import 'package:my_calendar/pages/splash/splash_screen.dart';
import 'package:my_calendar/wrapper/nav_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:my_calendar/constant/button.dart';
import 'package:my_calendar/globals.dart';
import 'package:my_calendar/widgets/auth.dart';

import '../../controller/auth/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _showUserOrPasswordInvalidMsg = false;
  var _isPolicyRead = false;
  String? _storedUser;
  final _userTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    SchedulerBinding.instance.addPostFrameCallback((_) => _onInit(context));
    super.initState();
  }

  void _onInit(BuildContext context) async {
    // await JBDetectionService.verify(context);
    // await PackageInfoService.checkNewVersion(context);
    _placeStoredUser();
  }

  void _placeStoredUser() async {
    Get.put(AuthController());
    _storedUser = await Get.find<AuthController>().getStoredUser();
    _userTextController.text = _storedUser ?? '';
    if (_storedUser != null) setState(() => _isPolicyRead = true);
  }

  void _onUserChanged(String value) async {
    if (_isPolicyRead && value != _storedUser) {
      setState(() => _isPolicyRead = false);
      return;
    }
    if (!_isPolicyRead && value == _storedUser) {
      setState(() => _isPolicyRead = true);
      return;
    }
  }

  void _onInputChanged() {
    setState(() => _showUserOrPasswordInvalidMsg = false);
  }

  void _login() async {
    Get.put(AuthController());
    var result = await Get.find<AuthController>().login(
      user: _userTextController.value.text,
      password: _passwordTextController.value.text,
    );
    print(result);
    _loginResultHandler(result);
  }

  void _loginResultHandler(LoginResult result) {
    if (result == LoginResult.success) {
      Get.offNamed(NavWrapper.routeName);
      return;
    }
    if (result == LoginResult.userOrPasswordInvalid) {
      setState(() => _showUserOrPasswordInvalidMsg = true);
      var actions = <CupertinoDialogAction>[];
      var tryLater = CupertinoDialogAction(
        onPressed: Get.back,
        child: Text('comfirm'.tr),
      );
      actions = [tryLater];
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: Text(result.toString().tr),
          content: Padding(
            padding: const EdgeInsets.only(top: kPaddingS),
            child: Text('$result'.tr),
          ),
          actions: actions,
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Get.isDarkMode ? Colors.grey : context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPaddingL),
          child: Stack(children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      KeyboardVisibilityBuilder(
                        builder: (context, isKeyboardVisible) =>
                            !isKeyboardVisible
                                ? Text(
                                    'App.title'.tr,
                                    style: context.textTheme.displayMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.iconColor,
                                    ),
                                  )
                                : const SizedBox(),
                      ),
                      const SizedBox(height: kPaddingXL),
                      LoginInput(
                        userTextController: _userTextController,
                        passwordTextController: _passwordTextController,
                        onUserChanged: (value) {
                          _onUserChanged(value);
                          _onInputChanged();
                        },
                        onPasswordChanged: (_) => _onInputChanged(),
                      ),
                      const SizedBox(height: kPaddingM),
                      Row(
                        children: [
                          Visibility(
                            visible: _showUserOrPasswordInvalidMsg,
                            child: Text(
                              'LoginResult.userOrPasswordInvalid'.tr,
                              style: context.textTheme.subtitle1?.copyWith(
                                color: CupertinoColors.destructiveRed,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          CupertinoTextButton(
                            text: Text('Auth.forgotPassword'.tr),
                            onTap: () => launchUrl(
                              Uri.parse('https://google.com.tw'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: kPaddingM,
                        ),
                        child: Row(children: [
                          SizedBox.square(
                            dimension: 24,
                            child: Checkbox(
                              activeColor: context.theme.primaryColor,
                              value: _isPolicyRead,
                              onChanged: (v) =>
                                  setState(() => _isPolicyRead = (v == true)),
                            ),
                          ),
                          const SizedBox(width: kPaddingXS),
                          GestureDetector(
                            child: Text('Auth.policyRead'.tr),
                            onTap: () =>
                                setState(() => _isPolicyRead = !_isPolicyRead),
                          ),
                          CupertinoTextButton(
                            text: Text(
                              'Auth.policy'.tr,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: context.theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () =>
                                setState(() => _isPolicyRead = !_isPolicyRead),
                          ),
                        ]),
                      ),
                      CupertinoTextButton(
                        filledColor: context.theme.primaryColor,
                        text: Text(
                          'Auth.login'.tr,
                          style: context.textTheme.subtitle1?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: _isPolicyRead ? _login : null,
                      ),
                      const SizedBox(height: kPaddingL),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
