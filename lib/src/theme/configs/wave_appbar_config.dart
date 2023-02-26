import 'package:waveui/src/components/navbar/wave_appbar_theme.dart';
import 'package:waveui/src/constants/wave_asset_constants.dart';
import 'package:waveui/src/constants/wave_strings_constants.dart';
import 'package:waveui/src/theme/base/wave_base_config.dart';
import 'package:waveui/src/theme/base/wave_default_config_utils.dart';
import 'package:waveui/src/theme/base/wave_text_style.dart';
import 'package:waveui/src/theme/wave_theme_configurator.dart';
import 'package:waveui/src/theme/configs/wave_common_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef WaveWidgetBuilder = Widget Function();

/// Appbar主题配置
class WaveAppBarConfig extends WaveBaseConfig {
  /// WaveAppBar 主题配置，遵循外部主题配置
  /// 默认为 [WaveDefaultConfigUtils.defaultAppBarConfig]
  WaveAppBarConfig({
    Color? backgroundColor,
    double? appBarHeight,
    WaveWidgetBuilder? leadIconBuilder,
    WaveTextStyle? titleStyle,
    WaveTextStyle? actionsStyle,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? showDefaultBottom,
    String configId = GLOBAL_CONFIG_ID,
  })  : _backgroundColor = backgroundColor,
        _appBarHeight = appBarHeight,
        _leadIconBuilder = leadIconBuilder,
        _titleStyle = titleStyle,
        _actionsStyle = actionsStyle,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        _systemUiOverlayStyle = systemUiOverlayStyle,
        _showDefaultBottom = showDefaultBottom,
        super(configId: configId);

  WaveAppBarConfig.dark({
    double? appBarHeight,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    String configId = GLOBAL_CONFIG_ID,
  })  : _appBarHeight = appBarHeight,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        super(configId: configId) {
    _backgroundColor = Color(0xff2E313B);
    _leadIconBuilder = () => Image.asset(
          WaveAsset.iconBackWhite,
          package: WaveStrings.flutterPackageName,
          width: WaveAppBarTheme.iconSize,
          height: WaveAppBarTheme.iconSize,
          fit: BoxFit.fitHeight,
        );
    _titleStyle = WaveTextStyle(
      fontSize: WaveAppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: WaveAppBarTheme.darkTextColor,
    );
    _actionsStyle = WaveTextStyle(
      color: WaveAppBarTheme.darkTextColor,
      fontSize: WaveAppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    );
    _systemUiOverlayStyle = SystemUiOverlayStyle.light;
  }

  WaveAppBarConfig.light({
    double? appBarHeight,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    String configId = GLOBAL_CONFIG_ID,
  })  : _appBarHeight = appBarHeight,
        _titleMaxLength = titleMaxLength,
        _leftAndRightPadding = leftAndRightPadding,
        _itemSpacing = itemSpacing,
        _titlePadding = titlePadding,
        _iconSize = iconSize,
        super(configId: configId) {
    _backgroundColor = Colors.white;
    _leadIconBuilder = () => Image.asset(
          WaveAsset.iconBackBlack,
          package: WaveStrings.flutterPackageName,
          width: WaveAppBarTheme.iconSize,
          height: WaveAppBarTheme.iconSize,
          fit: BoxFit.fitHeight,
        );
    _titleStyle = WaveTextStyle(
      fontSize: WaveAppBarTheme.titleFontSize,
      fontWeight: FontWeight.w600,
      color: WaveAppBarTheme.lightTextColor,
    );
    _actionsStyle = WaveTextStyle(
      color: WaveAppBarTheme.lightTextColor,
      fontSize: WaveAppBarTheme.actionFontSize,
      fontWeight: FontWeight.w600,
    );
    _systemUiOverlayStyle = SystemUiOverlayStyle.dark;
  }

  /// AppBar 的背景色
  Color? _backgroundColor;

  Color get backgroundColor =>
      _backgroundColor ??
      WaveDefaultConfigUtils.defaultAppBarConfig.backgroundColor;

  /// AppBar 的高度
  double? _appBarHeight;

  double get appBarHeight =>
      _appBarHeight ?? WaveDefaultConfigUtils.defaultAppBarConfig.appBarHeight;

  /// 返回按钮的child widget，一般为Image
  WaveWidgetBuilder? _leadIconBuilder;

  WaveWidgetBuilder get leadIconBuilder =>
      _leadIconBuilder ??
      WaveDefaultConfigUtils.defaultAppBarConfig.leadIconBuilder;

  /// 标题样式，仅当直接 title 设置为 String 生效
  ///
  /// **注意**：`fontSize` 必须传大小，否则报错
  WaveTextStyle? _titleStyle;

  WaveTextStyle get titleStyle =>
      _titleStyle ?? WaveDefaultConfigUtils.defaultAppBarConfig.titleStyle;

  /// 右侧文字按钮样式，仅当直接actions里面元素为WaveTextAction类型生效
  ///
  /// **注意**：`fontSize` 必须传大小，否则报错
  ///
  /// WaveTextStyle(
  ///   color: AppBarBrightness(brightness).textColor,
  ///   fontSize: WaveAppBarTheme.actionFontSize,
  ///   fontWeight: FontWeight.w600,
  /// )
  WaveTextStyle? _actionsStyle;

