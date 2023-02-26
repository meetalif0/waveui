import 'dart:math';

import 'package:waveui/src/components/button/wave_normal_button.dart';
import 'package:waveui/src/constants/wave_constants.dart';
import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:waveui/src/theme/wave_theme.dart';
import 'package:flutter/material.dart';
///Border Small and secondary buttons, small gray frame, default button confirmation, support custom border, text color

///small border button
///The button has a minimum width of 84, on this basis, the width changes with the text content
///
///The button is in the shape of a rounded rectangle. It only supports setting the size of the rounded corner [radius], and does not support changing the shape.
///
///The button also has two states: available and unavailable. If [isEnable] is set to false, the button will be grayed out and the click event will not respond
///
///Other buttons are as follows:
///*[WaveSmallMainButton], small main color button

///Default minimum width
const double _BMinWidth = 84;

///Default line width
const double _BBorderWith = 1;

class WaveSmallOutlineButton extends StatelessWidget {
  ///The button displays the text, the default is 'confirm'
  final String? title;

  ///Click callback
  final VoidCallback? onTap;
///Whether it is available, the default is true. False means unavailable: greyed out, unclickable.
  final bool isEnable;

  ///Border color, border color,
  final Color? lineColor;

  ///text color
  final Color? textColor;

  ///rounded corners
  final double? radius;

  ///width
  final double? width;

  ///font weight
  final FontWeight fontWeight;

  ///font size
  final double fontSize;

  ///Configuration style
  final WaveButtonConfig? themeData;

  ///The incoming attribute has the highest priority, and the default configuration is used for those that are not passed in. For more information, please see [WaveSmallSecondaryOutlineButtonConfig.defaultConfig]
  const WaveSmallOutlineButton({
    Key? key,
    this. title,
this.onTap,
    this.isEnable = true,
    this.lineColor,
    this.textColor,
    this.radius,
    this.width,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaveButtonConfig defaultThemeConfig = themeData ?? WaveButtonConfig();

    defaultThemeConfig = defaultThemeConfig.merge(WaveButtonConfig(
      smallButtonFontSize: fontSize,
      smallButtonRadius: radius,
    ));
defaultThemeConfig = WaveThemeConfigurator.instance
        .getConfig(configId: defaultThemeConfig.configId)
        .buttonConfig
        .merge(defaultThemeConfig);

    TextPainter textPainter =
        TextPainter(textScaleFactor: MediaQuery.of(context).textScaleFactor);

    return LayoutBuilder(
      builder: (_, con) {
        TextStyle style = TextStyle(
          fontSize: defaultThemeConfig.smallButtonFontSize,
          fontWeight: fontWeight,
        );
textPainter.textDirection = TextDirection.ltr;
        textPainter.text = TextSpan(
            text: title ?? WaveIntl.of(context).localizedResource.confirm,
            style: style);
        textPainter.layout(maxWidth: con.maxWidth);
        double textWidth = textPainter.width;
        double _maxWidth = textWidth +
            WaveButtonConstant.horizontalPadding *2 +
            2 *_BBorderWith;

        double _minWidth = min(_BMinWidth, con.maxWidth);
if (_maxWidth <= _minWidth) {
          _maxWidth = _minWidth;
        }
        if (_maxWidth > con.maxWidth) {
          _maxWidth = con.maxWidth;
        }

        return WaveNormalButton.outline(
          constraints: BoxConstraints(
            minWidth: this.width ?? _minWidth,
            maxWidth: this.width ?? _maxWidth,
          ),
          borderWith: _BBorderWith,
          radius: defaultThemeConfig.smallButtonRadius,
text: title ?? WaveIntl.of(context).localizedResource.confirm,
          disableLineColor: defaultThemeConfig.commonConfig.borderColorBase,
          lineColor:
              lineColor ?? defaultThemeConfig.commonConfig.borderColorBase,
          textColor: textColor ?? defaultThemeConfig.commonConfig.colorTextBase,
          disableTextColor: Color(0xFFCCCCCC),
          isEnable: isEnable,
          alignment: Alignment.center,
          fontWeight: fontWeight,
fontSize: defaultThemeConfig.smallButtonFontSize,
          onTap: onTap,
          backgroundColor: Colors.white,
          disableBackgroundColor: Color(0xffcccccc).withOpacity(0.1),
        );
      },
    );
  }
}