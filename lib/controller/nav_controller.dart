// Flutter imports:
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_calendar/pages/calender/calender_screen.dart';
import 'package:my_calendar/pages/login/login_screen.dart';
import 'package:my_calendar/pages/one.dart';
import 'package:my_calendar/pages/splash/splash_screen.dart';

import '../pages/three.dart';
import '../pages/two.dart';

class NavController extends GetxController {
  late Timer _badgeUpdateTimer;
  var _bottomNavMaxCount = 3;
  var currentIdx = 0.obs;
  Nav get currentNav => navs[currentIdx.value];
  var navs = [
    Nav(
      type: NavType.one,
      screen: const One(),
      routeName: One.routeName,
      icon: CupertinoIcons.exclamationmark_triangle,
      activeIcon: CupertinoIcons.exclamationmark_triangle_fill,
      id: 1,
    ),
    Nav(
      type: NavType.two,
      screen: AccountScreen(),
      routeName: AccountScreen.routeName,
      icon: CupertinoIcons.house,
      activeIcon: CupertinoIcons.house_alt,
      id: 3,
    ),
    Nav(
      type: NavType.three,
      screen: const Three(),
      routeName: Three.routeName,
      icon: CupertinoIcons.bell,
      activeIcon: CupertinoIcons.bell_fill,
      id: 2,
    ),
  ].obs;

  List<Nav> get bottomNavs => [
        ...navs.take(_bottomNavMaxCount),
      ];

  @override
  void dispose() {
    _badgeUpdateTimer.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    _badgeUpdateTimer.cancel();
    super.dispose();
  }

  void onBottomNavIndexChange(int index) {
    currentIdx.value = index;
  }
}

class Nav {
  NavType type;
  Widget screen;
  IconData icon;
  IconData activeIcon;
  int? badgeCount;
  String routeName;
  int id;
  Nav({
    required this.screen,
    required this.icon,
    required this.activeIcon,
    this.badgeCount = 0,
    required this.type,
    required this.routeName,
    required this.id,
  });
}

enum NavType { one, two, three }
