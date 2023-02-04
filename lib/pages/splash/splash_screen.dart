import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_calendar/pages/login/login_screen.dart';

import '../../constant/colors.dart';
import '../../constant/types.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  RequestResult _loadingStatus = RequestResult.LOADING;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          const SizedBox(),
          const SizedBox(),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Text('eddie'),
            ),
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_loadErrorSwitch()],
          ),
        ],
      ),
    ));
  }

  Widget _loadErrorSwitch() {
    switch (_loadingStatus) {
      case RequestResult.LOADING:
        return const Center(
          child: SpinKitRipple(
            color: kPrimaryColor,
            size: 100,
            borderWidth: 10,
          ),
        );
      default:
        return Text('default');
    }
  }

  Future _loadData() async {
    await Future.delayed(Duration(seconds: 5));
    Get.to(() => LoginScreen());
  }
}
