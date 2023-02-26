import 'dart:math';

import 'package:flutter/material.dart';

///Location enumeration
enum WaveToastGravity {
  ///Bottom display
  bottom,

  ///Center display
  center,

  ///top display
  top,
}

///toast display duration
class WaveDuration {
  WaveDuration._();

  ///toast displays a shorter time (1s)
  static const Duration short = Duration(seconds: 1);

  ///toast display for a long time (3s)
  static const Duration long = Duration(seconds: 3);
}

///Generic Toast component
class WaveToast {
  ///The default distance between Toast and the top
  static const int _defaultTopOffset = 50;

  ///The default distance between Toast and the bottom
  static const int _defaultBottomOffset = 50;

  ///_ToastView
  static _ToastView? preToastView;

  ///Displayed in the middle. If the duration is not set, it will be automatically calculated according to the length of the content (more friendly, up to 5 seconds)
  static void showInCenter(
      {required String text,
      required BuildContext context,
      Duration? duration}) {
    show(
      text,
      context,
      duration: duration,
      gravity: WaveToastGravity.center,
    );
  }

  ///Display Toast, if the duration is not set, it will be automatically calculated according to the length of the content (more friendly, up to 5 seconds)
  static void show(
    String text,
    BuildContext context, {
    Duration? duration,
    Color? background,
    TextStyle textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    double? radius,
    Image? preIcon,
    double? verticalOffset,
    VoidCallback? onDismiss,
    WaveToastGravity? gravity,
  }) {
    final OverlayState? overlayState = Overlay.of(context);
    if (overlayState == null) return;

    preToastView?._dismiss();
    preToastView = null;

    final double finalVerticalOffset = getVerticalOffset(
      context: context,
      gravity: gravity,
      verticalOffset: verticalOffset,
    );

    ///Automatically determine the display duration according to the length of the content, which is more user-friendly
    final int autoDuration = min(text.length * 0.06 + 0.8, 5.0).ceil();
    final Duration finalDuration = duration ?? Duration(seconds: autoDuration);
    final OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) {
        return _ToastWidget(
          widget: ToastChild(
            background: background,
            radius: radius,
            msg: text,
            leading: preIcon,
            textStyle: textStyle,
            gravity: gravity,
            verticalOffset: finalVerticalOffset,
          ),
        );
      },
    );
    final _ToastView toastView =
        _ToastView(overlayState: overlayState, overlayEntry: overlayEntry);
    preToastView = toastView;
    toastView._show(
      duration: finalDuration,
      onDismiss: onDismiss,
    );
  }

  ///Get the default vertical spacing
  static double getVerticalOffset({
    required BuildContext context,
    WaveToastGravity? gravity,
    double? verticalOffset,
  }) {
    final double _verticalOffset = verticalOffset ?? 0;
    final double defaultOffset;
    switch (gravity) {
      case WaveToastGravity.bottom:
        final offset = verticalOffset ?? _defaultBottomOffset;
        defaultOffset = MediaQuery.of(context).viewInsets.bottom + offset;
        break;
      case WaveToastGravity.top:
        final offset = verticalOffset ?? _defaultTopOffset;
        defaultOffset = MediaQuery.of(context).viewInsets.top + offset;
        break;
      case WaveToastGravity.center:
      default:
        defaultOffset = verticalOffset ?? 0;
    }

    return defaultOffset + _verticalOffset;
  }
}

class _ToastView {
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  bool _isVisible = false;

  _ToastView({
    required this.overlayState,
    required this.overlayEntry,
  });
  void _show({required Duration duration, VoidCallback? onDismiss}) async {
    _isVisible = true;
    overlayState.insert(overlayEntry);
    Future.delayed(duration, () {
      _dismiss();
      onDismiss?.call();
    });
  }

  void _dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    overlayEntry.remove();
  }
}

class ToastChild extends StatelessWidget {
  const ToastChild({
    Key? key,
    required this.msg,
    required this.verticalOffset,
    this.background,
    this.radius,
    this.leading,
    this.gravity,
    this.textStyle,
  }) : super(key: key);

  Alignment get alignment {
    switch (gravity) {
      case WaveToastGravity.bottom:
        return Alignment.bottomCenter;
      case WaveToastGravity.top:
        return Alignment.topCenter;
      case WaveToastGravity.center:
      default:
        return Alignment.center;
    }
  }

  EdgeInsets get padding {
    switch (gravity) {
      case WaveToastGravity.bottom:
        return EdgeInsets.only(bottom: verticalOffset);
      case WaveToastGravity.top:
        return EdgeInsets.only(top: verticalOffset);
      case WaveToastGravity.center:
      default:
        return EdgeInsets.only(top: verticalOffset);
    }
  }

  final String msg;
  final double verticalOffset;
  final Color? background;
  final double? radius;
  final Image? leading;
  final WaveToastGravity? gravity;
  final TextStyle? textStyle;

  InlineSpan get leadingSpan {
    if (leading == null) {
      return const TextSpan(text: "");
    }
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Padding(padding: const EdgeInsets.only(right: 6), child: leading!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: padding,
        alignment: alignment,
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            color: background ?? const Color(0xFF222222),
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
          child: RichText(
            text: TextSpan(children: <InlineSpan>[
              leadingSpan,
              TextSpan(text: msg, style: textStyle),
            ]),
          ),
        ),
      ),
    );
  }
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  ///Use IgnorePointer to facilitate transparent transmission of gestures
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Material(color: Colors.transparent, child: widget),
    );
  }
}
