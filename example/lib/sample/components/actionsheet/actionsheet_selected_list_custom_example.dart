import 'package:waveui/waveui.dart';
import 'package:flutter/material.dart';

class SelectedListActionSheetCustomExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      SelectedListActionSheetCustomExamplePageState();
}

class SelectedListActionSheetCustomExamplePageState
    extends State<SelectedListActionSheetCustomExamplePage> {
  late WaveSelectedListActionSheetController controller;

  var _bottomActionKey = GlobalKey();
  List<String>? _data;

  @override
  void initState() {
    _data = ['数据源1', '数据源2', '数据源3', '数据源4'];

    controller = WaveSelectedListActionSheetController();

    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 要拦截 Android 的系统返回行为，请务必自行添加以下 WillPopScope 逻辑
    return WillPopScope(
      onWillPop: () async {
        if (!controller.isHidden) {
          controller.dismiss();
          return false;
        }
        return true;
      },
      child: Scaffold(
          appBar: WaveAppBar(
            title: '已选菜单列表',
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              WaveBottomButtonPanel(
                  key: _bottomActionKey,
                  mainButtonName: 'WaveBottomButtonPanel',
                  mainButtonOnTap: () {
                    WaveToast.show('确定！sheet 的数据源长度 ${_data!.length}', context);
                  },
                  iconButtonList: [
                    WaveVerticalIconButton(
                        name: '已选(${_data!.length})',
                        iconWidget: WaveUITools.getAssetImage(
                            'icons/grey_place_holder.png'),
                        onTap: () {
                          if (!controller.isHidden) {
                            controller.dismiss();
                          } else {
                            if (_data == null || _data!.length <= 0) {
                              WaveToast.show('数据为空，弹窗不展示', context);
                              return;
                            }
                            WaveSelectedListActionSheet<String>(
                                    context: context,
                                    isClearButtonHidden: false,
                                    isDeleteButtonHidden: true,
                                    items: _data!,
                                    bottomOffset: 82,
                                    maxHeight: 400,
                                    controller: controller,
                                    title: '自定义行视图例子',
                                    itemTitleBuilder: (int index, String? entity) {
                                      return Material(
                                        child: WaveStepInputFormItem(
                                          title: 'WaveStepInputFormItemWidget',
                                          subTitle: 'subtitle，可不传。最小值、最大值可自定义',
                                          minLimit: 0,
                                          maxLimit: 10,
                                          onChanged:
                                              (int oldValue, int newValue) {
                                            WaveToast.show(
                                                "onChanged 回调$oldValue ---- $newValue",
                                                context);
                                          },
                                        ),
                                      );
                                    },
                                    onClear: () {
                                      controller.dismiss();
                                      // 自定义清空的操作，可以不实现，会走默认的清空操作。
                                      WaveDialogManager.showConfirmDialog(
                                          context,
                                          title: "确定要清空已选列表吗?",
                                          cancel: '取消',
                                          confirm: '确定', onConfirm: () {
                                        setState(() {});
                                        _data!.clear();
                                      }, onCancel: () {});
                                    })
                                .showWithTargetKey(
                                    bottomWidgetKey: _bottomActionKey);
                          }
                        })
                  ]),
            ],
          )),
    );
  }
}
