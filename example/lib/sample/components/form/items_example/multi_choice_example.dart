import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class MultiChoiceInputExamplePage extends StatelessWidget {
  final String _title;

  MultiChoiceInputExamplePage(this._title);

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
            WaveMultiChoiceInputFormItem(
              title: "自然",
              options: ["固定", "永久", "未知"],
              value: [
                "固定",
                "永久",
              ],
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String>? newValue) {
                WaveToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue!.length}_onChanged",
                    context);
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
            WaveMultiChoiceInputFormItem(
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              error: "必填项不能为空",
              title: "自然",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: [
                "固定",
                "永久",
              ],
              value: [
                "固定",
              ],
              enableList: [true, false],
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String>? newValue) {
                WaveToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue!.length}_onChanged",
                    context);
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
            WaveMultiChoiceInputFormItem(
              prefixIconType: WavePrefixIconType.remove,
              isRequire: true,
              title: "自然到",
              subTitle: "这里是副标题",
              tipLabel: "标签",
              options: [
                "固定",
                "永久",
              ],
              value: [
                "固定",
              ],
              enableList: [true, true],
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (List<String> oldValue, List<String> newValue) {
                WaveToast.show(
                    "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged",
                    context);
              },
            ),
          ],
        ));
  }
}
