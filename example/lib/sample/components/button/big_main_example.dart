import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class BigMainButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: '大主按钮',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WaveBigMainButton(
              title: "登录",
              bgColor: Colors.red,
              themeData: WaveButtonConfig(
                bigButtonRadius: 255,
                bigButtonHeight: 50,
                bigButtonFontSize: 20,
              ),
            ),
            Text(
              '规则',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveBubbleText(
              maxLines: 3,
              text: '按钮宽度为屏幕宽度，按钮的高度为48，按钮的背景色主题色，按钮的圆角为4。\n'
                  '按钮的文案最多居中显示一行，字号16号，文字颜色为白色。',
            ),
            Text(
              '正常案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveBigMainButton(
              title: '提交',
              onTap: () {
                WaveToast.show('点击了主按钮', context);
              },
            ),
            Text(
              '正常案例 不响应点击事件',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveBigMainButton(
              title: '提交',
            ),
            Text(
              '置灰案例',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            WaveBigMainButton(
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
            WaveBigMainButton(
              title: '主按钮的文案特别长主按钮的文案特别长主按钮的文案特别长主按钮的文案特别长',
              onTap: () {
                WaveToast.show('点击了主按钮', context);
              },
            ),
            WaveNormalButton(
              isEnable: false,
              alignment: Alignment.center,
              text: '主案特别长',
              onTap: () {
                WaveToast.show('点击了主按钮', context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
