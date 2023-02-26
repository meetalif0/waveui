import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:waveui/src/theme/wave_theme.dart';
import 'package:flutter/material.dart';
import 'wave_normal_button.dart';

///The main button in the page supports dynamically setting the background color and setting it to gray
///
///Compared with [WaveSmallMainButton], this button occupies the maximum available space allocated by the parent node, and the button copy is centered
///
///The button is in the shape of a rounded rectangle and does not support changing the shape.
///
///The button also has two states: available and unavailable. If [isEnable] is set to false, the button will be grayed out and the click event will not respond
///
///Big submit button
///WaveBigMainButtonWidget(
///title: 'Submit',
///)
///
///WaveBigMainButtonWidget(
///title: 'Submit',
///isEnable: false,
///onTap: () {
///WaveToast.show('clicked the main button', context);
///},
///),

///Other buttons are as follows:
///*[WaveBigGhostButton], the ghost button of the big main color
///*[WaveBigOutlineButton], big border button
class WaveBigMainButton extends StatelessWidget {
  ///The button displays the text, the default is 'Confirm'
  final String? title;

  ///Available, false is gray effect
  final bool isEnable;

  ///click callback
  final VoidCallback? onTap;

  ///Default parent layout available space
  final double? width;

  ///background color
  final Color? bgColor;

  final WaveButtonConfig? themeData;

  const WaveBigMainButton({
    Key? key,
    this.title,
    this.width,
    this.isEnable = true,
    this.onTap,
    this.themeData,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaveButtonConfig defaultThemeConfig = themeData ?? WaveButtonConfig();

    defaultThemeConfig = WaveThemeConfigurator.instance
        .getConfig(configId: defaultThemeConfig.configId)
        .buttonConfig
        .merge(defaultThemeConfig);

    return WaveNormalButton(
      constraints: BoxConstraints.tightFor(
          width: width ?? double.infinity,
          height: defaultThemeConfig.bigButtonHeight),
      alignment: Alignment.center,
      isEnable: isEnable,
      text: title ?? WaveIntl.of(context).localizedResource.confirm,
      borderRadius:
          BorderRadius.all(Radius.circular(defaultThemeConfig.bigButtonRadius)),
      fontSize: defaultThemeConfig.bigButtonFontSize,
      backgroundColor: bgColor ?? defaultThemeConfig.commonConfig.brandPrimary,
      disableBackgroundColor: Color(0xFFCCCCCC),
      onTap: onTap,
      textColor: Colors.white,
      disableTextColor:
          defaultThemeConfig.commonConfig.colorTextBaseInverse.withOpacity(0.7),
    );
  }
}
