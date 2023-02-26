import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class RowTagExample extends StatefulWidget {
  @override
  _RowTagExampleState createState() => _RowTagExampleState();
}

class _RowTagExampleState extends State<RowTagExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WaveAppBar(
        title: '标签组合',
      ),
      body: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        children: [
          WaveTagCustom(
            tagText: '自定义标签',
          ),
          WaveTagCustom(
            tagText: '标签',
          ),
          WaveTagCustom.buildBorderTag(tagText: '标签1'),
          WaveTagCustom.buildBorderTag(tagText: '标签2'),
          WaveTagCustom.buildBorderTag(tagText: '特长长长长长长的标签'),
          WaveTagCustom(tagText: '一级标签'),
          WaveTagCustom(tagText: '二级标签'),
          WaveTagCustom(tagText: '其他标签'),
          WaveTagCustom(tagText: '二级标签'),
          WaveTagCustom(tagText: '一级标签'),
          WaveTagCustom(tagText: '二级标签'),
        ],
        spacing: 5,
        runSpacing: 5,
      ),
    );
  }
}
