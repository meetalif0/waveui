import 'package:waveui/src/components/button/wave_normal_button.dart';
import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:waveui/src/theme/wave_theme.dart';
import 'package:flutter/material.dart';

///The ghost button related to the theme color in the page can support custom background color, text color, etc.
///
///Compared with [WaveBigMainButton], the background color of this button is only withOpacity(0.1) of its background color
///And the button does not support the unavailable state
///
///The button is in the shape of a rounded rectangle and does not support changing the shape.
///
///WaveBigGhostButtonWidget(
///title: 'Submit',
///)
///
///Other buttons are as follows:
///*[WaveBigMainButton], big main color button
///*[WaveBigOutlineButton], big border button

class WaveBigGhostButton extends StatelessWidget {
  ///Button copy, default 'Confirm'
  final String? title;

  ///Copy color
  final Color? titleColor;

  ///Button background color
  final Color? bgColor;

  ///click callback
  final VoidCallback? onTap;

  ///Default parent layout available space
  final double? width;
  final WaveButtonConfig? themeData;

  const WaveBigGhostButton({
    Key? key,
    this.title,
    this.titleColor,
    this.bgColor,
    this.onTap,
    this.width,
    this.themeData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WaveButtonConfig defaultThemeConfig = themeData ?? WaveButtonConfig();
    defaultThemeConfig = WaveThemeConfigurator.instance
        .getConfig(configId: defaultThemeConfig.configId)
        .buttonConfig
        .merge(defaultThemeConfig);

    return WaveNormalButton(
      borderRadius: BorderRadius.circular(defaultThemeConfig.bigButtonRadius),
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity,
          height: defaultThemeConfig.bigButtonHeight),
      backgroundColor: bgColor ??
          defaultThemeConfig.commonConfig.brandPrimary.withOpacity(0.05),
      onTap: onTap,
      alignment: Alignment.center,
      text: title ?? WaveIntl.of(context).localizedResource.confirm,
      textColor: titleColor ?? defaultThemeConfig.commonConfig.brandPrimary,
      fontSize: defaultThemeConfig.bigButtonFontSize,
    );
  }
}
