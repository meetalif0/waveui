import 'dart:math';

import 'package:waveui/waveui.dart';
import 'package:example/sample/components/charts/line/db_data_node_model.dart';
import 'package:flutter/material.dart';

class BrokenLineExample extends StatefulWidget {
  final List<DBDataNodeModel> brokenData;

  BrokenLineExample(this.brokenData);

  @override
  _BrokenLineExampleState createState() => _BrokenLineExampleState();
}

class _BrokenLineExampleState extends State<BrokenLineExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: '折线',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _brokenLineExample1(context, widget.brokenData),
                Padding(padding: EdgeInsets.all(8)),
                _brokenLineExample2(context),
                Padding(padding: EdgeInsets.all(8)),
                _brokenLineExample3(context),
                Padding(padding: EdgeInsets.all(8)),
                _brokenLineExample4(context),
                Padding(padding: EdgeInsets.all(8)),
                _brokenLineExample5(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /////////////////////////////
  Widget _brokenLineExample1(context, List<DBDataNodeModel> brokenData) {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          WaveBrokenLine(
            showPointDashLine: true,
            yHintLineOffset: 30,
            isTipWindowAutoDismiss: false,
            isShowXDial: true,
            lines: [
              WavePointsLine(
                isShowPointText: true,
                isShowXDial: false,
                lineWidth: 3,
                pointRadius: 4,
                isShowPoint: true,
                isCurve: true,
                points: _linePointsForExample1(brokenData),
                shaderColors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.01)
                ],
                lineColor: Colors.green,
              )
            ],
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height / 5 * 1.6 - 20 * 2),
            isShowXHintLine: true,
            xDialValues: _getXDialValuesForExample1(brokenData),
            xDialMin: 0,
            xDialMax: _getXDialValuesForExample1(brokenData).length.toDouble(),
            yDialValues: _getYDialValuesForExample1(brokenData),
            yDialMin: _getMinValueForExample1(brokenData),
            yDialMax: _getMaxValueForExample1(brokenData),
            isHintLineSolid: false,
            isShowYDialText: true,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<WavePointData> _linePointsForExample1(List<DBDataNodeModel> brokenData) {
    return brokenData
        .map((_) => WavePointData(
            pointText: _.value,
            x: brokenData.indexOf(_).toDouble(),
            y: double.parse(_.value!),
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return _.value;
                })))
        .toList();
  }

  List<WaveDialItem> _getYDialValuesForExample1(
      List<DBDataNodeModel> brokenData) {
    double min = _getMinValueForExample1(brokenData);
    double max = _getMaxValueForExample1(brokenData);
    double dValue = (max - min) / 10;
    List<WaveDialItem> _yDialValue = [];
    for (int index = 0; index <= 10; index++) {
      _yDialValue.add(WaveDialItem(
        dialText: '${(min + index * dValue).ceil()}',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: (min + index * dValue).ceilToDouble(),
      ));
    }
    _yDialValue.add(WaveDialItem(
      dialText: '4.5',
      dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
      value: 4.5,
    ));
    return _yDialValue;
  }

  double _getMinValueForExample1(List<DBDataNodeModel> brokenData) {
    double minValue = double.tryParse(brokenData[0].value!) ?? 0;
    for (DBDataNodeModel point in brokenData) {
      minValue = min(double.tryParse(point.value!) ?? 0, minValue);
    }
    return minValue;
  }

  double _getMaxValueForExample1(List<DBDataNodeModel> brokenData) {
    double maxValue = double.tryParse(brokenData[0].value!) ?? 0;
    for (DBDataNodeModel point in brokenData) {
      maxValue = max(double.tryParse(point.value!) ?? 0, maxValue);
    }
    return maxValue;
  }

  List<WaveDialItem> _getXDialValuesForExample1(
      List<DBDataNodeModel> brokenData) {
    List<WaveDialItem> _xDialValue = [];
    for (int index = 0; index < brokenData.length; index++) {
      _xDialValue.add(WaveDialItem(
        dialText: brokenData[index].name,
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: index.toDouble(),
      ));
    }
    return _xDialValue;
  }

  ////////////////////////////
  Widget _brokenLineExample2(context) {
    var chartLine = WaveBrokenLine(
      lines: _linesForExample2(),
      size: Size(MediaQuery.of(context).size.width - 50,
          MediaQuery.of(context).size.height / 5 * 1.6 - 20 * 2),
      isShowXHintLine: true,
      yHintLineOffset: 30,
      yDialValues: _yDialValuesForExample2(),
      yDialMin: 0,
      yDialMax: 120,
      xDialValues: _xDialValuesForExample2(),
      xDialMin: 1,
      xDialMax: 7,
      isHintLineSolid: false,
      isShowYDialText: true,
    );
    return Container(
      child: Column(
        children: <Widget>[
          _buildIdentificationList(),
          SizedBox(
            height: 16,
          ),
          chartLine
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<WavePointsLine> _linesForExample2() {
    WavePointsLine _pointsLine;
    WavePointsLine _pointsLine1;
    List<WavePointsLine> pointsLineList = [];
    _pointsLine = WavePointsLine(
      isShowPointText: true,
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        WavePointData(
            pointText: '15',
            x: 1,
            y: 15,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '15';
                })),
        WavePointData(
            x: 2.5,
            y: 30,
            pointText: '22222',
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        WavePointData(
            pointText: '17',
            x: 3,
            y: 17,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '17';
                })),
        WavePointData(
            pointText: '45',
            x: 4,
            y: 45,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '45';
                })),
        WavePointData(
            pointText: '45',
            x: 5,
            y: 80,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '80';
                })),
      ],
      shaderColors: [
        Colors.blue.withOpacity(0.3),
        Colors.blue.withOpacity(0.01)
      ],
      lineColor: Colors.blue,
    );
    _pointsLine1 = WavePointsLine(
      isShowPointText: true,
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        WavePointData(
            pointText: '30',
            x: 2.5,
            y: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        WavePointData(
            pointText: '17',
            x: 3,
            y: 20,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '17';
                })),
        WavePointData(
            pointText: '45',
            x: 4,
            y: 30,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '45';
                })),
        WavePointData(
            pointText: '45',
            x: 5,
            y: 50,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '80';
                })),
        WavePointData(
            pointText: '45',
            x: 6,
            y: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '80';
                })),
      ],
      shaderColors: [
        Colors.green.withOpacity(0.3),
        Colors.green.withOpacity(0.01)
      ],
      lineColor: Colors.green,
    );

    pointsLineList.add(_pointsLine);
    pointsLineList.add(_pointsLine1);
    return pointsLineList;
  }

  List<WaveDialItem> _xDialValuesForExample2() {
    return [
      WaveDialItem(
        dialText: '1月',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        selectedDialTextStyle: TextStyle(fontSize: 14.0, color: Colors.green),
        value: 1,
      ),
      WaveDialItem(
        dialText: '2月',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        selectedDialTextStyle: TextStyle(fontSize: 14.0, color: Colors.red),
        value: 2,
      ),
      WaveDialItem(
        dialText: '3月',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        selectedDialTextStyle: TextStyle(fontSize: 14.0, color: Colors.black),
        value: 3,
      ),
      WaveDialItem(
        dialText: '5月',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        selectedDialTextStyle: TextStyle(fontSize: 14.0, color: Colors.orange),
        value: 5,
      ),
      WaveDialItem(
        dialText: '6月',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        selectedDialTextStyle: TextStyle(fontSize: 14.0, color: Colors.yellow),
        value: 6,
      ),
      WaveDialItem(
        dialText: '7月',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        selectedDialTextStyle:
            TextStyle(fontSize: 14.0, color: Colors.amberAccent),
        value: 7,
      )
    ];
  }

  List<WaveDialItem> _yDialValuesForExample2() {
    return [
      WaveDialItem(
        dialText: '0',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 0,
      ),
      WaveDialItem(
        dialText: '33.3',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 33.3,
      ),
      WaveDialItem(
        dialText: '66.6',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 66.6,
      ),
      WaveDialItem(
        dialText: '100',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 100,
      ),
      WaveDialItem(
        dialText: '120',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 120,
      )
    ];
  }

  /////////////////////
  Widget _brokenLineExample3(context) {
    var chartLine = WaveBrokenLine(
      showPointDashLine: false,
      yHintLineOffset: 40,
      lines: _getPointsLinesForExample3(),
      size: Size(MediaQuery.of(context).size.width - 50 * 2,
          MediaQuery.of(context).size.height / 5 * 1.6 - 20 * 2),
      isShowXHintLine: true,
      yDialValues: getYDialValuesForExample3(),
      xDialValues: _getXDialValuesForExample3(_getPointsLinesForExample3()),
      yDialMin: 0,
      yDialMax: 120,
      xDialMin: 1,
      xDialMax: 11,
      isHintLineSolid: false,
      isShowYDialText: true,
    );
    return Container(
      child: Column(
        children: <Widget>[
          _buildIdentificationList(),
          SizedBox(
            height: 16,
          ),
          chartLine,
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<WavePointsLine> _getPointsLinesForExample3() {
    WavePointsLine pointsLine, _pointsLine2;
    List<WavePointsLine> pointsLineList = [];
    pointsLine = WavePointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: true,
      isCurve: false,
      points: [
        WavePointData(
            pointText: '30',
            y: 30,
            x: 1,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 30,
                            color: Colors.greenAccent,
                          ),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.blue)
                        ],
                      ),
                    ),
                  );
                })),
        WavePointData(
            pointText: '88',
            y: 80,
            x: 2,
            lineTouchData: WaveLineTouchData(
                onTouch: () {
                  return Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                    child: Center(
                        child: Text(
                      'content',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 2.0), //阴影xy轴偏移量
                          blurRadius: 4.0, //阴影模糊程度
                        )
                      ],
                    ),
                  );
                },
                tipWindowSize: Size(60, 40))),
        WavePointData(
            pointText: '20',
            y: 20,
            x: 3,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '20';
                })),
        WavePointData(
            pointText: '67',
            y: 67,
            x: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        WavePointData(
            pointText: '10',
            y: 10,
            x: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '10';
                })),
        WavePointData(
            pointText: '40',
            y: 40,
            x: 6,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '40';
                })),
        WavePointData(
            pointText: '100',
            y: 60,
            x: 7,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 70,
            x: 8,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 90,
            x: 9,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 80,
            x: 10,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '11';
                })),
        WavePointData(
            pointText: '100',
            y: 100,
            x: 11,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
      ],
      lineColor: Colors.blue,
    );

    _pointsLine2 = WavePointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        WavePointData(
            pointText: '15',
            y: 15,
            x: 1,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '15';
                })),
        WavePointData(
            pointText: '30',
            y: 30,
            x: 2,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        WavePointData(
            pointText: '17',
            y: 17,
            x: 3,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '17';
                })),
        WavePointData(
            pointText: '18',
            y: 25,
            x: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '18';
                })),
        WavePointData(
            pointText: '13',
            y: 40,
            x: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '13';
                })),
        WavePointData(
            pointText: '16',
            y: 30,
            x: 6,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '16';
                })),
        WavePointData(
            pointText: '49',
            y: 49,
            x: 7,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '49';
                })),
        WavePointData(
            pointText: '66',
            y: 66,
            x: 8,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        WavePointData(
            pointText: '77',
            y: 80,
            x: 9,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '77';
                })),
        WavePointData(
            pointText: '88',
            y: 90,
            x: 10,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '88';
                })),
        WavePointData(
            pointText: '99',
            y: 60,
            x: 11,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '99';
                })),
      ],
      shaderColors: [
        Colors.green.withOpacity(0.3),
        Colors.green.withOpacity(0.01)
      ],
      lineColor: Colors.green,
    );

    pointsLineList.add(pointsLine);
    pointsLineList.add(_pointsLine2);
    return pointsLineList;
  }

  List<WaveDialItem> getYDialValuesForExample3() {
    return [
      WaveDialItem(
        dialText: '自定义',
        dialTextStyle: TextStyle(fontSize: 10.0, color: Colors.green),
        value: 0,
      ),
      WaveDialItem(
        dialText: '20',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 20,
      ),
      WaveDialItem(
        dialText: '40',
        dialTextStyle: TextStyle(fontSize: 10.0, color: Colors.red),
        value: 40,
      ),
      WaveDialItem(
        dialText: '60',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 60,
      ),
      WaveDialItem(
        dialText: '80',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 80,
      ),
      WaveDialItem(
        dialText: '100',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 100,
      ),
      WaveDialItem(
        dialText: '120',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 120,
      )
    ];
  }

  _getXDialValuesForExample3(List<WavePointsLine> lines) {
    List<WaveDialItem> _xDialValue = [];
    for (int index = 0; index < lines[0].points.length; index++) {
      _xDialValue.add(WaveDialItem(
        dialText: '${lines[0].points[index].x}',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: lines[0].points[index].x,
      ));
    }
    return _xDialValue;
  }

  /////////////////////
  Widget _brokenLineExample4(context) {
    var chartLine = WaveBrokenLine(
      lines: _getPointsLinesForExample4(),
      size: Size(MediaQuery.of(context).size.width * 2,
          MediaQuery.of(context).size.height / 5 * 1.6 - 20 * 2),
      isShowXHintLine: true,
      yHintLineOffset: 30,
      yDialMin: 0,
      yDialMax: 120,
      yDialValues: _yDialValuesForExample4(),
      xDialMin: 1,
      xDialMax: 11,
      xDialValues: _getXDialValuesForExample4(_getPointsLinesForExample4()),
      isHintLineSolid: false,
      isShowYDialText: true,
    );
    return Container(
      child: Column(
        children: <Widget>[
          _buildIdentificationList(),
          SizedBox(
            height: 16,
          ),
          chartLine
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<WavePointsLine> _getPointsLinesForExample4() {
    WavePointsLine pointsLine, _pointsLine2;
    List<WavePointsLine> pointsLineList = [];
    pointsLine = WavePointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: true,
      isCurve: false,
      points: [
        WavePointData(
            pointText: '30',
            y: 30,
            x: 1,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 30,
                            color: Colors.greenAccent,
                          ),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.blue)
                        ],
                      ),
                    ),
                  );
                })),
        WavePointData(
            pointText: '88',
            y: 80,
            x: 2,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                    child: Center(
                        child: Text(
                      'content',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 2.0), //阴影xy轴偏移量
                          blurRadius: 4.0, //阴影模糊程度
                        )
                      ],
                    ),
                  );
                })),
        WavePointData(
            pointText: '20',
            y: 20,
            x: 3,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '20';
                })),
        WavePointData(
            pointText: '67',
            y: 67,
            x: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        WavePointData(
            pointText: '10',
            y: 10,
            x: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '10';
                })),
        WavePointData(
            pointText: '40',
            y: 40,
            x: 6,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '40';
                })),
        WavePointData(
            pointText: '100',
            y: 60,
            x: 7,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 70,
            x: 8,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 90,
            x: 9,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 80,
            x: 10,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '11';
                })),
        WavePointData(
            pointText: '100',
            y: 100,
            x: 11,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
      ],
      lineColor: Colors.blue,
    );

    _pointsLine2 = WavePointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        WavePointData(
            pointText: '15',
            y: 15,
            x: 1,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '15';
                })),
        WavePointData(
            pointText: '30',
            y: 30,
            x: 2,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        WavePointData(
            pointText: '17',
            y: 17,
            x: 3,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '17';
                })),
        WavePointData(
            pointText: '18',
            y: 25,
            x: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '18';
                })),
        WavePointData(
            pointText: '13',
            y: 40,
            x: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '13';
                })),
        WavePointData(
            pointText: '16',
            y: 30,
            x: 6,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '16';
                })),
        WavePointData(
            pointText: '49',
            y: 49,
            x: 7,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '49';
                })),
        WavePointData(
            pointText: '66',
            y: 66,
            x: 8,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        WavePointData(
            pointText: '77',
            y: 80,
            x: 9,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '77';
                })),
        WavePointData(
            pointText: '88',
            y: 90,
            x: 10,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '88';
                })),
        WavePointData(
            pointText: '99',
            y: 60,
            x: 11,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '99';
                })),
      ],
      shaderColors: [
        Colors.green.withOpacity(0.3),
        Colors.green.withOpacity(0.01)
      ],
      lineColor: Colors.green,
    );

    pointsLineList.add(pointsLine);
    pointsLineList.add(_pointsLine2);
    return pointsLineList;
  }

  List<WaveDialItem> _yDialValuesForExample4() {
    return [
      WaveDialItem(
        dialText: '0',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 0,
      ),
      WaveDialItem(
        dialText: '33.3',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 33.3,
      ),
      WaveDialItem(
        dialText: '66.6',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 66.6,
      ),
      WaveDialItem(
        dialText: '100',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 100,
      ),
      WaveDialItem(
        dialText: '120',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 120,
      )
    ];
  }

  List<WaveDialItem> _getXDialValuesForExample4(List<WavePointsLine> lines) {
    List<WaveDialItem> _xDialValue = [];
    for (int index = 0; index < lines[0].points.length; index++) {
      _xDialValue.add(WaveDialItem(
        dialText: '${lines[0].points[index].x}',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: lines[0].points[index].x,
      ));
    }
    return _xDialValue;
  }

