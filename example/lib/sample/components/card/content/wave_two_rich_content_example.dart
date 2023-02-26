import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class WaveTwoRichContentExample extends StatefulWidget {
  @override
  _WaveTwoRichContentExampleState createState() =>
      _WaveTwoRichContentExampleState();
}

class _WaveTwoRichContentExampleState extends State<WaveTwoRichContentExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: WaveAppBar(
        title: '两列复杂文本',
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
                WaveRichGridInfo("名称：", '内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
                    keyQuestionCallback: (value) {
                  WaveToast.show(value, context);
                }),
                WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
                    valueQuestionCallback: (value) {
                  WaveToast.show(value, context);
                }),
                WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
                    valueQuestionCallback: (value) {
                      WaveToast.show(value, context);
                    },
                    clickTitle: "可点击内容",
                    clickCallback: (value) {
                      WaveToast.show(value, context);
                    }),
                WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
                    clickTitle: "可点击内容", clickCallback: (value) {
                  WaveToast.show(value, context);
                }),
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
                WaveRichGridInfo.valueLastClickInfo('名称名称名称名称名称名称名称', '内容内容',
                    keyQuestionCallback: (value) {
                  WaveToast.show(value, context);
                }),
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
                WaveRichGridInfo.valueLastClickInfo(
                    '名称名称', '内容内容内容内容内容内容内容内容内容内容内容',
                    keyQuestionCallback: (value) {
                  WaveToast.show(value, context);
                }),
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
              pairInfoList: <WaveRichGridInfo>[
                WaveRichGridInfo("名称名称：", '内容内容内容内容'),
                WaveRichGridInfo.valueLastClickInfo(
                    "名称名称名称名称名称名称名称名称名称：", '内容内容内容内容内容内容内容内容内容内容内容'),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo("名称：", '内容'),
              ],
            ),
            Text(
              '异常案例：可点击内容过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveRichInfoGrid(
              pairInfoList: <WaveRichGridInfo>[
                WaveRichGridInfo("名称名称：", '内容内容内容内容'),
                WaveRichGridInfo.valueLastClickInfo("名称名称名", '内容内容内容',
                    clickTitle: '可点击内容可点击内容可点击内容',
                    valueQuestionCallback: (value) {
                  WaveToast.show(value, context);
                }),
                WaveRichGridInfo("名称：", '内容内容'),
                WaveRichGridInfo("名称：", '内容'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
