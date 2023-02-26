import 'dart:convert';

import 'package:waveui/waveui.dart';
import 'package:example/sample/components/selection/selectionview_custom_floating_layer_example.dart';
import 'package:example/sample/components/selection/selectionview_customhandle_filter_example_page.dart';
import 'package:example/sample/components/selection/selectionview_customview_example_page.dart';
import 'package:example/sample/components/selection/selectionview_date_range_example_page.dart';
import 'package:example/sample/components/selection/selectionview_limit_max_selected_count_example.dart';
import 'package:example/sample/home/list_item.dart';
import 'package:example/sample/components/selection/selection_flat_entry_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'filter_entity.dart';
import 'selectionview_simple_single_list_example_page.dart';
import 'selectionview_simple_multi_check_example_page.dart';
import 'selectionview_interceptor_example.dart';
import 'selectionview_more_filter_example_page.dart';
import 'selectionview_multi_list_example_page.dart';
import 'selectionview_multi_range_example_page.dart';

class SelectionEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WaveAppBar(
          title: 'Selection 示例',
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Text(
                "WaveSelectionView 组件：",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.purple),
              ),
            ),
            Divider(indent: 15),
            ListItem(
              title: "简单筛选示例-单列单选",
              isShowLine: false,
              onPressed: () {
                rootBundle
                    .loadString('assets/multi_list_filter.json')
                    .then((data) {
                  var datas = WaveFilterEntity.fromJson(
                      JsonDecoder().convert(data)["data"]['list'][0]);
                  var page = SelectionViewSimpleSingleListExamplePage(
                      "简单筛选示例-单列单选", datas);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return page;
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "简单筛选示例-单列多选",
              onPressed: () {
                rootBundle
                    .loadString('assets/multi_list_filter.json')
                    .then((data) {
                  var datas = WaveFilterEntity.fromJson(
                      JsonDecoder().convert(data)["data"]['list'][0]);
                  var page = SelectionViewSimpleMultiCheckExamplePage(
                      "简单筛选示例-单列多选", datas);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return page;
                    },
                  ));
                });
              },
            ),
            WaveLine(
              height: 10,
            ),
            ListItem(
              title: "一列、两列、三列情况",
              isSupportTheme: true,
              isShowLine: false,
              describe: "筛选项",
              onPressed: () {
                rootBundle
                    .loadString('assets/multi_list_filter.json')
                    .then((data) {
                  var page = SelectionViewMultiListExamplePage(
                      "SelectionView示例(一列、两列、三列情况)",
                      WaveSelectionEntityListBean.fromJson(
                              JsonDecoder().convert(data)["data"])!
                          .list);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return page;
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "一个 Range, 两个 Range 时 Tag 样式展示情",
              isSupportTheme: true,
              describe: "筛选项",
              onPressed: () {
                rootBundle
                    .loadString('assets/multi_range_filter.json')
                    .then((data) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SelectionViewMultiRangeExamplePage(
                          "一个 Range, 两个 Range 时 Tag 展示情",
                          WaveSelectionEntityListBean.fromJson(
                                  JsonDecoder().convert(data)["data"])!
                              .list);
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "更多筛选",
              isSupportTheme: true,
              describe: "筛选项",
              onPressed: () {
                rootBundle.loadString('assets/more_filter.json').then((data) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SelectionViewMoreFilterExamplePage(
                          "更多筛选",
                          WaveSelectionEntityListBean.fromJson(
                                  JsonDecoder().convert(data)["data"])!
                              .list);
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "日期、日期范围选择",
              isSupportTheme: true,
              describe: "筛选项",
              onPressed: () {
                rootBundle
                    .loadString('assets/date_range_filter.json')
                    .then((data) {
                  var page = SelectionViewDateRangeExamplePage(
                      "日期、日期范围选择",
                      WaveSelectionEntityListBean.fromJson(
                              JsonDecoder().convert(data)["data"])!
                          .list);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return page;
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "customHandle 类型筛选，自定义拦截，设置参数",
              isSupportTheme: true,
              describe: "筛选项",
              onPressed: () {
                rootBundle
                    .loadString('assets/customhandle_filter.json')
                    .then((data) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SelectionViewCustomHandleFilterExamplePage(
                          "customHandle 类型筛选，自定义拦截，设置参数",
                          WaveSelectionEntityListBean.fromJson(
                                  JsonDecoder().convert(data)["data"])!
                              .list);
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "自定义筛选弹出 View",
              describe: "筛选项",
              onPressed: () {
                rootBundle
                    .loadString('assets/customview_filter.json')
                    .then((data) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return SelectionViewCustomViewExamplePage(
                        "自定义筛选弹出 View",
                        WaveSelectionEntityListBean.fromJson(
                                JsonDecoder().convert(data)["data"])!
                            .list);
                  }));
                });
              },
            ),
            ListItem(
              title: "手动关闭弹窗、拦截弹出的情况",
              isSupportTheme: true,
              describe: "筛选项",
              onPressed: () {
                rootBundle
                    .loadString('assets/multi_list_filter.json')
                    .then((data) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SelectionViewCloseOrInterceptorExamplePage(
                          "新SelectionView示例(手动关闭的情况)",
                          WaveSelectionEntityListBean.fromJson(
                                  JsonDecoder().convert(data)["data"])!
                              .list);
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "限制选择最大数量",
              isSupportTheme: true,
              describe: "限制选择最大数量",
              onPressed: () {
                rootBundle
                    .loadString('assets/list_filter_maxcount_test.json')
                    .then((data) {
                  var datas = WaveSelectionEntityListBean.fromJson(
                          JsonDecoder().convert(data)["data"])!
                      .list!;
                  datas.removeAt(0);
                  datas.removeAt(1);
                  void _configMaxSelectedCount(
                      WaveSelectionEntity entity, int maxCount) {
                    entity.maxSelectedCount = maxCount;
                    if (entity.children.length > 0) {
                      for (WaveSelectionEntity child in entity.children) {
                        _configMaxSelectedCount(child, maxCount);
                      }
                    }
                  }

                  _configMaxSelectedCount(datas[0], 5);
                  var page = SelectionViewLimitMaxSelectedCountExamplePage(
                      "限制选择最大数量", datas);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return page;
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "更多筛选-跳转自定义二级页面",
              isSupportTheme: true,
              onPressed: () {
                rootBundle
                    .loadString('assets/more_custom_floating_layer_filter.json')
                    .then((data) {
                  List<WaveSelectionEntity>? datas =
                      WaveSelectionEntityListBean.fromJson(
                              JsonDecoder().convert(data)["data"])!
                          .list;
                  var page = SelectionViewMoreCustomFloatLayerExamplePage(
                      "更多筛选-跳转自定义二级页面", datas);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return page;
                    },
                  ));
                });
              },
            ),
            ListItem(
              title: "新筛选示例(更多里面抽出平级筛选)",
              isSupportTheme: true,
              describe: "筛选项",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return FlatSelectionEntryPage();
                  },
                ));
              },
            ),
          ],
        ));
  }
}
