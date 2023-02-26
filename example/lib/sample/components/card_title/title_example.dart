import 'package:waveui/waveui.dart';
import 'package:example/sample/components/card_title/wave_action_title_example.dart';
import 'package:example/sample/components/card_title/wave_common_title_example.dart';
import 'package:example/sample/components/tabbar/wave_switch_title_example.dart';
import 'package:example/sample/components/tabbar/sub_switch_title_example.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:flutter/material.dart';

class TitleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: "标题示例",
      ),
      body: ListView(
        children: [
          ListItem(
            title: "普通标题",
            isShowLine: false,
            isSupportTheme: true,
            describe: '标题+辅助widget+底部详细信息',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return WaveCommonTitleExample();
                },
              ));
            },
          ),
          ListItem(
            title: "箭头标题",
            isSupportTheme: true,
            describe: '带有箭头的标题',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return WaveActionTitleExample();
                },
              ));
            },
          ),
          ListItem(
            title: "一级标题",
            describe: '标题下方可切换',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return WaveSwitchTitleExample();
                },
              ));
            },
          ),
          ListItem(
            title: "二级标题",
            describe: '标题下方可切换',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return SubSwitchTitleExample();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
