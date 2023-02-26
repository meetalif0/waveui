import 'dart:ui';

import 'package:bindings_compatible/bindings_compatible.dart';
import 'package:waveui/src/components/line/wave_line.dart';
import 'package:waveui/src/theme/wave_theme_configurator.dart';
import 'package:waveui/src/theme/configs/wave_appbar_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///AppBar component, based on [AppBar] package. In order to solve the limitation of the native AppBar on the leading width
///After version 1.21, Flutter released the width limit [https://github.com/flutter/flutter/blob/flutter-1.21-candidate.0/packages/flutter/lib/src/material/app_bar. dart]
///
///Layout rules:
///leading is the content displayed on the left
///title is the content displayed in the middle
///action is the content displayed on the right
///AppBar is still presented, the optimization point is: the first title can be passed in String
///The second action and leading encapsulate the quick use
///
///If the user wants to customize the effect, he can pass in the properties of the appbar
///
///Layout steps: the same as the default layout of appbar, first leading, then action, and finally title
///
///First, calculate the width of the leading. The external input can leadWidth, and the external input is the main
///
///This component provides calculations for [WaveDoubleLeading] and [WaveBackLeading]
///The default size of leading is [WaveAppBarConfig.leadingSize],
///The size of [WaveDoubleLeading] is but 2 times the width of Leading + spacing
///
///The default width of leadingWidth is WaveAppBarConfig.leadingSize
///If the incoming leading is a completely custom Widget, you can set the leadingWidth by yourself
///
///Second, place the action
///
///Finally, align the title
///
///The component supports two display modes dark and light. Through the [WaveAppBar.brightness] attribute setting,
///Dark [Brightness.dark] mode, the background color is black, and the icon and text color are white.
///Light [Brightness.light] mode, the background color is white, and the icon and text color are black.
///If you use the default [WaveBackLeading] and [WaveAppBarTitle]
///The text color and backLeading in BkAppBar can automatically change with [WaveAppBar.brightness].
///
///The component provides a default return leading. If you don't need the default leading, you can set [automaticallyImplyLeading] to false
///The default leading provides a default return [Navigator.pop(context)],
///If it is opened by native, it may need to be processed separately, otherwise a white screen will appear
///
///Other properties have the same meaning as AppBar itself
///
///Display: Back button, Appbar sample text
///WaveAppBar(
///title: 'Appbar example',
///)
///
///Display: custom leading, tab switching, custom action
///WaveAppBar(
///  leading: WaveBackLeading(),
///  title: Row(
///  mainAxisSize: MainAxisSize.min,
///     crossAxisAlignment: CrossAxisAlignment.start,
///     children: <Widget>[
///     GestureDetector(
///        onTap: () {
///          currentIndex = 0;
///          setState(() {});
///         },
///        child: Text(
///          '二手',
///           style: currentIndex == 0 ? selectedHeiStyle : unSelectedHeiStyle,
///          ),
///     ),
///     SizedBox(
///        width: 24,
///),
///GestureDetector(
///onTap: () {
///currentIndex = 1;
///setState(() {});
///},
///child: Text(
///'New house',
///style: currentIndex == 1 ? selectedHeiStyle : unSelectedHeiStyle,
///),
///)
///],
///),
///actions: WaveIconAction()
///
///Related components are as follows:
///*[WaveBackLeading], custom leading, single text or button
///*[WaveDoubleLeading], custom leading, two text or button
///*[WaveAppBarTitle], custom title, plain text display
///*[WaveIconAction], custom action, display icon
///*[WaveTextAction], custom action, plain text display
///*[WaveBarBottomDivider], the dividing line between appbar and other elements, same as [WaveLine]
///
///
class WaveAppBar extends PreferredSize {
  ///The active area on the left side of the navigation bar is null and
  ///When [automaticallyImplyLeading] is true, the default assignment is [WaveBackLeading]
  final Widget? leading;

  ///AppBar title, must be String or Widget type
  ///When it is a String, [WaveAppBarTitle] will be used to load the title
  final dynamic title;

