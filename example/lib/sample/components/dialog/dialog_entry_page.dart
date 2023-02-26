import 'package:waveui/waveui.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogEntryPage extends StatelessWidget {
  final String _title;

  DialogEntryPage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(
          title: _title,
        ),
        body: ListView(
          children: <Widget>[
            ListItem(
              title: "Rich Text Popup",
              isShowLine: false,
              isSupportTheme: true,
              describe: 'Rich text popup',
              onPressed: () {
                _showRichTextDialog(context);
              },
            ),
            ListItem(
              title: "No Title + No Button",
              isSupportTheme: true,
              describe: 'No title, no button',
              onPressed: () {
                _showStyle0Dialog(context);
              },
            ),
            ListItem(
              title: "Untitled + single button",
              isSupportTheme: true,
              describe: 'No title, auxiliary information, single button',
              onPressed: () {
                _showStyle1Dialog(context);
              },
            ),
            ListItem(
              title: "Untitled + single button, single line content",
              isSupportTheme: true,
              describe: 'No title, auxiliary information, single button',
              onPressed: () {
                _showStyle1Dialog0(context);
              },
            ),
            ListItem(
              title: "title+information+double button",
              isSupportTheme: true,
              describe:
                  'There are titles, double bottom buttons, and auxiliary information as copywriting',
              onPressed: () {
                _showStyle4Dialog(context);
              },
            ),
            ListItem(
              title: "title+information+single button",
              isSupportTheme: true,
              describe: 'Title, single button, auxiliary copywriting',
              onPressed: () {
                _showStyle2Dialog(context);
              },
            ),
            ListItem(
              title: "title+information+single button",
              describe:
                  'There are titles, single buttons, and [multi-line] auxiliary copywriting',
              onPressed: () {
                _showStyle2_1Dialog(context);
              },
            ),
            ListItem(
              title: "Title+Information+Warning",
              isSupportTheme: true,
              describe: 'Title, single button, auxiliary copywriting',
              onPressed: () {
                _showStyle9Dialog(context);
              },
            ),
            ListItem(
              title: "Title + Information + Custom Alert UI",
              isSupportTheme: true,
              describe: 'Title, single button, auxiliary copywriting',
              onPressed: () {
                _showStyle9_1Dialog(context);
              },
            ),
            ListItem(
              title: "Title+Button",
              isSupportTheme: true,
              describe: 'Double buttons, wrap title',
              onPressed: () {
                _showStyle8Dialog(context);
              },
            ),
            ListItem(
              title: "Icon+title+information+double button",
              isSupportTheme: true,
              describe:
                  'Double buttons, with header Icon, auxiliary information',
              onPressed: () {
                _showStyle71Dialog(context);
              },
            ),
            ListItem(
              title: "Icon+Title+Single Button",
              isSupportTheme: true,
              describe: 'Single button, with a head Icon',
              onPressed: () {
                _showStyle7Dialog(context);
              },
            ),
            ListItem(
              title: "Multiple buttons + title + information",
              isSupportTheme: true,
              describe:
                  'There are titles, multi-buttons, and auxiliary information as copywriting',
              onPressed: () {
                _showStyle6Dialog(context);
              },
            ),
            ListItem(
              title: "Multi-button + title",
              isSupportTheme: true,
              describe: 'title, multi-button',
              onPressed: () {
                _showStyle5_1Dialog(context);
              },
            ),
            ListItem(
              title: "Multiple buttons + information",
              isSupportTheme: true,
              describe: 'Untitled, multi-button, auxiliary information is copy',
              onPressed: () {
                _showStyle5Dialog(context);
              },
            ),
            ListItem(
              title: "title+information+input+button",
              isSupportTheme: true,
              describe: 'There is an input box in the middle',
              onPressed: () {
                _showMiddleInputDialog(context);
              },
            ),
            ListItem(
              title: "title+input+button",
              isSupportTheme: true,
              describe: 'There is an input box in the middle',
              onPressed: () {
                _showMiddleInputDialog2(context);
              },
            ),
            ListItem(
              title: "title+input+button",
              isSupportTheme: true,
              describe:
                  'There is an input box in the middle, set the maximum height',
              onPressed: () {
                _showMiddleInputDialog3(context);
              },
            ),
            ListItem(
              title: "title+radio option+button",
              isSupportTheme: true,
              describe: 'Middle radio box (SingleSelectDialogWidget)',
              onPressed: () {
                _showMiddleSingleSelectPicker(context);
              },
            ),
            ListItem(
              title: "Title+Multi-choice option+Button",
              isSupportTheme: true,
              describe: 'MultiSelectDialog in the middle (MultiSelectDialog)',
              onPressed: () {
                _showMiddleMultiSelectDialog(context);
              },
            ),
            ListItem(
              title: "Title + Prompt Text + Multiple Choice Options + Button",
              isSupportTheme: true,
              describe: 'MultiSelectDialog in the middle (MultiSelectDialog)',
              onPressed: () {
                _showMiddleMultiSelectWithMessageDialog(context);
              },
            ),
            ListItem(
              title:
                  "Title+Prompt Information Widget+Multi-choice option+Button",
              isSupportTheme: true,
              describe: 'MultiSelectDialog in the middle (MultiSelectDialog)',
              onPressed: () {
                _showMiddleMultiSelectWithMessageWidgetDialog(context);
              },
            ),
            ListItem(
              title: "Loading Dialog",
              describe: 'LoadingDialog Example',
              onPressed: () {
                _showWaveLoadingDialog(context);
              },
            ),
            ListItem(
              title: "Safe Dialog",
              describe:
                  'You can safely pop the Dialog to prevent the page from being closed by mistake',
              onPressed: () {
                _showSafeDialog(context);
              },
            ),
            ListItem(
              title: "Share Dialog",
              isSupportTheme: true,
              describe: 'Share Dialog (five icons)',
              onPressed: () {
                _showWaveShareDialog5(context);
              },
            ),
            ListItem(
              title: "Share Dialog",
              isSupportTheme: true,
              describe: 'Share Dialog (3 icons)',
              onPressed: () {
                _showWaveShareDialog3(context);
              },
            ),
            ListItem(
              title: "Two Vertical Button Dialog (single button)",
              isSupportTheme: true,
              describe: 'Primary and secondary buttons Dialog',
              onPressed: () {
                _showWaveOneVerticalButtonDialogDialog(context);
              },
            ),
            ListItem(
              title: "Two Vertical Button Dialog",
              describe: 'Primary and secondary buttons Dialog',
              isSupportTheme: true,
              onPressed: () {
                _showWaveTwoVerticalButtonDialogDialog(context);
              },
            ),
            ListItem(
              title: "Plain text bullet box",
              isSupportTheme: true,
              describe: 'title+plain text content+button',
              onPressed: () {
                _showStyle81Dialog(context);
              },
            ),
            ListItem(
              title: "Plain text box contains rich text",
              isSupportTheme: true,
              describe: 'Title + plain text content with rich text + button',
              onPressed: () {
                _showStyle82Dialog(context);
              },
            ),
            ListItem(
              title: "Plain text pop-up box has no title",
              isSupportTheme: true,
              describe: 'plain content + button',
              onPressed: () {
                _showStyle83Dialog(context);
              },
            ),
            ListItem(
              title: "Plain text box without action button",
              isSupportTheme: true,
              describe: 'Title + pure text content',
              onPressed: () {
                _showStyle84Dialog(context);
              },
            ),
          ],
        ));
  }

  void _showMiddleSingleSelectPicker(BuildContext context) {
    String hintText = "Interested to follow up";
    int selectedIndex = 0;
    var conditions = [
      "Interested to follow up",
      "Interested but not interested in this business district",
      "not connected",
      "connected",
      "Number error",
      "dasdasda",
      "asdasfdg",
      "dadsadvq",
      "vzxczxc"
    ];
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(
              builder: (context, state) {
                return WaveSingleSelectDialog(
                    isClose: true,
                    title:
                        'Please select the reason for invalid customer source',
                    messageText:
                        'Please rate this thread Please rate this thread Please rate this thread Please rate this thread Please rate this thread',
                    conditions: conditions,
                    checkedItem: conditions[selectedIndex],
                    submitText: 'Submit',
                    isCustomFollowScroll: true,
                    customWidget: TextField(
                      //cursor color
                      maxLines: 2,
                      cursorColor: Color(0xFF0984F9),
                      //Cursor rounded radian
                      cursorRadius: Radius.circular(2.0),
                      style: TextStyle(fontSize: 14, color: Color(0xFF222222)),
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.0),
                        hintText: hintText,
                        hintStyle:
                            TextStyle(fontSize: 14, color: Color(0xFFCCCCCC)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Color(0xFFCCCCCC),
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                            borderSide: BorderSide(
                              width: 0.5,
                              color: Color(0xFFCCCCCC),
                            )),
                      ),
                    ),
                    onItemClick: (BuildContext context, int index) {
                      hintText = conditions[index];
                      selectedIndex = index;
                      state(() {});
                    },
                    onSubmitClick: (data) {
                      WaveToast.show(data!, context);
                    });
              },
            ));
  }

  ///Multiple selection popup
  void _showMiddleMultiSelectDialog(BuildContext context) {
    List<MultiSelectItem> data = [];
    data.add(new MultiSelectItem("100", "interested to follow up"));
    data.add(new MultiSelectItem(
        "101", "interested but not interested in this business district",
        isChecked: true));
    data.add(new MultiSelectItem(
        "102", "Hang up/not interested after connected",
        isChecked: true));
    data.add(new MultiSelectItem("103", "not connected"));
    data.add(new MultiSelectItem("104", "Complaint threat"));
    data.add(new MultiSelectItem("104", "Number error"));
    data.add(new MultiSelectItem("104", "Number error"));
    data.add(new MultiSelectItem("104", "Number error"));
    showDialog(
        context: context,
        builder: (_) => WaveMultiSelectDialog(
            title: "Please rate this thread",
            isClose: true,
            conditions: data,
            onSubmitClick: (List<MultiSelectItem> data) {
              var str = "";
              data.forEach((item) {
                str = str + item.content + " ";
              });
              WaveToast.show(str, context);
              return true;
            }));
  }

  void _showMiddleMultiSelectWithMessageWidgetDialog(BuildContext context) {
    String hintText = "Interested to follow up";
    List<MultiSelectItem> data = [];
    data.add(new MultiSelectItem("100", "interested to follow up"));
    data.add(new MultiSelectItem(
        "101", "interested but not interested in this business district",
        isChecked: true));
    data.add(new MultiSelectItem(
        "102", "Hang up/not interested after connected",
        isChecked: true));
    data.add(new MultiSelectItem(
        "102", "Hang up/not interested after connected",
        isChecked: true));
    data.add(new MultiSelectItem("103", "not connected"));
    data.add(new MultiSelectItem("103", "not connected"));
    data.add(new MultiSelectItem("104", "Others"));
    showDialog(
        context: context,
        builder: (_) => StatefulBuilder(builder: (context, state) {
              return WaveMultiSelectDialog(
                  title: "Please rate this clue Widget",
                  messageWidget: Row(
                    children: <Widget>[
                      Text(
                        "Choose the reason for giving up (multiple choice)",
                        style: cContentTextStyle,
                      ),
                    ],
                  ),
                  isClose: true,
                  conditions: data,
                  isCustomFollowScroll: false,
                  customWidget: TextField(
                    //cursor color
                    maxLines: 2,
                    cursorColor: Color(0xFF0984F9),
                    //Cursor rounded radian
                    cursorRadius: Radius.circular(2.0),
                    style: TextStyle(fontSize: 14, color: Color(0xFF222222)),
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8.0),
                      hintText: hintText,
                      hintStyle:
                          TextStyle(fontSize: 14, color: Color(0xFFCCCCCC)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color(0xFFCCCCCC),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2.0),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color(0xFFCCCCCC),
                          )),
                    ),
                  ),
                  onItemClick: (BuildContext context, int index) {
                    hintText = data[index].content;
                    state(() {});
                  },
                  onSubmitClick: (List<MultiSelectItem> data) {
                    var str = "";
                    data.forEach((item) {
                      str = str + item.content + "  ";
                    });
                    WaveToast.show(str, context);
                    return true;
                  });
            }));
  }

  ///Multiple selection popup
  void _showMiddleMultiSelectWithMessageDialog(BuildContext context) {
    List<MultiSelectItem> data = [];
    data.add(new MultiSelectItem("100", "interested to follow up"));
    data.add(new MultiSelectItem(
        "101", "interested but not interested in this business district",
        isChecked: true));
    data.add(new MultiSelectItem(
        "102", "Hang up/not interested after connected",
        isChecked: true));
    data.add(new MultiSelectItem("103", "not connected"));
    data.add(new MultiSelectItem("104", "Complaint threat"));
    data.add(new MultiSelectItem("104", "Number error"));
    data.add(new MultiSelectItem("104", "Number error"));
    data.add(new MultiSelectItem("104", "Number error"));
    showDialog(
        context: context,
        builder: (_) => WaveMultiSelectDialog(
            title: "Please rate this thread",
            messageText:
                'Please rate this thread Please rate this thread Please rate this thread Please rate this thread Please rate this thread',
            isClose: true,
            conditions: data,
            onSubmitClick: (List<MultiSelectItem> data) {
              var str = "";
              data.forEach((item) {
                str = str + item.content + " ";
              });
              WaveToast.show(str, context);
              return true;
            }));
  }

  ///Universal bullet box
  void _showRichTextDialog(BuildContext context) {
    WaveDialogManager.showConfirmDialog(context,
        cancel: "Cancel",
        confirm: "OK",
        title: "Title",
        message:
            "Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information",
        messageWidget: Padding(
          padding: const EdgeInsets.only(top: 6, left: 24, right: 24),
          child: WaveCSS2Text.toTextView(
              "This is an example that uses tags to modify the text color\<font color = '#8ac6d1'\>I am a colored text</font>,"
              "This is the text behind the color label",
              linksCallback: (String? text, String? linkUrl) {
            WaveToast.show('$text clicked! Url is $linkUrl', context);
          }),
        ),
        showIcon: true, onConfirm: () {
      WaveToast.show("OK", context);
    }, onCancel: () {
      Navigator.pop(context);
    });
  }

  ///There is an input box in the middle
  void _showMiddleInputDialog(BuildContext context) {
    WaveMiddleInputDialog(
        title:
            'Refuse reason dismissOnActionsTap Click Action does not disappear',
        message:
            "Only numbers can be entered. Secondary content Secondary content Secondary content Secondary content Secondary content Secondary content Secondary content Secondary content Secondary content Secondary content ",
        hintText: 'hint information',
        cancelText: 'Cancel',
        confirmText: 'OK',
        autoFocus: true,
        maxLength: 1000,
        maxLines: 2,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.done,
        dismissOnActionsTap: false,
        barrierDismissible: true,
        onConfirm: (value) {
          WaveToast.show(value, context);
        },
        onCancel: () {
          WaveToast.show("Cancel", context);
          Navigator.pop(context);
        }).show(context);
  }

  ///There is an input box in the middle
  void _showMiddleInputDialog2(BuildContext context) {
    WaveMiddleInputDialog(
        title: 'Reason for rejection',
        hintText: 'hint information',
        cancelText: 'Cancel',
        confirmText: 'OK',
        maxLength: 1000,
        maxLines: 2,
        barrierDismissible: false,
        inputEditingController: TextEditingController()..text = 'bbb',
        textInputAction: TextInputAction.done,
        onConfirm: (value) {
          WaveToast.show(value, context);
        },
        onCancel: () {
          WaveToast.show("取消", context);
          Navigator.pop(context);
        }).show(context);
  }

  ///中间有输入框弹框
  void _showMiddleInputDialog3(BuildContext context) {
    WaveMiddleInputDialog(
        title: 'Reason for refusal -test limit input up to 10 characters',
        hintText: 'hint information',
        cancelText: 'Cancel',
        confirmText: 'OK',
        maxLength: 10,
        barrierDismissible: false,
        textInputAction: TextInputAction.done,
        onConfirm: (value) {
          WaveToast.show(value, context);
        },
        onCancel: () {
          WaveToast.show("Cancel", context);
          Navigator.pop(context);
        }).show(context);
  }

  ///Dialog box style 1: no title, single button
  void _showStyle1Dialog0(BuildContext context) {
    WaveDialogManager.showSingleButtonDialog(context,
        label: "Got it", message: "Auxiliary content information", onTap: () {
      WaveToast.show('Got it', context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style 1: no title, single button
  void _showStyle0Dialog(BuildContext context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext dialogContext) {
        return WaveDialog(
          messageText:
              "Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information",
          actionsText: [],
        );
      },
    );
  }

  ///Dialog box style 1: no title, single button
  void _showStyle1Dialog(BuildContext context) {
    WaveDialogManager.showSingleButtonDialog(context,
        label: "Got it",
        message:
            "Supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information",
        onTap: () {
      WaveToast.show('Got it', context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style 2: with title, single button, and auxiliary copy
  void _showStyle2Dialog(BuildContext context) {
    WaveDialogManager.showSingleButtonDialog(context,
        title: "Title Content",
        label: "Got it",
        message:
            "Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information",
        onTap: () {
      WaveToast.show('Got it', context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style 2: There are titles, single buttons, and too many auxiliary texts, slide up and down to display
  void _showStyle2_1Dialog(BuildContext context) {
    WaveDialogManager.showSingleButtonDialog(context,
        title: "Title Content",
        label: "Got it",
        messageWidget: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 300),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 8, left: 24, right: 24),
                child: Center(
                  child: Text(
                    'Auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information Content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information Content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information supplement content information Content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information supplementary content information Content Information Assistance Content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Supplementary content information Information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information AAA',
                    style: cContentTextStyle,
                    textAlign: cContentTextAlign,
                  ),
                ),
              ),
            )), onTap: () {
      WaveToast.show('Got it', context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style 4: There are titles, two buttons at the bottom, and auxiliary information is copywriting
  void _showStyle4Dialog(BuildContext context) {
    WaveDialogManager.showConfirmDialog(context,
        title: "Are you sure to follow me?",
        cancel: 'Cancel',
        confirm: 'OK',
        message:
            "Auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information",
        onConfirm: () {
      WaveToast.show("OK", context);
    }, onCancel: () {
      WaveToast.show("Cancel", context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style five: Multi-button auxiliary information is copywriting Untitled
  void _showStyle5_1Dialog(BuildContext context) {
    WaveDialogManager.showMoreButtonDialog(context,
        actions: [
          'Option one',
          'Option two',
          'Option three',
        ],
        title:
            "title title title title title title title title title title title title title title title title title title title title title",
        indexedActionClickCallback: (index) {
      WaveToast.show("$index", context);
    });
  }

  ///Dialog box style five: Multi-button auxiliary information is copywriting Untitled
  void _showStyle5Dialog(BuildContext context) {
    WaveDialogManager.showMoreButtonDialog(context,
        actions: [
          'Option one',
          'Option two',
          'Option three',
        ],
        message:
            "Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information",
        indexedActionClickCallback: (index) {
      WaveToast.show("$index", context);
    });
  }

  ///Dialog box style six: multiple buttons with titles and auxiliary information as copywriting
  void _showStyle6Dialog(BuildContext context) {
    WaveDialogManager.showMoreButtonDialog(context,
        title: "Are you sure to follow me?",
        actions: [
          'Option one',
          'Option two',
          'Option three',
        ],
        message:
            "Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information",
        indexedActionClickCallback: (index) {
      WaveToast.show("$index", context);
    });
  }

  ///Dialog box style 7.1: single button with header icon, auxiliary information as copy
  void _showStyle71Dialog(BuildContext context) {
    WaveDialogManager.showConfirmDialog(context,
        showIcon: true,
        iconWidget: WaveUITools.getAssetImage("icons/icon_warning.png"),
        title: "This is a custom icon display",
        confirm: "OK",
        cancel: "Cancel",
        message:
            "Auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information",
        onConfirm: () {
      WaveToast.show("OK", context);
    }, onCancel: () {
      WaveToast.show("Cancel", context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style seven: single button with header icon, auxiliary information as copy
  void _showStyle7Dialog(BuildContext context) {
    WaveDialogManager.showSingleButtonDialog(context,
        showIcon: true,
        title: "Congratulations, you have completed the filling",
        label: "OK", onTap: () {
      WaveToast.show("OK", context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style eight: two buttons, wrap title
  void _showStyle8Dialog(BuildContext context) {
    WaveDialogManager.showConfirmDialog(context,
        title:
            "title content, title content, title content title content, title content title content, title content",
        cancel: 'Cancel',
        confirm: 'OK', onConfirm: () {
      WaveToast.show("OK", context);
    }, onCancel: () {
      WaveToast.show("Cancel", context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style nine: Standard dialog box: with title, double buttons, warning text and auxiliary information
  void _showStyle9Dialog(BuildContext context) {
    WaveDialogManager.showConfirmDialog(context,
        title: "Title content?",
        cancel: 'Cancel',
        confirm: 'OK',
        warning: 'Warning text',
        message:
            "Auxiliary content information auxiliary content information auxiliary content information auxiliary content information auxiliary content information",
        onConfirm: () {
      WaveToast.show("OK", context);
    }, onCancel: () {
      WaveToast.show("Cancel", context);
      Navigator.pop(context);
    });
  }

  ///Dialog box style nine: Standard dialog box: with title, double buttons, warning text and auxiliary information
  void _showStyle9_1Dialog(BuildContext context) {
    bool? status = false;
    WaveDialogManager.showConfirmDialog(context,
        title: "Title content?",
        cancel: 'Cancel',
        confirm: 'OK',
        warningWidget: StatefulBuilder(builder: (context, setState) {
          return Row(children: <Widget>[
            Checkbox(
              value: status,
              onChanged: (bool? aaa) {
                status = aaa;
                setState(() {});
              },
            ),
            Expanded(
                child: Text(
                    'This is a test protocol, la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la la'))
          ]);
        }),
        message:
            "Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information Auxiliary content information",
        onConfirm: () {
          WaveToast.show("OK", context);
        },
        onCancel: () {
          WaveToast.show("Cancel", context);
          Navigator.pop(context);
        });
  }

  ///There is an input box at the bottom
  void _showWaveLoadingDialog(BuildContext context) {
    WaveLoadingDialog.show(context).then((value) {
      WaveToast.show('result: $value', context);
    });
    Future.delayed(Duration(seconds: 5)).then((_) {
      WaveLoadingDialog.dismiss(context, 'dismiss timed cancellation');
    });
  }

  ///Safely closed pop-up box
  void _showSafeDialog(BuildContext context) {
    WaveSafeDialog.show(
        context: context,
        tag: "AA",
        builder: (context) {
          return WavePageLoading(
            content: 'Safe AA',
          );
        }).then((result) {
      WaveToast.show('result: $result ', context);
    });

    WaveSafeDialog.show(
        context: context,
        builder: (context) {
          return WavePageLoading(
            content: 'Safe BB',
          );
        }).then((result) {
      WaveToast.show('result: $result ', context);
    });

    Future.delayed(Duration(seconds: 5)).then((_) {
      WaveSafeDialog.dismiss(
          context: context, tag: "AA", result: 'delete dialog AA by tag AA');
    });

    Future.delayed(Duration(seconds: 10)).then((_) {
      WaveSafeDialog.dismiss(
          context: context, result: 'delete dialog BB by default tag');
    });
  }

  void _showWaveShareDialog3(BuildContext context) {
    WaveShareDialog waveShareDialog = new WaveShareDialog(
      context: context,
      shareChannels: [
        WaveShareItemConstants.shareWeiXin,
        WaveShareItemConstants.shareLink,
        WaveShareItemConstants.shareCustom
      ],
      titleText: "Test Title",
      descText:
          "Test Auxiliary Information Test Auxiliary Information Test Auxiliary Information Test Auxiliary Information Test Auxiliary Information",
      clickCallBack: (int channel, int index) {
        WaveToast.show("channel: $channel, index: $index", context);
      },
      getCustomChannelWidget: (int index) {
        if (index == 2)
          return WaveUITools.getAssetImage("images/icon_custom_share.png");
        else
          return null;
      },
      //custom icon
      getCustomChannelTitle: (int index) {
        if (index == 2)
          return "custom";
        else
          return null;
      }, //custom name
    );
    waveShareDialog.show();
  }

  void _showWaveShareDialog5(BuildContext context) {
    WaveShareDialog waveShareDialog = new WaveShareDialog(
      context: context,
      shareChannels: [
        WaveShareItemConstants.shareWeiXin,
        WaveShareItemConstants.shareCustom,
        WaveShareItemConstants.shareCustom,
        WaveShareItemConstants.shareLink,
        WaveShareItemConstants.shareCustom
      ],
      titleText: "Test Title",
      descText:
          "Test Auxiliary Information Test Auxiliary Information Test Auxiliary Information Test Auxiliary Information Test Auxiliary Information",
      clickCallBack: (int channel, int index) {
        WaveToast.show("channel: $channel, index: $index", context);
      },
      getCustomChannelWidget: (int index) {
        if (index == 1)
          return WaveUITools.getAssetImage("images/icon_custom_share.png");
        else if (index == 2)
          return WaveUITools.getAssetImage("images/icon_custom_share.png");
        else if (index == 4)
          return WaveUITools.getAssetImage("images/icon_custom_share.png");
        else
          return null;
      },
      //自定义图标
      getCustomChannelTitle: (int index) {
        if (index == 1)
          return "custom";
        else if (index == 2)
          return "custom";
        else if (index == 4)
          return "custom";
        else
          return null;
      }, //custom name
    );
    waveShareDialog.show();
  }

  void _showWaveTwoVerticalButtonDialogDialog(BuildContext context) {
    WaveEnhanceOperationDialog waveShareDialog = new WaveEnhanceOperationDialog(
      context: context,
      iconType: WaveDialogConstants.iconAlert,
      titleText: "Strong Prompt Text",
      descText:
          "Here is the copy here is the copy here is the copy here is the copy here is the copy here is the copy here is the copy here is the copy",
      mainButtonText: "Main button",
      secondaryButtonText: "Secondary information can be clicked",
      onMainButtonClick: () {
        print("Primary button");
      },
      onSecondaryButtonClick: () {
        print("Secondary button");
      },
    );
    waveShareDialog.show();
  }

  void _showWaveOneVerticalButtonDialogDialog(BuildContext context) {
    WaveEnhanceOperationDialog waveShareDialog = new WaveEnhanceOperationDialog(
      iconType: WaveDialogConstants.iconWarning,
      context: context,
      titleText: "Strong Prompt Text",
      descText:
          "Here is the copy here is the copy here is the copy here is the copy here is the copy here is the copy here is the copy here is the copy",
      mainButtonText: "I know",
      onMainButtonClick: () {
        print("Primary button");
      },
    );
    waveShareDialog.show();
  }

  void _showStyle82Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => WaveScrollableTextDialog(
            title: "plain text title",
            contentText:
                "Pure text means pure text\<font color = '#008886'\>Pure text means pure\</font\>This text means pure text\<a href= 'www.baidu.com'\>XXXXX\</a\>Pure text means pure text means pure text means pure text means pure text"
                "It means pure text? It means pure text? It means pure text? It means pure text? It means pure text? It means pure text?"
                "This text means pure text? This text means pure text? This text means pure text? This text means pure text?"
                "Show pure text? Table pure text? Table pure text? Table pure text? Table pure text? Table pure text? Table pure text? Table pure text?"
                "Pure text means pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text."
                "It's pure text? It's pure text? It's pure text?"
                "It means pure text? It means pure text? It means pure text? It means pure text? It means pure text. It means pure text. It means pure text. It means pure text."
                "Wen means pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text?"
                "It means pure text? It means pure text. It means pure text. It means pure text. It means pure text. "
                "Wen means pure text, pure text, pure text, pure text, pure text, pure text, pure text, pure text "
                "This table is pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table",
            submitText: "Submit",
            linksCallback: (String? text, String? url) {
              WaveToast.show(text!, context);
            },
            onSubmitClick: () {
              WaveToast.show("Clicked the plain text box", context);
            }));
  }

  void _showStyle81Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => WaveScrollableTextDialog(
            title:
                "Title in plain text Title in plain text Title in plain text Title in plain text Title in plain text Title in plain text",
            contentText:
                "pure text means pure text means pure text means pure text means pure text means pure text"
                "Show pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table"
                "Pure text means pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text"
                "Wen means pure text? represents pure text? represents pure text? represents pure text? represents pure text?"
                "It's pure text? It's pure text. It's pure text. It's pure text. It's pure text. It's pure text. It's pure text."
                "Wen it means pure text? It means pure text. It means pure text. It means pure text. It means pure text. It means pure text."
                "It's pure text? It's pure text. It's pure text. It's pure text. It's pure text. It's pure text. It's pure."
                "This text represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text",
            submitText: "Submit",
            onSubmitClick: () {
              WaveToast.show("Clicked the plain text box", context);
            }));
  }

  void _showStyle83Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => WaveScrollableTextDialog(
            title: "plain text title plain text",
            isClose: false,
            contentText:
                "pure text means pure text means pure text means pure text means pure text means pure text"
                "Show pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table"
                "Pure text means pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text"
                "Wen means pure text? represents pure text? represents pure text? represents pure text? represents pure text?"
                "It's pure text? It's pure text. It's pure text. It's pure text. It's pure text. It's pure text. It's pure text."
                "Wen it means pure text? It means pure text. It means pure text. It means pure text. It means pure text. It means pure text."
                "It's pure text? It's pure text. It's pure text. It's pure text. It's pure text. It's pure text. It's pure."
                "This text represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text",
            submitText: "Submit",
            onSubmitClick: () {
              WaveToast.show("Clicked the plain text box", context);
              Navigator.of(context).pop();
            }));
  }

  void _showStyle84Dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => WaveScrollableTextDialog(
              title: "plain text title plain text",
              contentText:
                  "pure text means pure text means pure text means pure text means pure text means pure text"
                  "Show pure text? table pure text? table pure text? table pure text? table pure text? table pure text? table"
                  "Pure text means pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text"
                  "Wen means pure text? represents pure text? represents pure text? represents pure text? represents pure text?"
                  "It's pure text? It's pure text. It's pure text. It's pure text. It's pure text. It's pure text. It's pure text."
                  "Wen it means pure text? It means pure text. It means pure text. It means pure text. It means pure text. It means pure text."
                  "It's pure text? It's pure text. It's pure text. It's pure text. It's pure text. It's pure text. It's pure."
                  "This text represents pure text? represents pure text? represents pure text? represents pure text? represents pure text? represents pure text",
              isShowOperateWidget: false,
            ));
  }
}
