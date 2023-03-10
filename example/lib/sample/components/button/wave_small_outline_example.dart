import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class WaveSmallOutlineButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: '小边框按钮',
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
              ),
            ),
            WaveBubbleText(
              maxLines: 3,
              text: '按钮的最小宽度为84，按钮的高度为32，按钮的背景色白色，按钮的圆角为2。左右边距8\n'
                  '按钮的文案最多居中显示一行，字号14号，文字颜色为222222。',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: WaveSmallOutlineButton(
                      title: '提交',
                      onTap: () {
                        WaveToast.show('点击了按钮', context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Expanded(
                    child: WaveSmallOutlineButton(
                      title: '提交',
                      onTap: () {
                        WaveToast.show('点击了按钮', context);
                      },
                    ),
                  )
                ],
              ),
            ),
            WaveSmallOutlineButton(
              title: '提交',
              onTap: () {
                WaveToast.show('点击了按钮', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveSmallOutlineButton(
              title: '提交提交',
              onTap: () {
                WaveToast.show('点击了按钮', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveSmallOutlineButton(
              lineColor: Colors.red,
              textColor: Colors.red,
              title: '驳回',
              onTap: () {
                WaveToast.show('点击了按钮', context);
              },
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveSmallOutlineButton(
              title: '提交提交提交',
              onTap: () {
                WaveToast.show('点击了按钮', context);
              },
            ),
            Text(
              '置灰案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveSmallOutlineButton(
              title: '提交',
              isEnable: false,
              onTap: () {
                WaveToast.show('点击了主按钮', context);
              },
            ),
            Text(
              '文案过长',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveSmallOutlineButton(
              title: '按钮的文案特别长按钮的文案特别长按钮的文案特别长按钮的文案特别长',
              onTap: () {
                WaveToast.show('点击了按钮', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
