import 'package:waveui/src/constants/wave_constants.dart';
import 'package:waveui/src/utils/wave_multi_click_util.dart';
import 'package:flutter/material.dart';

const double _BFontSize = 16;
const Color _BTextColor = Colors.white;
const Color _BBackgroundColor = Color(0xFF0984F9);
const Color _BDisableBackgroundColor = Color(0xFFCCCCCC);
const FontWeight _BFontWeight = FontWeight.bold;
const double _BRadius = 6;

///Common button, support users to set background color, availability and other attributes
///If [WaveBigMainButton], [WaveSmallMainButton], [WaveBigOutlineButton] cannot meet user needs
///This button can be used directly
///
///[isEnable] If set to false, the button is grayed out, and the click event does not respond
///
///The [Text] text component is used by default, if the user wants to display other components. For example, pictures, etc., you can set the [child] attribute
///
///The style attributes required by the text component can be set through [textStyle], or set separately through [fontSize]
///
///The layout rules of this component refer to the layout rules of [Container]
///The [alignment] attribute of this component defaults to null, even if the constraint given by the parent layout is unbounded (the maximum width or maximum height is double.infinity.)
///The size of the component will be the same size as the child.
///That is to say: do not set a value for the [alignment] attribute, even if [WaveNormalButton] is placed in [column], [ListView],
///He will also be as small as possible. If the [constraints] attribute is set, it will be laid out according to the [constraints].
///
///Case number one
///```dart
///WaveNormalButton(
///text: 'The main case is very long',
///onTap: () {
///WaveToast.show('clicked the main button', context);
///},
///)
///```
///The size of the button is the size of the text + the size of the padding
///
///Case 2
///```dart
///WaveNormalButton(
///constraints: BoxConstraints. expand(height: 60),
///text: 'The main case is very long',
///onTap: () {
///WaveToast.show('clicked the main button', context);
///},
///)
///```
///The size of the button: the width is full of the parent layout, and the height is 60
///
///If the [alignment] of the component is assigned a value, the constraint of the parent layout is bounded.
///The size of the component is the constraint of the parent layout, and [text] or [child] will be placed according to the [alignment] attribute, such as centering.
///
///Case number one
///```dart
///WaveNormalButton(
///alignment: Alignment. center,
///text: 'The main case is very long',
///onTap: () {
///WaveToast.show('clicked the main button', context);
///},
///)
///```
///The size of the button: the width is full of the parent layout, and the text is centered
///
///*[WaveBigMainButton], big main color button
///*[WaveBigOutlineButton], big border button
///*[WaveSmallMainButton], small main color button
///*[WaveSmallOutlineButton], small border button
///
class WaveNormalButton extends StatelessWidget {
  ///Whether the button is available, the default is true
  final bool isEnable;

  ///Callback for button click
  final VoidCallback? onTap;

  ///The text displayed by the button
  final String text;

  ///The text color of the button is white by default [_BTextColor]
  final Color textColor;

  ///The text size of the button defaults to [_BFontSize]
  final double fontSize;

  ///The text color of the unavailable button
  final Color? disableTextColor;

  ///Button background color default [_BBackgroundColor]
  final Color backgroundColor;

  ///The background color of the button is not available. Default [_BDisableBackgroundColor]
  final Color disableBackgroundColor;

  ///Button padding default horizontal [_BHorizontalPadding] vertical [_BVerticalPadding]
  final EdgeInsetsGeometry insertPadding;

  ///Modification of the button Default solid color background
  final Decoration? decoration;

  ///The display child node of the button has a higher priority than [text]
  final Widget? child;

  ///The text display style of the button has priority over properties such as [textColor]
  final TextStyle? textStyle;

  ///The text Weight of the button defaults to [FontWeight.bold]
  final FontWeight fontWeight;

  ///The layout constraints of the button default to adaptive size
  final BoxConstraints constraints;

  ///The inner alignment of the button is null by default
  final Alignment? alignment;

  ///button rounded corner size
  final BorderRadiusGeometry borderRadius;
  WaveNormalButton({
    Key? key,
    required this.text,
    this.backgroundColor = _BBackgroundColor,
    this.isEnable = true,
    this.onTap,
    this.insertPadding = const EdgeInsets.symmetric(
        vertical: WaveButtonConstant.verticalPadding,
        horizontal: WaveButtonConstant.horizontalPadding),
    this.decoration,
    this.child,
    this.textStyle,
    this.fontWeight = _BFontWeight,
    this.fontSize = _BFontSize,
    this.textColor = _BTextColor,
    this.disableTextColor,
    this.disableBackgroundColor = _BDisableBackgroundColor,
    this.constraints = const BoxConstraints.tightFor(),
    this.borderRadius = const BorderRadius.all(Radius.circular(_BRadius)),
    this.alignment,
  }) : super(key: key);

  WaveNormalButton.outline({
    Key? key,
    Color? disableLineColor,
    Color? lineColor,
    double radius = 6,
    double borderWith = 1.0,
    required this.text,
    this.isEnable = true,
    this.backgroundColor = _BBackgroundColor,
    this.disableBackgroundColor = _BDisableBackgroundColor,
    this.alignment,
    this.child,
    this.onTap,
    this.textColor = _BTextColor,
    this.fontWeight = _BFontWeight,
    this.fontSize = _BFontSize,
    this.disableTextColor,
    this.insertPadding = const EdgeInsets.symmetric(
        vertical: WaveButtonConstant.verticalPadding,
        horizontal: WaveButtonConstant.horizontalPadding),
    this.textStyle,
    this.constraints = const BoxConstraints.tightFor(),
    this.borderRadius = const BorderRadius.all(Radius.circular(_BRadius)),
  })  : decoration = _OutlineBoxDecorationCreator.createOutlineBoxDecoration(
            isEnable: isEnable,
            disableBackgroundColor: disableBackgroundColor,
            disableLineColor: disableLineColor,
            lineColor: lineColor,
            backgroundColor: backgroundColor,
            radius: radius,
            borderWith: borderWith),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (WaveMultiClickUtils.isMultiClick()) {
          return;
        }
        if (isEnable && onTap != null) {
          onTap!();
        }
      },
      child: Container(
        alignment: alignment,
        decoration: decoration ?? _getBoxDecoration(_getBackgroundColor()),
        constraints: constraints,
        padding: insertPadding,
        child: child ??
            Center(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: _getTextStyle(),
              ),
            ),
      ),
    );
  }

  TextStyle _getTextStyle() {
    if (textStyle != null) {
      return textStyle!;
    }
    Color textColor;
    if (isEnable) {
      textColor = this.textColor;
    } else {
      textColor = this.disableTextColor ?? (this.textColor).withOpacity(0.7);
    }

    return TextStyle(
      fontSize: fontSize,
      color: textColor,
      fontWeight: fontWeight,
    );
  }

  Color _getBackgroundColor() {
    return isEnable ? backgroundColor : disableBackgroundColor;
  }

  BoxDecoration _getBoxDecoration(Color? bgColor) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: borderRadius,
    );
  }
}

class _OutlineBoxDecorationCreator {
  static BoxDecoration createOutlineBoxDecoration({
    required bool isEnable,
    Color? disableLineColor,
    Color? lineColor,
    required Color backgroundColor,
    required Color disableBackgroundColor,
    double radius = 6,
    double borderWith = 1.0,
  }) {
    Color _lineColor = isEnable ? lineColor! : disableLineColor!;
    Color _bgColor = isEnable ? backgroundColor : disableBackgroundColor;

    return BoxDecoration(
        border: Border.all(color: _lineColor, width: borderWith),
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        color: _bgColor);
  }
}
