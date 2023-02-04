// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:my_calendar/globals.dart';

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
    this.color,
    this.size,
    required this.child,
    this.childRatio = 1,
    this.border = BorderSide.none,
    this.borderPadding = 0,
    this.boxShadow,
  }) : super(key: key);
  final Color? color;
  final double? size;
  final Widget child;
  final double childRatio;
  final BorderSide border;
  final double borderPadding;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      padding: EdgeInsets.all(borderPadding),
      decoration: ShapeDecoration(
        color: Colors.transparent,
        shape: CircleBorder(
          side: border,
        ),
        shadows: boxShadow,
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: color ?? context.theme.backgroundColor,
          shape: const CircleBorder(),
        ),
        child: FractionallySizedBox(
          heightFactor: childRatio,
          widthFactor: childRatio,
          child: child,
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
    required this.child,
    this.size = 32,
    this.color,
    this.onTap,
    this.boxShadow,
  }) : super(key: key);
  final double size;
  final Widget child;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Circle(
        size: size,
        color: color ?? context.theme.backgroundColor,
        childRatio: 0.6,
        boxShadow: boxShadow,
        child: FittedBox(child: child),
      ),
    );
  }
}

class CircleCloseButton extends StatelessWidget {
  const CircleCloseButton({
    Key? key,
    this.iconColor,
    this.color,
    this.onTap,
    this.boxShadow,
  }) : super(key: key);
  final Color? iconColor;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return CircleButton(
      onTap: onTap,
      color: color,
      boxShadow: boxShadow,
      child: Icon(
        CupertinoIcons.clear_thick,
        color: iconColor ?? context.iconColor,
      ),
    );
  }
}

class BadgeCount extends StatelessWidget {
  const BadgeCount({
    Key? key,
    this.count = 0,
    this.paddingTop = kPaddingM,
    this.paddingEnd = kPaddingM,
    required this.child,
  }) : super(key: key);
  final int? count;
  final double paddingTop;
  final double paddingEnd;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Badge(
      toAnimate: false,
      elevation: 0,
      padding: EdgeInsets.zero,
      showBadge: count != null ? count! > 0 : false,
      position: BadgePosition.topEnd(top: -paddingTop, end: -paddingEnd),
      badgeContent: Circle(
        size: 16,
        color: CupertinoColors.systemRed,
        childRatio: 0.7,
        child: FittedBox(
          child: Text(
            count.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      child: child,
    );
  }
}