  ///In order to facilitate business use, it can be set to Widget or List<Widget>
  ///The incoming Widget will automatically add margins and convert to List<Widget>
  ///The incoming List<Widget> will automatically add the space between the right margin and the action
  final dynamic actions;

  ///Whether to automatically add Leading implementation
  final bool automaticallyImplyLeading;

  ///The following attributes correspond to the attributes in [AppBar]
  ///For detailed introduction, please refer to the [AppBar] document
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final double elevation;
  final Brightness? brightness;
  final double toolbarOpacity;
  final double bottomOpacity;
  final Alignment titleAlignment;
  final Widget? flexibleSpace;
  final double? leadingWidth;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextTheme? textTheme;
  final bool primary;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;

  ///By default, the back button and flutter's pop are processed. If it is opened by native, it may need to be processed separately, otherwise a white screen will appear
  ///backLeadCallback is the default processing callback
  ///DefaultLeadingCallBack can also set unified return processing by changing the method parameter, which is static
  final VoidCallback? backLeadCallback;

  ///Whether to display the default eeeeee dividing line, the default display, can be set to not display
  final bool? showDefaultBottom;
  final bool showLeadingDivider;
  final WaveAppBarConfig? themeData;

  WaveAppBar(
      {Key? key,
      this.leading,
      this.showLeadingDivider = false,
      this.title,
      this.actions,
      this.backgroundColor,
      this.bottom,
      this.elevation = 0,
      this.automaticallyImplyLeading = true,
      this.brightness,
      this.toolbarOpacity = 1.0,
      this.bottomOpacity = 1.0,
      this.titleAlignment = Alignment.center,
      this.flexibleSpace,
      this.backLeadCallback,
      this.showDefaultBottom,
      this.themeData,
      this.leadingWidth,
      this.shadowColor,
      this.shape,
      this.iconTheme,
      this.actionsIconTheme,
      this.excludeHeaderSemantics = false,
      this.primary = true,
      this.textTheme,
      this.titleSpacing})
      : assert(
            actions == null || actions is Widget || (actions is List<Widget>)),
        assert(title == null || title is String || title is Widget),
        super(key: key, child: Container(), preferredSize: Size(0, 0));

  WaveAppBar.buildSearchResultStyle(
      {Key? key,
      String? title,
      this.backgroundColor,
      this.bottom,
      this.brightness,
      this.showLeadingDivider = true,
      this.flexibleSpace,
      this.backLeadCallback,
      this.showDefaultBottom = true,
      this.themeData,
      this.leadingWidth,
      this.shadowColor,
      this.shape,
      this.iconTheme,
      this.actionsIconTheme,
      this.excludeHeaderSemantics = false,
      this.primary = true,
      this.textTheme,
      this.titleSpacing})
      : this.actions = null,
        this.elevation = 0,
        this.toolbarOpacity = 1.0,
        this.bottomOpacity = 1.0,
        this.leading = null,
        this.automaticallyImplyLeading = false,
        this.titleAlignment = Alignment.centerLeft,
        this.title = _WaveSearchResultAppBar(
          appBarConfig: themeData,
          backgroundColor: backgroundColor,
          title: title,
          bottom: bottom,
          brightness: brightness,
          showLeadingDivider: showLeadingDivider,
          flexibleSpace: flexibleSpace,
          backLeadCallback: backLeadCallback,
          showDefaultBottom: showDefaultBottom,
        ),
        super(key: key, child: Container(), preferredSize: const Size(0, 0));
  @override
  Size get preferredSize {
    WaveAppBarConfig _defaultConfig = themeData ?? WaveAppBarConfig();
    _defaultConfig = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultConfig.configId)
        .appBarConfig
        .merge(_defaultConfig);
    return Size.fromHeight(
        _defaultConfig.appBarHeight + (bottom?.preferredSize.height ?? 0.0));
  }

  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultConfig = themeData ?? WaveAppBarConfig();
