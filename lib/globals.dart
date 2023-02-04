import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

const kEmcTel = '02-2833-5507';
final kIsWideScreen = Get.width > kWideScreenWidth;
final kIsXWideScreen = Get.width > kXWideScreenWidth;
const kDefaultTimeZone = 'Asia/Taipei';
final kPixelRatio = kIsWeb ? 1.0 : Get.pixelRatio;
const kSnackBarMaxWidth = 428.0;
// size
const kXWideScreenWidth = 1280;
const kWideScreenWidth = 768.0;
const kWideScreenListWidth = 468.0;
double kBottomTabHeight(BuildContext context) =>
    kToolBarHeightM + kSafeAreaBottom(context);
// panel
const kPanelHeaderHeight = 130.0;
const kPanelWideScreenWidth = 380.0;
EdgeInsets kPanelPadding(BuildContext context) => EdgeInsets.only(
      left: kPaddingM,
      right: kPaddingM,
      top: kPaddingM,
      bottom: kSafeAreaBottom(context),
    );
EdgeInsets kPanelPaddingVertical(BuildContext context) => EdgeInsets.only(
      top: kPaddingM,
      bottom: kSafeAreaBottom(context),
    );

Color kPanelColor(BuildContext context) =>
    context.theme.scaffoldBackgroundColor.withOpacity(0.96);
Color kCardButtonColor(BuildContext context) => Get.isDarkMode
    ? context.theme.highlightColor
    : context.theme.backgroundColor;
// border
const kRadiusL = Radius.circular(18.0);
const kRadiusM = Radius.circular(12.0);
const kRadiusS = Radius.circular(6.0);
const kRadiusXS = Radius.circular(3.0);
const kBorderRadiusL = BorderRadius.all(kRadiusL);
const kBorderRadiusM = BorderRadius.all(kRadiusM);
const kBorderRadiusS = BorderRadius.all(kRadiusS);
const kBorderRadiusXS = BorderRadius.all(kRadiusXS);
const kShapeRoundedRectangleM = RoundedRectangleBorder(
  borderRadius: kBorderRadiusM,
);
const kShapeRoundedRectangleS = RoundedRectangleBorder(
  borderRadius: kBorderRadiusS,
);
const kShapeRoundedRectangleXS = RoundedRectangleBorder(
  borderRadius: kBorderRadiusXS,
);
// boxShadow
const kBoxShadowL = [
  BoxShadow(blurRadius: 2, color: Color.fromRGBO(0, 0, 0, 0.4))
];
const kBoxShadowM = [
  BoxShadow(blurRadius: 1.5, color: Color.fromRGBO(0, 0, 0, 0.35))
];
const kBoxShadowS = [
  BoxShadow(blurRadius: 1, color: Color.fromRGBO(0, 0, 0, 0.3))
];

const kBoxShadowNone = [BoxShadow(blurRadius: 0, color: Colors.transparent)];
// padding
const kPaddingXL = 36.0;
const kPaddingL = 18.0;
const kPaddingM = 12.0;
const kPaddingS = 6.0;
const kPaddingXS = 3.0;
const kPaddingXXS = 2.0;
const kPaddingXXXS = 1.0;
double kSafeAreaBottom(BuildContext context) =>
    context.mediaQueryViewPadding.bottom != 0
        ? context.mediaQueryViewPadding.bottom
        : kPaddingM;
double kSafeAreaTop(BuildContext context) => context.mediaQueryViewPadding.top;
// duration
const kDurationDebounce = Duration(milliseconds: 300);
const kDurationXXF = Duration(milliseconds: 50);
const kDurationXF = Duration(milliseconds: 100);
const kDurationF = Duration(milliseconds: 300);
const kDurationM = Duration(milliseconds: 500);
const kDurationS = Duration(milliseconds: 600);
const kDurationFormUpdate = Duration(seconds: 1);
// track
const kTrackAnimationDuration = Duration(milliseconds: 500);
const kTrackAnimationFps = 10;
final kTrackDuration = kTrackAnimationDuration ~/ kTrackAnimationFps;
final kTrackFrames =
    (kTrackAnimationDuration.inMilliseconds / 1000 * kTrackAnimationFps).ceil();
// playback
const kPlaybackAnimationFps = 30;
final kPlaybackDuration =
    const Duration(milliseconds: 1000) ~/ kPlaybackAnimationFps;
// snap
const kSnapMaxTracePoints = 100;
// marker
const kMarkerSizeXS = 10.0;
const kMarkerSizeS = 30.0;
const kMarkerSizeM = 50.0;
const kMarkerSizeL = 65.0;
// color
Color kUnreadTint(BuildContext context) =>
    context.theme.primaryColor.withOpacity(0.16);
// appBar
double kScreenAppBarHeight(BuildContext context) =>
    kSafeAreaTop(context) + kToolBarHeightM;
double kPanelAppBarHeight(BuildContext context) =>
    kSafeAreaTop(context) + kToolBarHeightL;
double kModalBarHeight(BuildContext context) =>
    kSafeAreaTop(context) + kToolBarHeightS;
double kModalBottomBarHeight(BuildContext context) =>
    kSafeAreaBottom(context) + kToolBarHeightS;
// detail
EdgeInsets kScreenPadding(BuildContext context) => EdgeInsets.only(
      top: kScreenAppBarHeight(context) + kPaddingM,
      bottom: kSafeAreaBottom(context),
      left: kPaddingM,
      right: kPaddingM,
    );

EdgeInsets kScreenPaddingVertical(BuildContext context) => EdgeInsets.only(
      top: kScreenAppBarHeight(context) + kPaddingM,
      bottom: kSafeAreaBottom(context),
    );

EdgeInsets kModalPadding(BuildContext context, {bool hasBottomBar = true}) =>
    EdgeInsets.only(
      top: kModalBarHeight(context) + kPaddingM,
      bottom: kModalBottomBarHeight(context) + kPaddingM,
      left: kPaddingM,
      right: kPaddingM,
    );
EdgeInsets kDetailScreenPadding(BuildContext context) => EdgeInsets.only(
      top: kScreenAppBarHeight(context) + kPaddingM,
      bottom: kSafeAreaBottom(context),
      left: kPaddingM,
      right: kPaddingM,
    );
EdgeInsets kDetailScreenPaddingVertical(BuildContext context) =>
    EdgeInsets.only(
      top: kScreenAppBarHeight(context) + kPaddingM,
      bottom: kSafeAreaBottom(context),
    );
EdgeInsets kDetailScreenCardPadding = const EdgeInsets.symmetric(
  horizontal: kPaddingL,
  vertical: kPaddingXL,
);
double kDetailScreenElevation = 2;
BoxDecoration kInputDecoration(BuildContext context) => BoxDecoration(
      color: context.theme.cardColor,
      borderRadius: const BorderRadius.all(kRadiusM),
    );
const double kToolBarHeightS = 40;
const double kToolBarHeightM = 56;
const double kToolBarHeightL = 66;
const double kDateTimeRangeHeight = 88;
