import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class TitleExamplePage extends StatelessWidget {
  final String _title;

  TitleExamplePage(this._title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(
          title: _title,
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
            WaveTitleFormItem(
              title: "自然到访保护期",
              operationLabel: "点击操作",
              onTip: () {
                WaveToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                WaveToast.show("点击触发回调_onTap", context);
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
            WaveTitleFormItem(
              error: "必填项不能为空",
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              operationLabel: "点击操作",
              onTip: () {
                WaveToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                WaveToast.show("点击触发回调_onTap", context);
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
            WaveTitleFormItem(
              title: "自然到访保护期",
              subTitle: "这里是副标题",
              tipLabel: "提示",
              operationLabel: "点击操作",
              onTip: () {
                WaveToast.show("点击触发回调_onTip", context);
              },
              onTap: () {
                WaveToast.show("点击触发回调_onTap", context);
              },
            ),
          ],
        ));
  }
}