  WaveTextStyle get actionsStyle =>
      _actionsStyle ?? WaveDefaultConfigUtils.defaultAppBarConfig.actionsStyle;

  /// AppBar title 的最大字符数 8
  int? _titleMaxLength;

  int get titleMaxLength =>
      _titleMaxLength ??
      WaveDefaultConfigUtils.defaultAppBarConfig.titleMaxLength;

  /// 左右边距
  double? _leftAndRightPadding;

  double get leftAndRightPadding =>
      _leftAndRightPadding ??
      WaveDefaultConfigUtils.defaultAppBarConfig.leftAndRightPadding;

  /// 元素间间距
  double? _itemSpacing;

  double get itemSpacing =>
      _itemSpacing ?? WaveDefaultConfigUtils.defaultAppBarConfig.itemSpacing;

  /// title的padding
  EdgeInsets? _titlePadding;

  EdgeInsets get titlePadding =>
      _titlePadding ?? WaveDefaultConfigUtils.defaultAppBarConfig.titlePadding;

  /// leadIcon 宽高，需要相同
  /// 默认为 20
  double? _iconSize;

  double get iconSize =>
      _iconSize ?? WaveDefaultConfigUtils.defaultAppBarConfig.iconSize;

  /// statusBar 样式
  /// 默认为 [SystemUiOverlayStyle.dark]
  SystemUiOverlayStyle? _systemUiOverlayStyle;

  SystemUiOverlayStyle get systemUiOverlayStyle =>
      _systemUiOverlayStyle ??
      WaveDefaultConfigUtils.defaultAppBarConfig.systemUiOverlayStyle;

  /// 是否展示Appbar bottom 分割线
  /// 默认为 [false]
  bool? _showDefaultBottom;

  bool get showDefaultBottom =>
      _showDefaultBottom ??
      WaveDefaultConfigUtils.defaultAppBarConfig.showDefaultBottom;

  @override
  void initThemeConfig(
    String configId, {
    WaveCommonConfig? currentLevelCommonConfig,
  }) {
    super.initThemeConfig(
      configId,
      currentLevelCommonConfig: currentLevelCommonConfig,
    );

    /// 用户全局组件配置
    WaveAppBarConfig appbarConfig = WaveThemeConfigurator.instance
        .getConfig(configId: configId)
        .appBarConfig;

    _backgroundColor ??= appbarConfig._backgroundColor;
    _appBarHeight ??= appbarConfig._appBarHeight;
    _leadIconBuilder ??= appbarConfig._leadIconBuilder;
    _titleStyle = appbarConfig.titleStyle.merge(_titleStyle);
    _actionsStyle = appbarConfig.actionsStyle.merge(_actionsStyle);
    _titleMaxLength ??= appbarConfig._titleMaxLength;
    _leftAndRightPadding ??= appbarConfig._leftAndRightPadding;
    _itemSpacing ??= appbarConfig._itemSpacing;
    _titlePadding ??= appbarConfig._titlePadding;
    _iconSize ??= appbarConfig._iconSize;
    _systemUiOverlayStyle ??= appbarConfig._systemUiOverlayStyle;
    _showDefaultBottom ??= appbarConfig._showDefaultBottom;
  }

  WaveAppBarConfig copyWith({
    Color? backgroundColor,
    double? appBarHeight,
    WaveWidgetBuilder? leadIconBuilder,
    WaveTextStyle? titleStyle,
    WaveTextStyle? actionsStyle,
    int? titleMaxLength,
    double? leftAndRightPadding,
    double? itemSpacing,
    EdgeInsets? titlePadding,
    double? iconSize,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    bool? showDefaultBottom,
  }) {
    return WaveAppBarConfig(
      backgroundColor: backgroundColor ?? _backgroundColor,
      appBarHeight: appBarHeight ?? _appBarHeight,
      leadIconBuilder: leadIconBuilder ?? _leadIconBuilder,
      titleStyle: titleStyle ?? _titleStyle,
      actionsStyle: actionsStyle ?? _actionsStyle,
      titleMaxLength: titleMaxLength ?? _titleMaxLength,
      leftAndRightPadding: leftAndRightPadding ?? _leftAndRightPadding,
      itemSpacing: itemSpacing ?? _itemSpacing,
      titlePadding: titlePadding ?? _titlePadding,
      iconSize: iconSize ?? _iconSize,
      systemUiOverlayStyle: systemUiOverlayStyle ?? _systemUiOverlayStyle,
      showDefaultBottom: showDefaultBottom ?? _showDefaultBottom,
    );
  }

  WaveAppBarConfig merge(WaveAppBarConfig? other) {
    if (other == null) return this;
    return copyWith(
      backgroundColor: other._backgroundColor,
      appBarHeight: other._appBarHeight,
      leadIconBuilder: other._leadIconBuilder,
      titleStyle: titleStyle.merge(other._titleStyle),
      actionsStyle: actionsStyle.merge(other._actionsStyle),
      titleMaxLength: other._titleMaxLength,
      leftAndRightPadding: other._leftAndRightPadding,
      itemSpacing: other._itemSpacing,
      titlePadding: other._titlePadding,
      iconSize: other._iconSize,
      systemUiOverlayStyle: other._systemUiOverlayStyle,
      showDefaultBottom: other._showDefaultBottom,
    );
  }
}
