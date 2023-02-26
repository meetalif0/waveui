import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class SelectionViewDateRangeExamplePage extends StatefulWidget {
  final String _title;
  final List<WaveSelectionEntity>? _filterData;

  SelectionViewDateRangeExamplePage(this._title, this._filterData);

  @override
  _SelectionViewExamplePageState createState() =>
      _SelectionViewExamplePageState();
}

class _SelectionViewExamplePageState
    extends State<SelectionViewDateRangeExamplePage> {
  List<WaveSelectionEntity>? items;

  WaveSelectionViewController? controller;

  @override
  void initState() {
    super.initState();

    controller = WaveSelectionViewController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(title: widget._title),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text("点击关闭弹窗"),
              onTap: () {
                controller!.closeSelectionView();
              },
            ),
          ),
          WaveSelectionView(
            selectionViewController: controller,
            originalSelectionData: widget._filterData!,
            onSelectionChanged: (int menuIndex,
                Map<String, String> filterParams,
                Map<String, String> customParams,
                WaveSetCustomSelectionMenuTitle setCustomTitleFunction) {
              WaveToast.show(filterParams.toString(), context);
            },
            onSelectionPreShow: (int index, WaveSelectionEntity entity) {
              if (entity.key == 'date_11' || entity.key == 'date_22') {
                return WaveSelectionWindowType.range;
              }
              return entity.filterShowType!;
            },
          ),
          Container(
            padding: EdgeInsets.only(top: 300),
            alignment: Alignment.center,
            child: Text("背景内容区域"),
          ),
        ],
      )),
    );
  }
}
