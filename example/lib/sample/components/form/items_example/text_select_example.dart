import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class TextSelectInputExamplePage extends StatelessWidget {
  final String _title;

  TextSelectInputExamplePage(this._title);

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
            WaveTextSelectFormItem(
              title: "证件类型",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
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
            WaveTextSelectFormItem(
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
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
            WaveTextSelectFormItem(
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onTap: () {
                WaveToast.show("点击触发回调_onTap", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "autoLayout：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            WaveTextSelectFormItem.autoLayout(
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "证件类型",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onTap: () {
                WaveToast.show("点击触发回调_onTap", context);
              },
            ),
          ],
        ));
  }
}
