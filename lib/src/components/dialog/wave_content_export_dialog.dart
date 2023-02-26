import 'package:waveui/src/components/dialog/wave_dialog_utils.dart';
import 'package:waveui/src/constants/wave_asset_constants.dart';
import 'package:waveui/src/theme/wave_theme_configurator.dart';
import 'package:waveui/src/theme/configs/wave_dialog_config.dart';
import 'package:waveui/src/utils/wave_tools.dart';
import 'package:flutter/material.dart';

/// 描述: 内容可扩展Dialog
// ignore: must_be_immutable
class WaveContentExportWidget extends StatelessWidget {
  /// 标题
  final String? title;

  /// 是否可关闭
  final bool isClose;

  /// 中间内容widget
  final Widget? contentWidget;

  /// 提交按钮文字
  final String? submitText;

  /// 内容最大高度
  final Color? submitBgColor;

  /// 提交操作
  final VoidCallback? onSubmit;

  /// 是否展示底部操作区域
  final bool isShowOperateWidget;

  WaveDialogConfig? themeData;

  WaveContentExportWidget(this.contentWidget,
      {this.title,
      required this.isClose,
      this.submitText,
      this.onSubmit,
      this.submitBgColor,
      required this.isShowOperateWidget,
      this.themeData}) {
    this.themeData ??= WaveDialogConfig();
    this.themeData = WaveThemeConfigurator.instance
        .getConfig(configId: themeData!.configId)
        .dialogConfig
        .merge(themeData);
  }

  /// 当content含TextField  键盘弹起遮挡内容
  /// 因此顶级父Widget 采用SingleChildScrollView

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x33999999),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    decoration: BoxDecoration(
                      //背景
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(
                          WaveDialogUtils.getDialogRadius(
                              themeData!))), //设置四周圆角 角度
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            _generateTitleWidget(),
                            contentWidget ?? Container(),
                            _generateBottomWidget(context),
                          ],
                        ),
                        _generateCloseWidget(context),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }

  Widget _generateCloseWidget(BuildContext context) {
    if (isClose) {
      return Positioned(
          right: 0.0,
          child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: WaveUITools.getAssetImage(WaveAsset.iconPickerClose),
              )));
    }
    return const SizedBox.shrink();
  }

  /// 构建Dialog标题
  Widget _generateTitleWidget() {
    return Padding(
      padding: null != title && title!.isNotEmpty
          ? EdgeInsets.fromLTRB(20, 28, 20, 12)
          : EdgeInsets.only(top: 20),
      child: null != title && title!.isNotEmpty
          ? Text(
              title!,
              style: WaveDialogUtils.getDialogTitleStyle(themeData!),
            )
          : Container(),
    );
  }

  /// 构建底部操作按钮
  Widget _generateBottomWidget(BuildContext context) {
    return Padding(
        padding: isShowOperateWidget
            ? EdgeInsets.fromLTRB(20, 12, 20, 20)
            : EdgeInsets.only(top: 20),
        child: isShowOperateWidget
            ? GestureDetector(
                child: Container(
                    decoration: BoxDecoration(
                      //背景
                      color:
                          submitBgColor ?? themeData!.commonConfig.brandPrimary,
                      borderRadius:
                          BorderRadius.all(Radius.circular(6.0)), //设置四周圆角 角度
                    ),
                    alignment: Alignment.center,
                    height: 48,
                    child: Text(submitText ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 18))),
                onTap: () {
                  if (onSubmit != null) onSubmit!();
                },
              )
            : const SizedBox.shrink());
  }
}
