import 'package:flutter/material.dart';

///Brief description: a single selection button component in [WaveBottomTabBar]
///Function: Independent control operation for each Tab
class WaveBottomTabBarItem {
  const WaveBottomTabBarItem({
    this.title,
    required this.icon,
    Widget? activeIcon,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
    this.backgroundColor,
    this.badge,
    this.badgeNo,
    this.maxBadgeNo = 99,
  }) : activeIcon = activeIcon ?? icon;

  ///Tab title name
  final Widget? title;

  ///Icon when not selected
  final Widget icon;

  ///icon when selected
  final Widget activeIcon;

  ///tab selected text style
  final TextStyle? selectedTextStyle;

  ///Tab unselected text style
  final TextStyle? unSelectedTextStyle;

  ///background color
  final Color? backgroundColor;

  ///Unread information
  final Widget? badge;

  ///The number of unread messages
  final String? badgeNo;

  ///Maximum number of unread messages
  final int maxBadgeNo;
}
