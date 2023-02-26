import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class SelectionViewMultiListExamplePage extends StatefulWidget {
  final String _title;
  final List<WaveSelectionEntity>? _filterData;

  SelectionViewMultiListExamplePage(this._title, this._filterData);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState();
}

class _SelectionViewExamplePageState
    extends State<SelectionViewMultiListExamplePage> {
  List<WaveSelectionEntity>? items;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(title: widget._title),
        body: Column(
          children: <Widget>[
            WaveSelectionView(
              originalSelectionData: widget._filterData!,
              onSelectionChanged: (int menuIndex,
                  Map<String, String> filterParams,
                  Map<String, String> customParams,
                  WaveSetCustomSelectionMenuTitle setCustomTitleFunction) {
                WaveToast.show(filterParams.toString(), context);
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
