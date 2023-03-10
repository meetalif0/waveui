import 'package:waveui/src/theme/wave_theme.dart';
import 'package:flutter/material.dart';

import 'wave_switch_button_base.dart';

/// 描述: 开关按钮
class WaveSwitchButton extends StatefulWidget {
  final Size size;

  ///选中的状态
  final bool value;

  ///是否可以交互
  final bool enabled;

  ///点击事件
  final ValueChanged<bool> onChanged;

  ///未选中时边框的颜色
  final Color? borderColor;

  WaveSwitchButton({
    Key? key,
    required this.value,
    required this.onChanged,
    this.enabled = true,
    this.size = const Size(42, 26),
    this.borderColor,
  }) : super(key: key);

  @override
  _WaveSwitchButtonState createState() => _WaveSwitchButtonState();
}

class _WaveSwitchButtonState extends State<WaveSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return WaveBaseSwitchButton(
      borderColor: widget.borderColor ?? _getBorderColor(),
      value: widget.value,
      enabled: widget.enabled,
      size: widget.size,
      trackColor: _getTrackColor(),
      thumbColor: widget.enabled ? Colors.white : Color(0xFFFDFDFD),
      onChanged: widget.enabled ? widget.onChanged : null,
    );
  }

  Color _getTrackColor() {
    if (widget.value) {
      return widget.enabled
          ? WaveThemeConfigurator.instance.getConfig().commonConfig.brandPrimary
          : WaveThemeConfigurator.instance
              .getConfig()
              .commonConfig
              .brandPrimary
              .withAlpha(20);
    } else {
      return widget.enabled ? Color(0xFFFAFAFA) : Color(0xFFeeeeee);
    }
  }

  Color _getBorderColor() {
    if (widget.value) {
      return _getTrackColor();
    } else {
      if (widget.enabled) {
        return const Color(0xffeeeeee);
      } else {
        return const Color(0xffeeeeee);
      }
    }
  }
}
