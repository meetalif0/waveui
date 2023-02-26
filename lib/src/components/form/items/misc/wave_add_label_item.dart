import 'package:waveui/src/components/form/base/wave_form_item_type.dart';
import 'package:waveui/src/components/form/utils/wave_form_util.dart';
import 'package:waveui/src/theme/wave_theme.dart';
import 'package:waveui/src/constants/wave_fonts_constants.dart';
import 'package:flutter/material.dart';

/// 添加组类型录入项所使用的Widget
// ignore: must_be_immutable
class WaveAddLabel extends StatefulWidget {
  /// 录入项的唯一标识，主要用于录入类型页面框架中
  final String? label;

  /// 录入项类型，主要用于录入类型页面框架中
  final String type = WaveInputItemType.labelAdd;

  /// 标题文案
  final String title;

  /// 是否可编辑
  final bool isEdit;

  /// 点击录入区回调
  final VoidCallback? onTap;

  /// 背景色
  final Color? backgroundColor;

  /// form配置
  WaveFormItemConfig? themeData;

  WaveAddLabel({
    Key? key,
    this.label,
    this.title = "",
    this.isEdit = true,
    this.backgroundColor,
    this.onTap,
    this.themeData,
  }) : super(key: key) {
    this.themeData ??= WaveFormItemConfig();
    this.themeData = WaveThemeConfigurator.instance
        .getConfig(configId: this.themeData!.configId)
        .formItemConfig
        .merge(this.themeData);
    this.themeData = this
        .themeData!
        .merge(WaveFormItemConfig(backgroundColor: backgroundColor));
  }

  @override
  WaveAddLabelState createState() {
    return WaveAddLabelState();
  }
}

class WaveAddLabelState extends State<WaveAddLabel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!WaveFormUtil.isEdit(widget.isEdit)) {
          return;
        }

        WaveFormUtil.notifyAddTap(context, widget.onTap);
      },
      child: Container(
        color: widget.themeData!.backgroundColor,
        padding: EdgeInsets.fromLTRB(20, 15, 0, 15),
        child: Text(
          widget.title,
          style: TextStyle(
            color: WaveThemeConfigurator.instance
                .getConfig()
                .commonConfig
                .brandPrimary,
            fontSize: WaveFonts.f18,
          ),
        ),
      ),
    );
  }
}
