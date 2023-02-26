import 'package:waveui/waveui.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';

class Setting extends StatelessWidget {
  GlobalKey _localKey = GlobalKey();
  GlobalKey _themeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WaveAppBar(
        title: '设置',
        leading: WaveBackLeading(),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            ListItem(
              key: _localKey,
              title: "Switch component entry language",
              describe:
                  "Only change the internal entry language of the component, and the Demo example part does not support it",
              isShowLine: false,
              onPressed: () {
                WavePopupListWindow.showPopListWindow(context, _localKey,
                    data: ['Chinese', 'English', 'German'],
                    onItemClick: (int index, item) {
                  switch (index) {
                    case 0:
                      WaveToast.showInCenter(
                          text:
                              "Switched to English entries (WaveResourceZh).\nNote: The default value passed in by the component will affect the entry display",
                          context: context);
                      ChangeLocalEvent.locale = Locale('zh', 'CN');
                      ChangeLocalEvent()..dispatch(context);
                      break;
                    case 1:
                      WaveToast.showInCenter(
                          text:
                              "Switched to English entries (WaveResourceEn).\nNote: The default value passed in by the component will affect the entry display",
                          context: context);
                      ChangeLocalEvent.locale = Locale('en', 'US');
                      ChangeLocalEvent()..dispatch(context);
                      break;
                    case 2:
                      WaveToast.showInCenter(
                          text:
                              "Switched to German entry (ResourceDe part).\nNote: The default value passed in by the component will affect the entry display",
                          context: context);
                      ChangeLocalEvent.locale = Locale('de', 'DE');
                      ChangeLocalEvent()..dispatch(context);
                      break;
                  }
                  return false;
                }, arrowOffset: 100);
              },
            ),
            ListItem(
              key: _themeKey,
              title: "Theme Custom Switch",
              describe:
                  "When switching to the Pad theme style, please select the Pad device to view",
              onPressed: () {
                WavePopupListWindow.showPopListWindow(context, _themeKey,
                    data: ['App theme style', 'Pad theme style'],
                    onItemClick: (int index, item) {
                  if (index == 0) {
                    WaveInitializer.register(
                        allThemeConfig:
                            WaveDefaultConfigUtils.defaultAllConfig);
                    WaveToast.showInCenter(
                        text: "Switched to App theme style", context: context);
                  } else {
                    WaveInitializer.register(
                        allThemeConfig: WavePadThemeConfig.allConfig);
                    WaveToast.showInCenter(
                        text: "Switched to Pad theme style", context: context);
                  }
                  return false;
                }, arrowOffset: 100);
              },
            ),
          ],
        ),
      ),
    );
  }
}
