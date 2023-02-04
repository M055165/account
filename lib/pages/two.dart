import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_calendar/constant/button.dart';
import 'package:my_calendar/globals.dart';
import 'package:my_calendar/widgets/account_analysis.dart';
import 'package:my_calendar/widgets/common/account_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shake/shake.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var actions = <CupertinoDialogAction>[];
    var tryLater = CupertinoDialogAction(
      onPressed: Get.back,
      child: Text('打電話'),
    );
    actions = [tryLater];

    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('打電話'),
          content: const Padding(
            padding: EdgeInsets.only(top: kPaddingS),
            child: Text('打電話'),
          ),
          actions: actions,
        ),
      );
    });
    return Scaffold(
      appBar: AccountAppbar(),
      body: SingleChildScrollView(
        child: AccountAnalysis(),
      ),
    );
  }
}
