import 'package:waveui/src/components/form/base/wave_form_item_type.dart';
import 'package:waveui/src/components/form/utils/wave_form_util.dart';
import 'package:waveui/src/components/line/wave_line.dart';
import 'package:waveui/src/theme/wave_theme_configurator.dart';
import 'package:waveui/src/theme/configs/wave_form_config.dart';
import 'package:waveui/src/constants/wave_fonts_constants.dart';
import 'package:flutter/material.dart';

///
/// 可展开收起组类型录入项
/// 内部可包含其他类型Widget
///
/// 包括"标题"、"副标题"、"错误信息提示"、"必填项提示"、"添加/删除按钮"、"消息提示"
///
// ignore: must_be_immutable
class WaveNormalFormGroup extends StatefulWidget {
  /// 录入项的唯一标识，主要用于录入类型页面框架中
  final String? label;

  /// 录入项类型，主要用于录入类型页面框架中
  final String type = WaveInputItemType.normalGroupType;

  /// 录入项标题
  final String title;

  /// 录入项子标题
  final String? subTitle;

  /// 录入项提示（问号图标&文案） 用户点击时触发onTip回调。
  /// 1. 若赋值为 空字符串（""）时仅展示"问号"图标，
  /// 2. 若赋值为非空字符串时 展示"问号图标&文案"，
  /// 3. 若不赋值或赋值为null时 不显示提示项
  /// 默认值为 3
  final String? tipLabel;

  /// 录入项错误提示
  final String error;

  /// 录入项是否为必填项（展示*图标） 默认为 false 不必填
  final bool isRequire;

  /// 录入项 是否可编辑
  final bool isEdit;

  /// 点击"-"图标回调
  final VoidCallback? onRemoveTap;

  /// 点击"？"图标回调
  final VoidCallback? onTip;

  /// 右侧文案
  final String? deleteLabel;

  /// 内部子项
  final List<Widget> children;

  /// form配置
  WaveFormItemConfig? themeData;

  WaveNormalFormGroup({
    Key? key,
    this.label,
    this.title = "",
    this.subTitle,
    this.tipLabel,
    this.error = "",
    this.isEdit = true,
    this.isRequire = false,
    this.onRemoveTap,
    this.onTip,
    this.deleteLabel,
    required this.children,
  }) : super(key: key) {
    this.themeData ??= WaveFormItemConfig();
    this.themeData = WaveThemeConfigurator.instance
        .getConfig(configId: this.themeData!.configId)
        .formItemConfig
        .merge(this.themeData);
  }

  @override
  WaveNormalFormGroupState createState() {
    return WaveNormalFormGroupState();
  }
}

class WaveNormalFormGroupState extends State<WaveNormalFormGroup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 14),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Offstage(
                  offstage: (widget.title.isEmpty),
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 6),
                            child: Text(
                              widget.title,
                              style: WaveFormUtil.getHeadTitleTextStyle(
                                  widget.themeData!,
                                  isBold: true),
                            )),
                      ],
                    ),
                  ),
                ),
                Offstage(
                  offstage: widget.deleteLabel == null,
                  child: GestureDetector(
                    onTap: () {
                      if (!WaveFormUtil.isEdit(widget.isEdit)) {
                        return;
                      }

                      WaveFormUtil.notifyRemoveTap(context, widget.onRemoveTap);
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        widget.deleteLabel ?? "",
                        style: TextStyle(
                          color: Color(0xFFFA3F3F),
                          fontSize: WaveFonts.f16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 副标题
          Container(
            alignment: Alignment.centerLeft,
            padding: WaveFormUtil.subTitleEdgeInsets(widget.themeData!),
            child: Offstage(
              offstage: (widget.subTitle == null || widget.subTitle!.isEmpty),
              child: Text(
                widget.subTitle ?? "",
                style: WaveFormUtil.getSubTitleTextStyle(widget.themeData!),
              ),
            ),
          ),

          Container(
            child: Column(
              children: getSubItem(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getSubItem() {
    List<Widget> result = <Widget>[];

    if (widget.children.isEmpty) {
      return result;
    }

    for (Widget w in widget.children) {
      result.add(WaveLine());
      result.add(w);
    }

    return result;
  }
}
