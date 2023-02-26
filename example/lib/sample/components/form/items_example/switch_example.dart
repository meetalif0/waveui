import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class SwitchInputExamplePage extends StatefulWidget {
  final String _title;

  SwitchInputExamplePage(this._title);

  @override
  State<StatefulWidget> createState() {
    return SwitchInputExampleState();
  }
}

class SwitchInputExampleState extends State<SwitchInputExamplePage> {
  bool _isFirstSwitchOn = true;
  bool _isSecondSwitchOn = true;
  bool _isThirdSwitchOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(
          title: widget._title,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                "基本样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            WaveSwitchFormItem(
              title: "自然到访保护期",
              value: _isFirstSwitchOn,
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                setState(() {
                  _isFirstSwitchOn = newValue;
                });
                WaveToast.show(
                    "点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "全功能样式：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            WaveSwitchFormItem(
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              value: _isSecondSwitchOn,
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                setState(() {
                  _isSecondSwitchOn = newValue;
                });
                WaveToast.show(
                    "点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "no error：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            WaveSwitchFormItem(
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              isEdit: false,
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              value: _isThirdSwitchOn,
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (oldValue, newValue) {
                setState(() {
                  _isThirdSwitchOn = newValue;
                });
                WaveToast.show(
                    "点击触发回调${oldValue}_${newValue}_onChanged", context);
              },
            ),
          ],
        ));
  }
}
