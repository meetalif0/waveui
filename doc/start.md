---
order: 2
---

# quick start

<blockquote><p style="color:#666666">
  <font size="2">
  Before starting, if you have not been exposed to Flutter, it is recommended to learn <a href="https://flutter.cn/">Flutter</a> and <a href="https://dart.cn/guides/language/language-tour">Dart</a> , and properly install and configure <a href="https://developer.android.google.cn/studio">Android Studio </a> or <a href=" https://developer.apple.com/cn/xcode/"> Xcode</a>. If you already know the official guide and have completed the development of a simple sample, then you can start the following steps~</font>
</p>
</blockquote>

#### Start from the design side
First you need to download the [UI resource file](https://waveui.ke.com/download/sketch), after the download is complete, refer to the [Sketch Design Guidelines](./sketch) to create a page and output a copy with component information Annotated draft.

#### Code side access

First of all, you need to have a Flutter project. For specific project creation steps, please refer to [Flutter Chinese Developer Website](https://flutter.cn/docs/get-started/editor?tab=androidstudio)

Then add the WaveUI dependency to the `pubspec.yaml` file in the project directory:

```yaml
dependencies:
  waveui:version
```

<p color="#666666"><font size="2"> Note: The version information here needs to be selected according to the local Flutter SDK version. For details, see <a href="https://pub.flutter-io.cn/packages/waveui/versions"> pub. dev </a> </font></p>

terminal run

```shell
flutter pub get
```

<p color="#666666"><font size="2">If an error is reported during operation, please go to <a href="https://pub.flutter-io.cn/packages/waveui/versions"> pub.dev </a> Check whether the dependent version corresponds to the local Flutter SDK version</font></p>

Code import:

```dart
import 'package:waveui/waveui.dart';
```

If you want to change the "style" or adapt to other "models" such as PAD, please refer to [Theme Customization] (./theme) operation