import 'package:flutter/material.dart';

class WaveAppBarTheme {
  const WaveAppBarTheme._();

  ///[WaveAppBar] Height fixed value
  static const double appBarHeight = 50;

  ///The side length of leading or actionItem added in AppBar
  static const double iconSize = 20;

  ///Spacing between [WaveIconAction]
  static const double iconMargin = 20;

  ///The size of [LeadingIcon]
  static const double iconFullSize = 40;

  ///[WaveAppBar] Title text size
  static const double titleFontSize = 18;

  ///Text size in TextAction in [WaveAppBar]
static const double actionFontSize = 14;

  ///[WaveAppBar] Use [WaveDoubleLeading] to add two leading fixed width
  static const double doubleLeadingSize = 80;

  ///Text color used when [Brightness.light]
  static const Color lightTextColor = Color(0xFF222222);

  ///Text color used when [Brightness.dark]
  static const Color darkTextColor = Colors.white;

  ///The maximum number of characters for AppBar title
  static const int maxLength = 8;
}