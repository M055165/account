// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:badges/badges.dart';
import 'package:get/get.dart';
import 'package:my_calendar/constant/circle.dart';
import 'package:my_calendar/globals.dart';

class CupertinoIconButton extends StatelessWidget {
  const CupertinoIconButton({
    Key? key,
    required this.icon,
    this.label,
    this.filledColor,
    this.onTap,
    this.minSize = kPaddingL * 2,
  }) : super(key: key);
  final Widget icon;
  final Widget? label;
  final Color? filledColor;
  final void Function()? onTap;
  final double minSize;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: filledColor,
      minSize: minSize,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(top: kPaddingS),
              child: DefaultTextStyle(
                style: context.textTheme.caption!.copyWith(
                  color: context.theme.primaryColor,
                ),
                child: label!,
              ),
            ),
        ],
      ),
    );
  }
}

class CupertinoTextButton extends StatelessWidget {
  const CupertinoTextButton({
    Key? key,
    required this.text,
    this.filledColor,
    this.minSize = kMinInteractiveDimensionCupertino,
    this.alignment = Alignment.center,
    this.onTap,
  }) : super(key: key);
  final Widget text;
  final Color? filledColor;
  final double minSize;
  final AlignmentGeometry alignment;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: context.textTheme.button!,
      child: CupertinoButton(
        color: filledColor,
        minSize: minSize,
        padding: EdgeInsets.zero,
        onPressed: onTap,
        child: Align(
          alignment: alignment,
          child: text,
        ),
      ),
    );
  }
}

class ActionTextButton extends StatelessWidget {
  const ActionTextButton({
    Key? key,
    required this.title,
    this.height = 48,
    this.iconData,
    this.iconSize = 32,
    this.cardColor,
    this.contentColor,
    this.fontWeight = FontWeight.normal,
    this.onTap,
  }) : super(key: key);
  final String title;
  final double height;
  final IconData? iconData;
  final double iconSize;
  final Color? cardColor;
  final Color? contentColor;
  final FontWeight fontWeight;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: cardColor ?? kCardButtonColor(context),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingM,
            vertical: kPaddingS,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null)
                Padding(
                  padding: const EdgeInsets.only(right: kPaddingS),
                  child: Icon(iconData, color: contentColor, size: iconSize),
                ),
              Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: contentColor,
                  fontWeight: fontWeight,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActionIconButton extends StatelessWidget {
  const ActionIconButton({
    Key? key,
    required this.iconData,
    this.iconSize = 32,
    this.height = 60,
    this.label,
    this.onTap,
    this.badgeCount = 0,
  }) : super(key: key);
  final IconData iconData;
  final double iconSize;
  final double height;
  final String? label;
  final int badgeCount;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: kCardButtonColor(context),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: kPaddingM,
            vertical: kPaddingXS,
          ),
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                  data: Theme.of(context)
                      .iconTheme
                      .copyWith(color: context.theme.primaryColor),
                  child: Badge(
                    toAnimate: false,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    showBadge: badgeCount > 0,
                    position: BadgePosition.topEnd(
                      top: -2,
                      end: -2,
                    ),
                    badgeContent: Circle(
                      size: 16,
                      color: CupertinoColors.systemRed,
                      childRatio: 0.7,
                      child: FittedBox(
                        child: Text(
                          badgeCount.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    child: Icon(
                      iconData,
                      size: iconSize,
                    ),
                  )),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(top: kPaddingXS),
                  child: Text(
                    label ?? '',
                    style: context.textTheme.labelSmall?.copyWith(
                      color: context.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
