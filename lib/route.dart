import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_calendar/pages/calender/calender_screen.dart';
import 'package:my_calendar/pages/login/login_screen.dart';
import 'package:my_calendar/pages/one.dart';

import 'package:my_calendar/pages/splash/splash_screen.dart';
import 'package:my_calendar/pages/three.dart';
import 'package:my_calendar/pages/two.dart';
import 'package:my_calendar/wrapper/nav_wrapper.dart';

final route = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: NavWrapper.routeName,
    page: () => const NavWrapper(),
  ),
  GetPage(
    name: One.routeName,
    page: () => const One(),
  ),
  GetPage(
    name: AccountScreen.routeName,
    page: () => AccountScreen(),
  ),
  GetPage(
    name: Three.routeName,
    page: () => const Three(),
  ),
];