///////////////////////
  Widget _brokenLineExample5(context) {
    var chartLine = WaveBrokenLine(
      contentPadding: EdgeInsets.only(left: 20, right: 10),
      lines: _getPointsLineListWithShowPointText(),
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 5 * 1.6 - 20 * 2),
      isShowXHintLine: true,
      yHintLineOffset: 30,
      yDialValues: _yDialValuesForExample5(),
      yDialMin: 0,
      yDialMax: 120,
      xDialValues:
          _getXDialValuesForExample5(_getPointsLineListWithShowPointText()),
      xDialMin: 1,
      xDialMax: 11,
      isHintLineSolid: false,
      isShowYDialText: true,
    );
    return Container(
      child: Column(
        children: <Widget>[
          _buildIdentificationList(),
          SizedBox(
            height: 16,
          ),
          chartLine
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  List<WaveDialItem> _yDialValuesForExample5() {
    return [
      WaveDialItem(
        dialText: '0',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 0,
      ),
      WaveDialItem(
        dialText: '33.3',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 33.3,
      ),
      WaveDialItem(
        dialText: '66.6',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 66.6,
      ),
      WaveDialItem(
        dialText: '100',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 100,
      ),
      WaveDialItem(
        dialText: '120',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 120,
      )
    ];
  }

  _getXDialValuesForExample5(List<WavePointsLine> lines) {
    List<WaveDialItem> _xDialValue = [];
    for (int index = 0; index < lines[0].points.length; index++) {
      _xDialValue.add(WaveDialItem(
        dialText: '${lines[0].points[index].x}',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: lines[0].points[index].x,
      ));
    }
    return _xDialValue;
  }

  List<WavePointsLine> _getPointsLineListWithShowPointText() {
    WavePointsLine pointsLine, _pointsLine2;
    List<WavePointsLine> pointsLineList = [];
    pointsLine = WavePointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      pointColor: Colors.blue,
      pointInnerColor: Colors.black12,
      pointInnerRadius: 1.5,
      isShowPoint: true,
      isShowPointText: true,
      isCurve: false,
      lineColor: Colors.blue,
      points: [
        WavePointData(
            pointText: '9999.99',
            pointTextStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 12, color: Colors.red),
            y: 80,
            x: 1,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 30,
                            color: Colors.greenAccent,
                          ),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.blue)
                        ],
                      ),
                    ),
                  );
                })),
        WavePointData(
            offset: Offset(0, -5),
            pointText: '9999.99',
            pointTextStyle: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 12, color: Colors.red),
            y: 80,
            x: 2,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return Container(
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                    child: Center(
                        child: Text(
                      'content',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 2.0), //阴影xy轴偏移量
                          blurRadius: 4.0, //阴影模糊程度
                        )
                      ],
                    ),
                  );
                })),
        WavePointData(
            pointText: '20',
            y: 20,
            x: 3,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '20';
                })),
        WavePointData(
            pointText: '67',
            y: 67,
            x: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        WavePointData(
            pointText: '10',
            y: 10,
            x: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '10';
                })),
        WavePointData(
            pointText: '40',
            y: 40,
            x: 6,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '40';
                })),
        WavePointData(
            pointText: '100',
            y: 60,
            x: 7,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 70,
            x: 8,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 90,
            x: 9,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        WavePointData(
            pointText: '100',
            y: 80,
            x: 10,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '11';
                })),
        WavePointData(
            pointText: '100',
            y: 100,
            x: 11,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
      ],
    );

    _pointsLine2 = WavePointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        WavePointData(
            pointText: '1111111',
            y: 15,
            x: 1,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '15';
                })),
        WavePointData(
            pointText: '30',
            y: 30,
            x: 2,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        WavePointData(
            pointText: '17',
            y: 17,
            x: 3,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '17';
                })),
        WavePointData(
            pointText: '18',
            y: 25,
            x: 4,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '18';
                })),
        WavePointData(
            pointText: '13',
            y: 40,
            x: 5,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '13';
                })),
        WavePointData(
            pointText: '16',
            y: 30,
            x: 6,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '16';
                })),
        WavePointData(
            pointText: '49',
            y: 49,
            x: 7,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '49';
                })),
        WavePointData(
            pointText: '66',
            y: 66,
            x: 8,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        WavePointData(
            pointText: '77',
            y: 80,
            x: 9,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '77';
                })),
        WavePointData(
            pointText: '88',
            y: 90,
            x: 10,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '88';
                })),
        WavePointData(
            pointText: '99',
            y: 60,
            x: 11,
            lineTouchData: WaveLineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '99';
                })),
      ],
      shaderColors: [
        Colors.green.withOpacity(0.3),
        Colors.green.withOpacity(0.01)
      ],
      lineColor: Colors.green,
    );

    pointsLineList.add(pointsLine);
    pointsLineList.add(_pointsLine2);
    return pointsLineList;
  }

  Widget _buildIdentificationList() {
    List<Widget> widgetList = [];
    for (WavePointsLine bean in _getPointsLinesForExample3()) {
      Widget widget = Row(children: [
        Container(
          height: 3,
          width: 12,
          decoration: BoxDecoration(
              color: bean.lineColor,
              borderRadius: BorderRadius.all(Radius.circular(1.5))),
        ),
        Text('图例', style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
        SizedBox(width: 6),
      ]);

      widgetList.add(widget);
    }
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Container(
          alignment: Alignment.centerLeft,
          child: Text('图表标题',
              style: TextStyle(fontSize: 18, color: Colors.black))),
      Row(children: widgetList),
    ]);
  }
}
