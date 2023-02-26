---
order: 3
---

# theme customization

<blockquote><p style="color:#666666">
  <font size="2">If you want to make some customizations to the components you use, you need to know the following to help you realize your ideas quickly. </font></p></blockquote>

#### Which components support theme customization?

Theme customization supports demo with <img src="https://img.ljcdn.com/beike/zjz/waveui/img/1637748742363.png" alt="img" style="zoom: 50%;" /> label components

<img src="https://img.ljcdn.com/beike/zjz/waveui/img/1637635513070.gif" alt="img" style="zoom:50%;" />

#### What attributes are supported for customization?
The theme customization here not only supports color change, but also supports text size, spacing, rounded corners, etc. Each customizable component has a <code>themeData</code> attribute, you can view <code>themeData</code> related classes Learn about the styles each component supports customization.

#### What is the applicable scenario?

-Global style configuration

<img src="https://img.ljcdn.com/beike/zjz/waveui/img/1639051288686.gif" alt="img" style="zoom:50%;" />

-Single component style configuration

<img src="https://img.ljcdn.com/beike/zjz/waveui/img/1639051268630.gif" alt="img" style="zoom:50%;" />

If you also need similar adaptation, you can refer to the following steps to start exclusive customization~

### Theme configuration
WaveUI 默认走[WaveUI](https://mp.weixin.qq.com/s?__biz=MzIyODcxODY0OA==&mid=2247486048&idx=1&sn=0cc95bd85a54ce0f39f6247d15618ae8&chksm=e84ceb37df3b62216b34c7be041229630eca3d7c4fd3823ebf0520a9f2c99ed2cdf3e677904b&mpshare=1&scene=1&srcid=11012tvWvcYunVGfiPa8EfCT&sharer_sharetime=1635751229200&sharer_shareid=dbde8f595d5b99a8f5cfb27122964615&version=3.1.16.90294) Design style, if you want to change the theme, you can refer to the following steps:

-step1:

Create a `utils` class in the Flutter project to store global configurations such as: `config_xxx_utils.dart`

-step2:
Create a utility class `XxxConfigUtils` in the created `config_xxx_utils.dart`

-step3:

Add the style you want to customize in the class. For example, if you want to change the theme color, you can add the following code

```dart
class XxxConfigUtils {

  static WaveAllThemeConfig defaultAllConfig = WaveAllThemeConfig(
      commonConfig: defaultCommonConfig);

  ///Global configuration
  static WaveCommonConfig defaultCommonConfig = WaveCommonConfig(
    ///Brand color
    brandPrimary: const Color(0xFF3072F6),
  );
}
```

If you want to configure `Dialog` to have larger rounded corners, you can do this

```dart
class XxxConfigUtils {
static WaveAllThemeConfig defaultAllConfig = WaveAllThemeConfig(
    commonConfig: defaultCommonConfig,
    //Add dialog configuration here
    dialogConfig: defaultDialogConfig);

  static WaveCommonConfig defaultCommonConfig = WaveCommonConfig(
    brandPrimary: const Color(0xFF3072F6),
  );

  ///Dialog configuration
  static WaveDialogConfig defaultDialogConfig = WaveDialogConfig(
    radius: 12.0,
  );
}
```

-step4:

Register the configuration created earlier in `main.dart`

```dart
WaveInitializer.register(allThemeConfig: XxxConfigUtils.defaultAllConfig);
```

Of course, you can also ignore step1 ~ step3, and directly register `WaveAllThemeConfig` in `main.dart`

```dart
WaveInitializer. register(
      allThemeConfig: WaveAllThemeConfig(
          //global configuration
          commonConfig: WaveCommonConfig(brandPrimary: Color(0xFF3072F6)),
          //dialog configuration
          dialogConfig: WaveDialogConfig(radius: 12.0))
);
```

at last

If you want to configure for a single component rather than a group of components, as we mentioned above, all components that support theme customization have an optional parameter <code>themeData</code>

```dart
WaveMultiChoiceInputFormItem(
  prefixIconType: WavePrefixIconType.TYPE_REMOVE,
  isRequire: true,
  error: "Required field cannot be empty",
  title: "Natural visit protection period",
  subTitle: "Here is the subtitle",
  tipLabel: "Label",
  ...
  themeData: WaveFormItemConfig(titleTextStyle:WaveTextStyle(color: Colors.red)),
)
```