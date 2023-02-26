import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class SelectionViewDateFilterExamplePage extends StatefulWidget {
  final String _title;
  final List<WaveSelectionEntity> _filters;

  SelectionViewDateFilterExamplePage(this._title, this._filters);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState(_filters);
}

class _SelectionViewExamplePageState
    extends State<SelectionViewDateFilterExamplePage> {
  late List<WaveSelectionEntity> _filterData;

  _SelectionViewExamplePageState(List<WaveSelectionEntity> filters) {
    _filterData = filters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(title: widget._title),
        body: Column(
          children: <Widget>[
            WaveSelectionView(
              originalSelectionData: _filterData,
              onCustomSelectionMenuClick: (int index,
                  WaveSelectionEntity customMenuItem,
                  WaveSetCustomSelectionParams customHandleCallBack) {
                customHandleCallBack({"customKey": "customValue"});
              },
              onMoreSelectionMenuClick:
                  (int index, WaveOpenMorePage openMorePage) {
                openMorePage(
                    updateData: false, moreSelections: widget._filters);
              },
              onSelectionChanged: (int menuIndex,
                  Map<String, String> filterParams,
                  Map<String, String> customParams,
                  WaveSetCustomSelectionMenuTitle setCustomTitleFunction) {
                WaveToast.show(
                    'filterParams : $filterParams' +
                        ',\n customParams : $customParams',
                    context);
              },
            ),
            Container(
              padding: EdgeInsets.only(top: 400),
              alignment: Alignment.center,
              child: Text("背景内容区域"),
            )
          ],
        ));
  }
}
