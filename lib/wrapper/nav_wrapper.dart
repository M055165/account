import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_calendar/globals.dart';
import 'package:my_calendar/widgets/common/app_bar.dart';

import '../constant/button.dart';
import '../constant/circle.dart';
import '../controller/nav_controller.dart';

class NavWrapper extends StatefulWidget {
  const NavWrapper({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  @override
  void initState() {
    super.initState();
    Get.put(NavController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Body(),
      bottomNavigationBar: _BottomNav(),
    );
  }
}

class _Body extends GetView<NavController> {
  const _Body({Key? key}) : super(key: key);

  List<Nav> get navs => controller.bottomNavs;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.currentIdx.value,
        children: navs.map((e) => e.screen).toList(),
      ),
    );
  }
}

class _BottomNav extends GetView<NavController> {
  const _BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CupertinoTabBar(
        currentIndex: controller.currentIdx.value,
        iconSize: 28,
        height: kToolBarHeightM,
        activeColor: context.iconColor,
        inactiveColor: context.theme.hintColor,
        onTap: controller.onBottomNavIndexChange,
        items: controller.bottomNavs
            .map((e) => BottomNavigationBarItem(
                  label: e.type.toString().tr,
                  icon: Padding(
                    padding: const EdgeInsets.only(top: kPaddingS),
                    child: BadgeCount(
                      count: e.badgeCount,
                      paddingTop: kPaddingXS,
                      child: Icon(e.icon),
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(top: kPaddingS),
                    child: BadgeCount(
                      count: e.badgeCount,
                      paddingTop: kPaddingXS,
                      child: Icon(e.activeIcon),
                    ),
                  ),
                ))
            .toList(),
      );
    });
  }
}