//When an external incoming topic
    if (brightness == Brightness.light) {
      _defaultConfig = _defaultConfig.merge(WaveAppBarConfig.light());
    } else if (brightness == Brightness.dark) {
      _defaultConfig = _defaultConfig.merge(WaveAppBarConfig.dark());
    }
    _defaultConfig = _defaultConfig.merge(WaveAppBarConfig(
        backgroundColor: this.backgroundColor,
        showDefaultBottom: this.showDefaultBottom));

    _defaultConfig = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultConfig.configId)
        .appBarConfig
        .merge(_defaultConfig);

    useWidgetsBinding().addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(_defaultConfig.systemUiOverlayStyle);
    });
    return super.build(context);
  }

  PreferredSizeWidget? _buildBarBottom(WaveAppBarConfig defaultConfig) {
    if (brightness == null || brightness == Brightness.light) {
      if (bottom == null && defaultConfig.showDefaultBottom) {
        return WaveBarBottomDivider();
      }
    }
    return bottom;
  }

  @override
  Widget get child {
    WaveAppBarConfig _defaultConfig = themeData ?? WaveAppBarConfig();
    //当外部传入主题
    if (brightness == Brightness.light) {
      _defaultConfig = _defaultConfig.merge(WaveAppBarConfig.light());
    } else if (brightness == Brightness.dark) {
      _defaultConfig = _defaultConfig.merge(WaveAppBarConfig.dark());
    }
    _defaultConfig = _defaultConfig
        .merge(WaveAppBarConfig(backgroundColor: backgroundColor));

    _defaultConfig = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultConfig.configId)
        .appBarConfig
        .merge(_defaultConfig);

    Widget? flexibleSpace;
    if (this.flexibleSpace != null) {
      flexibleSpace = Container(
        height: _defaultConfig.appBarHeight +
            MediaQueryData.fromWindow(window).padding.top,
        child: this.flexibleSpace,
      );
    }
    return AppBar(
      key: key,
      leading: _wrapLeading(_defaultConfig),
      leadingWidth: leadingWidth ?? _culLeadingSize(_defaultConfig),
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: _buildAppBarTitle(_defaultConfig),
      centerTitle: true,
      elevation: elevation,
      backgroundColor: _defaultConfig.backgroundColor,
      actions: _wrapActions(_defaultConfig),
      bottom: _buildBarBottom(_defaultConfig),
      brightness: brightness ?? Brightness.light,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      flexibleSpace: flexibleSpace,
      shadowColor: shadowColor,
      shape: shape,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      textTheme: textTheme,
      primary: primary,
      excludeHeaderSemantics: excludeHeaderSemantics,
    );
  }

  //根据输入的leading 设置默认的leadingWidth
  double _culLeadingSize(WaveAppBarConfig themeData) {
    if (leadingWidth != null) {
      return leadingWidth!;
    }
    if (leading is WaveDoubleLeading) {
      return themeData.leftAndRightPadding +
          themeData.itemSpacing +
          themeData.iconSize * 2;
    }

    if (leading == null && !automaticallyImplyLeading) {
      return 0;
    }
    return themeData.leftAndRightPadding + themeData.iconSize;
  }

  //Wrap [actions]: a single Widget will add a right margin
  //List<Widget> is adding the right margin and adding the spacing in the action
  List<Widget>? _wrapActions(WaveAppBarConfig themeData) {
    if (actions == null || !(actions is List<Widget> || actions is Widget)) {
      return null;
    }
    List<Widget> actionList = <Widget>[];

    if (actions is List<Widget>) {
      if (actions.isEmpty) {
        return actionList;
      }
      List<Widget> tmp = (actions as List<Widget>).map((_) {
        return (_ is WaveTextAction) ? _warpRealAction(_) : _;
      }).toList();

      for (int i = 0, n = tmp.length; i < n; i++) {
        actionList.add(tmp[i]);
        if (i != n - 1) actionList.add(SizedBox(width: themeData.itemSpacing));
      }
    } else {
      Widget realAction =
          (actions is WaveTextAction) ? _warpRealAction(actions) : actions;
      actionList.add(realAction);
    }
    return actionList..add(SizedBox(width: themeData.leftAndRightPadding));
  }

  WaveTextAction _warpRealAction(WaveTextAction textAction) {
    return WaveTextAction(
      textAction.text,
      iconPressed: textAction.iconPressed,
      themeData: themeData,
      key: textAction.key,
    );
  }

  //For details, please refer to the layout method of _ToolbarLayout
  Widget? _buildAppBarTitle(
    WaveAppBarConfig themeData,
  ) {
    Widget? realTitle;
    if (title is Widget) {
      return title;
    }
    if (title is String) {
      realTitle = WaveAppBarTitle(
        title,
        themeData: themeData,
      );
    }

    return realTitle;
  }

  //If leading is WaveBackLeading, the left margin needs to be added
  Widget? _wrapLeading(WaveAppBarConfig barConfig) {
    Widget? realLeading = leading;
    if (leading == null && automaticallyImplyLeading) {
      realLeading = WaveBackLeading(
        iconPressed: backLeadCallback,
        themeData: barConfig,
      );
    }
    if (realLeading is WaveBackLeading) {
      return Container(
        padding: EdgeInsets.only(left: barConfig.leftAndRightPadding),
        child: realLeading,
      );
    }
    return realLeading;
  }
}

