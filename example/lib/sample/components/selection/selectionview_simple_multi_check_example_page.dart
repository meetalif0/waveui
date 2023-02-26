import 'package:waveui/waveui.dart';
import 'package:example/sample/components/selection/filter_entity.dart';
import 'package:flutter/material.dart';

class SelectionViewSimpleMultiCheckExamplePage extends StatefulWidget {
  final String _title;
  final WaveFilterEntity _filterData;

  SelectionViewSimpleMultiCheckExamplePage(this._title, this._filterData);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState();
}

class _SelectionViewExamplePageState
    extends State<SelectionViewSimpleMultiCheckExamplePage> {
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
            WaveSimpleSelection.checkbox(
              menuName: widget._filterData.name,
              menuKey: widget._filterData.key ?? 'defaultMenuKey',
              items: widget._filterData.children,
              maxSelectedCount: 4,
              defaultValue: widget._filterData.defaultValue,
              onSimpleSelectionChanged: (List<ItemEntity> filterParams) {
                WaveToast.show(
                    filterParams.map((e) => e.value).toList().join(','),
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
