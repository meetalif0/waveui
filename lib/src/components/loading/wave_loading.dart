import 'package:waveui/src/components/dialog/wave_safe_dialog.dart';
import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:flutter/material.dart';

///The circular loading box in the middle of the page or pop-up window, the left side is a customizable loading copy [content], such as: loading, submitting, etc.
///
///This component does not support getting the animation value at the specified moment
///
///used in the page
///Scaffold(
///appBar: WaveAppBar(
///title: 'Loading case',
///),
///body: WavePageLoading(),
///)
///
///used in the dialog
///showDialog(
///context: context,
///barrierDismissible: barrierDismissible,
///useRootNavigator: useRootNavigator,
///builder: (_) {
///return WaveLoadingDialog(content: content);
///});
///
///Other loading components:
///*[LinearProgressIndicator], linearly loading components.
///*[RefreshIndicator], refresh the component.
///*[WaveLoadingDialog], loading dialog.

class WavePageLoading extends StatelessWidget {
  final String? content;
  final BoxConstraints constraints;

  const WavePageLoading({
    Key? key,
    this.content,
    this.constraints = const BoxConstraints(
      minWidth: 130,
      maxWidth: 130,
      minHeight: 50,
      maxHeight: 50,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _loadingMaxWidth = MediaQuery.of(context).size.width * 2 / 3;
    double _iconSize = 19.0;
    double _textLeftPadding = 8.0;
    double _outPadding = 10.0;
    String loadingText =
        content ?? WaveIntl.of(context).localizedResource.loading;
    //获取实际文字长度
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
          text: loadingText,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.none)),
    )..layout(
        maxWidth: _loadingMaxWidth - _iconSize - _textLeftPadding, minWidth: 0);
    double maxWidth =
        textPainter.width + _iconSize + _textLeftPadding + _outPadding * 2;

    return Center(
      child: Container(
        padding: EdgeInsets.all(_outPadding),
        constraints: BoxConstraints(
            maxWidth: maxWidth, minWidth: _iconSize + _textLeftPadding),
        height: 50,
        width: _loadingMaxWidth,
        decoration: BoxDecoration(
            color: Color(0xff222222), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: _iconSize,
                width: _iconSize,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: _textLeftPadding),
                  child: Text(
                    loadingText,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///The loading status pop-up window constructed by [WavePageLoading], the loading animation and loading text are displayed side by side and in the middle of the screen. accessible
///Use [WaveLoadingDialog.show] and [WaveLoadingDialog.dismiss] to control the display and close of the pop-up window. Will not automatically close.
class WaveLoadingDialog extends Dialog {
  ///tag is used to mark the type in WaveSafeDialog
  static const String _loadingDialogTag = '_loadingDialogTag';

  ///Prompt text when loading, the default is `Loading...`
  final String? content;

  const WaveLoadingDialog({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WavePageLoading(
        content: content ?? WaveIntl.of(context).localizedResource.loading);
  }

  ///Displays the static method for loading popups.
  ///
  ///*[context] context
  ///*[content] Prompt copy when loading
  ///*[barrierDismissible] Whether to close the pop-up window by clicking on the mask background, the default is true, it can be closed, see [barrierDismissible] in [showDialog] for details
  ///*[useRootNavigator] Add the popup window to the rootNavigator in [context] or the nearest [Navigator], the default is true, add to
  ///rootNavigator, see [useRootNavigator] in [showDialog] for details.
  static Future<T?> show<T>(
    BuildContext context, {
    String? content,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
  }) {
    return WaveSafeDialog.show<T>(
        context: context,
        tag: _loadingDialogTag,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        builder: (_) {
          return WaveLoadingDialog(
              content:
                  content ?? WaveIntl.of(context).localizedResource.loading);
        });
  }

  ///关闭弹窗。
  ///
  /// *[context] 上下文。
  static void dismiss<T extends Object?>(BuildContext context, [T? result]) {
    WaveSafeDialog.dismiss<T>(
        context: context, tag: _loadingDialogTag, result: result);
  }
}
