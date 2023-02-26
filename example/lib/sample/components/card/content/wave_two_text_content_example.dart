import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class WaveTextRIchContentExample extends StatefulWidget {
  @override
  _WaveTextRIchContentExampleState createState() =>
      _WaveTextRIchContentExampleState();
}

class _WaveTextRIchContentExampleState
    extends State<WaveTextRIchContentExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WaveAppBar(
        title: '两列纯文本',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '规则',
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            WaveBubbleText(
              maxLines: 4,
              text: '两组key-value内容平分屏幕，每一组key-value都是一行展示，'
                  'value紧挨着key，不考虑对齐',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveRichInfoGrid(
              pairInfoList: <WaveRichGridInfo>[
                WaveRichGridInfo("名称名称：", '内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：key过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveRichInfoGrid(
              pairInfoList: <WaveRichGridInfo>[
                WaveRichGridInfo("名称名称名称名称名称名称名称名称：", '内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveRichInfoGrid(
              pairInfoList: <WaveRichGridInfo>[
                WaveRichGridInfo("名称名称：", '内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：Key和Value过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveRichInfoGrid(
              rowSpace: 10,
              pairInfoList: <WaveRichGridInfo>[
                WaveRichGridInfo("名称名称：", null),
                WaveRichGridInfo(
                    "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo("名称：", ''),
              ],
            ),
            Text(
              '特殊案例：Padding中',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: WaveRichInfoGrid(
                rowSpace: 10,
                pairInfoList: <WaveRichGridInfo>[
                  WaveRichGridInfo("名称名称：", null),
                  WaveRichGridInfo(
                      "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                  WaveRichGridInfo("名称：", '内容内容'),
                  WaveRichGridInfo("名称：", ''),
                ],
              ),
            ),
            Text(
              '特殊案例：Row中',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Row(
              children: <Widget>[
                Text("我是自定义"),
                Expanded(
                  child: WaveRichInfoGrid(
                    rowSpace: 10,
                    pairInfoList: <WaveRichGridInfo>[
                      WaveRichGridInfo("名称名称：", null),
                      WaveRichGridInfo(
                          "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                      WaveRichGridInfo("名称：", '内容内容'),
                      WaveRichGridInfo("名称：", ''),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              '特殊案例：Column中',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Column(
              children: <Widget>[
                WaveRichInfoGrid(
                  rowSpace: 10,
                  pairInfoList: <WaveRichGridInfo>[
                    WaveRichGridInfo("名称名称：", null),
                    WaveRichGridInfo(
                        "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                    WaveRichGridInfo("名称：", '内容内容'),
                    WaveRichGridInfo("名称：", ''),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Pad 案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Column(
                  children: <Widget>[
                    WavePairInfoTable(
                      children: <WaveInfoModal>[
                        WaveInfoModal(
                            keyPart: "名称：", valuePart: "加粗的内容，文字样式可配置"),
                        WaveInfoModal(keyPart: "名称名：", valuePart: "没加粗的内容"),
                        WaveInfoModal(
                            keyPart: "名称名称名：", valuePart: "内容内容内容内容内容"),
                        WaveInfoModal(
                          keyPart: "名称名称名称名称：",
                          valuePart: "内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容",
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WaveRichInfoGrid(
                      themeData: WavePairRichInfoGridConfig(
                          keyTextStyle: WaveTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff999999)),
                          valueTextStyle: WaveTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff999999),
                          )),
                      rowSpace: 10,
                      pairInfoList: <WaveRichGridInfo>[
                        WaveRichGridInfo("正常的名称：", '正常的内容'),
                        WaveRichGridInfo(
                            "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                        WaveRichGridInfo("名称：", '内容内容内容内容内容内容内容内容内容内容内容内容'),
                        WaveRichGridInfo("名称：", ''),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    WaveRichInfoGrid(
                      rowSpace: 10,
                      pairInfoList: <WaveRichGridInfo>[
                        WaveRichGridInfo("加粗的名称：", '加粗的内容'),
                        WaveRichGridInfo(
                            "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                        WaveRichGridInfo("名称：", '内容内容内容内容内容内容内容内容内容内容内容内容'),
                        WaveRichGridInfo("名称：", ''),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
