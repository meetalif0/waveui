---
order: 1
title: WaveUI
---

### What is WaveUI?

WaveUI is a Flutter component library based on a complete design system.

### Features

-Extracted from the interaction and visual style of enterprise-level mobile products
-High-quality Flutter components out of the box
-Provide theme customization capabilities to meet business differences

### Adapt to Flutter SDK version

| WaveUI version | Flutter SDK version |
| ----------| ----------------|
| 1.0.0 | 1.22.4 |
| 2.0.0 | 2.2.2 |

### access

Add the following dependencies to the `pubspec.yaml` file in the Flutter project:

```yaml
dependencies:
  waveui:version
```

### Code import

```dart
import 'package:waveui/waveui.dart';
```

### Theme customization
Add the following registration method in the Flutter project directory `main.dart`:

```dart
WaveInitializer.register(allThemeConfig:TestConfigUtils.defaultAllConfig);
```

See [Theme Customization](./theme) for details

### Link

-[front page](../)
-[all widgets](../widgets)
-[design concept](https://mp.weixin.qq.com/s?__biz=MzIyODcxODY0OA==&mid=2247486048&idx=1&sn=0cc95bd85a54ce0f39f6247d15618ae8&chksm=e84ceb37df3b62216b34c7be041229630eca3d7c4fd3823ebf0520a9f2c99ed2cdf3e677904b&mpshare=1&scene=1&srcid=11012tvWvcYunVGfiPa8EfCT&sharer_sharetime=1635751229200&sharer_shareid=dbde8f595d5b99a8f5cfb27122964615&version=3.1.16.90294)
-[Quick Access](./start)
-[Theme customization](./theme)
-[FAQ](./faq)
-[Sketch Design Guidelines](./sketch)

-[Design material download](https://waveui.ke.com/download/sketch)

### Who is using
Covers all business lines on the B-side of Beike, serves 10+ Apps of Beike, and the cumulative references of components exceed 10,000 times.

<blockquote><p style="color:#666666">
  <font size="2">If you are willing to access WaveUI, or your company and products use WaveUI, welcome to <a href="https://github.com/LianjiaTech/waveui/issues/2">here </a> Leave a comment. </font></p></blockquote>

### How to contribute

Please read the [Contribution Guidelines](./contribution). If you want to contribute, welcome [Pull Request](https://github.com/LianjiaTech/waveui/pulls), or give us [Report Bug](https://github.com/LianjiaTech/waveui/issues/new ).