///[WaveAppBar]中leading的默认实现
///宽度范围是40
class WaveBackLeading extends StatelessWidget {
  final Widget? child;
  final VoidCallback? iconPressed;
  final WaveAppBarConfig? themeData;

  WaveBackLeading({
    Key? key,
    this.iconPressed,
    this.child,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultThemeData = themeData ?? WaveAppBarConfig();
    _defaultThemeData = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultThemeData.configId)
        .appBarConfig
        .merge(_defaultThemeData);

    _defaultThemeData = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultThemeData.configId)
        .appBarConfig
        .merge(_defaultThemeData);

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: _defaultThemeData.iconSize +
              _defaultThemeData.leftAndRightPadding,
          height: _defaultThemeData.appBarHeight),
      child: IconButton(
        alignment: Alignment.centerRight,
        splashRadius: (_defaultThemeData.iconSize +
                _defaultThemeData.leftAndRightPadding) /
            2,
        icon: child ?? _defaultThemeData.leadIconBuilder(),
        onPressed: iconPressed ??
            () {
              ///By default, the back button and flutter's pop are processed. If it is opened by native, it may need to be processed separately, otherwise a white screen will appear
              ///backLeadCallback is the default processing callback
              ///DefaultLeadingCallBack can also set unified return processing by changing the method parameter, which is static
              Navigator.maybePop(context);
            },
        padding: EdgeInsets.zero,
      ),
    );
  }
}

///Leading implementation that supports adding two elements in [WaveAppBar.leading]
///The width range is 80
class WaveDoubleLeading extends StatelessWidget {
  final Widget first;
  final Widget second;
  final WaveAppBarConfig? themeData;

  WaveDoubleLeading(
      {Key? key, required this.first, required this.second, this.themeData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultThemeData = themeData ?? WaveAppBarConfig();
    _defaultThemeData = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultThemeData.configId)
        .appBarConfig
        .merge(_defaultThemeData);
    return Container(
      constraints: BoxConstraints.tightFor(
          height: _defaultThemeData.appBarHeight,
          width: _defaultThemeData.leftAndRightPadding +
              _defaultThemeData.itemSpacing +
              _defaultThemeData.iconSize * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[first, second],
      ),
    );
  }
}

///Default implementation of [WaveAppBar.title]
///The number of title texts is limited to 8 and displayed in a single line
class WaveAppBarTitle extends StatelessWidget {
  final String title;
  final WaveAppBarConfig? themeData;
  WaveAppBarTitle(this.title, {Key? key, this.themeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultThemeData = themeData ?? WaveAppBarConfig();
    _defaultThemeData = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultThemeData.configId)
        .appBarConfig
        .merge(this.themeData);

    return ConstrainedBox(
      child: Text(
        title,
        style: _defaultThemeData.titleStyle.generateTextStyle(),
        overflow: TextOverflow.ellipsis,
      ),
      constraints: BoxConstraints.loose(Size.fromWidth(
          (_defaultThemeData.titleStyle.generateTextStyle().fontSize ?? 18) *
              (_defaultThemeData.titleMaxLength + 1))),
    );
  }
}

