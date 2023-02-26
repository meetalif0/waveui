import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class TextBlockInputExamplePage extends StatelessWidget {
  final String _title;

  TextBlockInputExamplePage(this._title);

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
            WaveTextBlockInputFormItem(
              controller: TextEditingController()..text = "hello",
              title: "备注",
              hint: "请输入",
              minLines: 1,
              maxLines: 5,
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                WaveToast.show("点击触发回调_${newValue}_onChanged", context);
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
            WaveTextBlockInputFormItem(
              controller: TextEditingController()..text = "hello",
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              isEdit: true,
              error: "必填项不能为空",
              title: "备注",
              subTitle: "以建筑面积计算",
              tipLabel: "提示",
              hint: "请输入",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                WaveToast.show("点击触发回调_${newValue}_onChanged", context);
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
            WaveTextBlockInputFormItem(
              controller: TextEditingController()..text = "hello",
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              isEdit: true,
              title: "备注",
              subTitle: "以建筑面积计算",
              tipLabel: "提示",
              hint: "请输入",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                WaveToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
              child: Text(
                "禁用态下可添加删除：",
                style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 22,
                ),
              ),
            ),
            WaveTextBlockInputFormItem(
              controller: TextEditingController()..text = "hello",
              prefixIconType: WavePrefixIconType.add,
              isRequire: true,
              isEdit: false,
              isPrefixIconEnabled: true,
              title: "备注",
              subTitle: "以建筑面积计算",
              tipLabel: "提示",
              hint: "请输入",
              onTip: () {
                WaveToast.show("点击触发onTip回调", context);
              },
              onAddTap: () {
                WaveToast.show("点击触发onAddTap回调", context);
              },
              onRemoveTap: () {
                WaveToast.show("点击触发onRemoveTap回调", context);
              },
              onChanged: (newValue) {
                WaveToast.show("点击触发回调_${newValue}_onChanged", context);
              },
            ),
          ],
        ));
  }
}