///Wrapper Widget used when adding an action with an icon to [WaveAppBar.actions]
///This Widget implements size constraints and click implementations. This type of package must be used when adding an action with icon type
class WaveIconAction extends StatelessWidget {
  final Widget child;
  final VoidCallback iconPressed;
  final double? size;
  final WaveAppBarConfig? themeData;

  WaveIconAction({
    Key? key,
    required this.iconPressed,
    required this.child,
    this.size,
    this.themeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultThemeData = themeData ?? WaveAppBarConfig();
    _defaultThemeData = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultThemeData.configId)
        .appBarConfig
        .merge(_defaultThemeData)
        .merge(WaveAppBarConfig(iconSize: this.size));
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: _defaultThemeData.iconSize,
          height: _defaultThemeData.iconSize),
      child: IconButton(
        icon: child,
        onPressed: iconPressed,
        padding: EdgeInsets.zero,
      ),
    );
  }
}

///Wrapper Widget used when adding text action to [WaveAppBar.actions]
///This Widget implements size constraints and click implementations. This kind of package must be used when adding text actions
class WaveTextAction extends StatelessWidget {
  final String text;
  final VoidCallback? iconPressed;
  final WaveAppBarConfig? themeData;

  WaveTextAction(this.text, {Key? key, this.iconPressed, this.themeData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultThemeData = themeData ?? WaveAppBarConfig();
    _defaultThemeData = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultThemeData.configId)
        .appBarConfig
        .merge(_defaultThemeData);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: _defaultThemeData.appBarHeight,
        alignment: Alignment.center,
        child: Text(text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: _defaultThemeData.actionsStyle.generateTextStyle()),
      ),
      onTap: iconPressed,
    );
  }
}

///The dividing line at the bottom of the AppBar, just pass the instance into the [WaveAppBar.bottom] property
class WaveBarBottomDivider extends PreferredSize {
  WaveBarBottomDivider()
      : super(child: Divider(), preferredSize: const Size(0, 0));

  @override
  Size get preferredSize => Size.fromHeight(0.5);

  @override
  Widget get child => WaveLine();
}

class _WaveSearchResultAppBar extends StatelessWidget {
  final WaveAppBarConfig? appBarConfig;
  final String? title;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final Brightness? brightness;
  final bool showLeadingDivider;
  final Widget? flexibleSpace;
  final VoidCallback? backLeadCallback;
  final bool? showDefaultBottom;

  _WaveSearchResultAppBar(
      {this.appBarConfig,
      this.backgroundColor,
      this.bottom,
      this.title,
      this.brightness,
      this.showLeadingDivider = true,
      this.flexibleSpace,
      this.backLeadCallback,
      this.showDefaultBottom = true});

  @override
  Widget build(BuildContext context) {
    WaveAppBarConfig _defaultConfig = appBarConfig ?? WaveAppBarConfig();
    if (brightness == Brightness.light) {
      _defaultConfig = _defaultConfig.merge(WaveAppBarConfig.light());
    } else if (brightness == Brightness.dark) {
      _defaultConfig = _defaultConfig.merge(WaveAppBarConfig.dark());
    }

    _defaultConfig = _defaultConfig.merge(WaveAppBarConfig(
      backgroundColor: this.backgroundColor,
      showDefaultBottom: this.showDefaultBottom,
    ));

    _defaultConfig = WaveThemeConfigurator.instance
        .getConfig(configId: _defaultConfig.configId)
        .appBarConfig
        .merge(_defaultConfig);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ///leading
        WaveBackLeading(
          iconPressed: backLeadCallback,
          themeData: _defaultConfig,
        ),

        ///divider
        Visibility(
          visible: showLeadingDivider,
          child: Container(
            margin: EdgeInsets.only(left: 12, right: 12),
            height: 16,
            width: 1,
            color: _defaultConfig.commonConfig.dividerColorBase,
          ),
        ),

        ///padding
        Visibility(
          visible: !(showLeadingDivider),
          child: Padding(
            padding: EdgeInsets.only(left: 12),
          ),
        ),

        ///title
        Expanded(
          child: Text(
            title ?? '',
            style: _defaultConfig.titleStyle.generateTextStyle(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
        )
      ],
    );
  }
}
