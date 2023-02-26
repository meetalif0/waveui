import 'dart:convert';

import 'package:waveui/waveui.dart';
import 'package:example/sample/components/actionsheet/actionsheet_entry_page.dart';
import 'package:example/sample/components/appraise/appraise_example.dart';
import 'package:example/sample/components/bottom_tabbar/bottom_tabbar_example.dart';
import 'package:example/sample/components/button/bottom_button_entry_page.dart';
import 'package:example/sample/components/button/button_entry_page.dart';
import 'package:example/sample/components/button/button_panel_entry_page.dart';
import 'package:example/sample/components/button/icon_button_example.dart';
import 'package:example/sample/components/calendar/calendarview_example.dart';
import 'package:example/sample/components/card/wave_shadow_example.dart';
import 'package:example/sample/components/card/bubble/bubble_entry_page.dart';
import 'package:example/sample/components/card/content/text_content_entry_page.dart';
import 'package:example/sample/components/card_title/title_example.dart';
import 'package:example/sample/components/charts/chart_entry_example.dart';
import 'package:example/sample/components/charts/doughnut_chart_example.dart';
import 'package:example/sample/components/charts/line/wave_broken_line_example.dart';
import 'package:example/sample/components/charts/line/db_data_node_model.dart';
import 'package:example/sample/components/charts/progress_bar_chart_example.dart';
import 'package:example/sample/components/charts/progress_chart_entry_page.dart';
import 'package:example/sample/components/dialog/dialog_entry_page.dart';
import 'package:example/sample/components/empty/abnormal_entry_page.dart';
import 'package:example/sample/components/form/all_item_style_example.dart';
import 'package:example/sample/components/gallery/gallery_example.dart';
import 'package:example/sample/components/guide/guide_entry_page.dart';
import 'package:example/sample/components/input/input_example.dart';
import 'package:example/sample/components/line/dashed_line_example.dart';
import 'package:example/sample/components/loading/loading_widget_example.dart';
import 'package:example/sample/components/navbar/appbar_entry_page.dart';
import 'package:example/sample/components/noticebar/wave_notice_bar_example.dart';
import 'package:example/sample/components/picker/picker_entry_page.dart';
import 'package:example/sample/components/popup/popwindow_example.dart';
import 'package:example/sample/components/rating/rating_example.dart';
import 'package:example/sample/components/scroll_anchor/scroll_actor_tab_example.dart';
import 'package:example/sample/components/selection/selection_entry_page.dart';
import 'package:example/sample/components/step/step_example.dart';
import 'package:example/sample/components/sugsearch/search_text_example.dart';
import 'package:example/sample/components/switch/wave_switch_example.dart';
import 'package:example/sample/components/switch/checkbox_example.dart';
import 'package:example/sample/components/switch/radio_example.dart';
import 'package:example/sample/components/tabbar/wave_tab_example.dart';
import 'package:example/sample/components/tag/tag_example.dart';
import 'package:example/sample/components/toast/toast_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Card information
class GroupInfo {
  ///Unique ID
  int? groupId;

  ///Group name
  String groupName;

  ///describe
  String desc;

  ///Whether to expand
  bool isExpand;

  ///Can be customized
  bool isSupportTheme;

  ///Child Widget
  List<GroupInfo>? children;

  ///Jump to the next page
  Function(BuildContext context)? navigatorPage;

  GroupInfo(
      {this.groupId,
      this.groupName = "",
      this.desc = "",
      this.isExpand = false,
      this.navigatorPage,
      this.isSupportTheme = false,
      this.children});
}

///Data configuration class
class CardDataConfig {
  ///全部
  static List<GroupInfo> getAllGroup() {
    List<GroupInfo> list = [];
    list.add(_getChartGroup());
    list.add(_getDataInputGroup());
    list.add(_getOperateGroup());
    list.add(_getNavigatorGroup());
    list.add(_getButtonGroup());
    list.add(_getContentGroup());
    return list;
  }

  ///数据图表
  static GroupInfo _getChartGroup() {
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "BrokenLine 折线图 ",
        desc: "数据折线图",
        navigatorPage: (BuildContext context) {
          rootBundle.loadString('assets/brokenline_data.json').then((data) {
            var brokenData = <DBDataNodeModel>[]..addAll(
                ((JsonDecoder().convert(data) as List?) ?? [])
                    .map((o) => DBDataNodeModel.fromJson(o)));
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return BrokenLineExample(brokenData);
              },
            ));
          });
        }));
    children.add(GroupInfo(
        groupName: "Radar Radar Chart",
        desc: "Data Radar Chart",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return RadarChartExamplePage();
            },
          ));
        }));

    children.add(GroupInfo(
        groupName: "Funnel Funnel Chart",
        desc: "Data Funnel Chart",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return FunnelChartExamplePage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Doughnut Donut",
        desc: "Ring chart",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return DoughnutChartExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Progress",
        desc: "Progress Chart",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ProgressChartExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "ProgressBar histogram",
        desc: "Histogram",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ProgressBarChartExample();
            },
          ));
        }));
    return GroupInfo(
        groupName: "Data Chart", children: children, isExpand: true);
  }

  ///Data Entry
  static GroupInfo _getDataInputGroup() {
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "Form form item",
        desc: "Various form items",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return AllFormItemStyleExamplePage("Form item type example");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Picker",
        desc: "Select popup",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return PickerEntryPage("Picker example");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Appraise Evaluation",
        desc: "Emoji and star evaluation components",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return AppraiseExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Input dynamic input box",
        desc: "Automatically input dynamic calculation height",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return WaveInputTextExample();
            },
          ));
        }));
    return GroupInfo(
        groupName: "Data Entry", children: children, isExpand: false);
  }

  ///Operation feedback class
  static GroupInfo _getOperateGroup() {
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "Dialog Popup",
        desc: "Dialog display of various types",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return DialogEntryPage("Dialog type example");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "ActionSheet bottom menu",
        desc: "Bottom Action Popup",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ActionSheetEntryPage("ActionSheet example");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Tips",
        desc: "A prompt pops up at the specified position",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return PopWindowExamplePage("Tips example");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Toast Toast",
        desc: "Page Toast",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ToastExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Loading 加载框",
        desc: "页面loading",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return LoadingExample();
            },
          ));
        }));
    return GroupInfo(
        groupName: "Operation Feedback", children: children, isExpand: false);
  }

  /// 导航类
  static GroupInfo _getNavigatorGroup() {
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "Appbar Navigation Bar",
        desc: "Appbar Navigation Bar",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return AppbarEntryPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Search Search",
        desc: "For search only",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return SearchTextExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Tabs 切换",
        desc: "tab",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return WaveTabExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "BottomTabBar 底部导航",
        desc: "Bottom Navigation",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BottomTabbarExample();
          }));
        }));
    children.add(GroupInfo(
        groupName: "Selection filter",
        desc: "Filter Item + Filter Drawer",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return SelectionEntryPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "CitySelection 城市选择",
        desc: "城市选择",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return _buildSingleSelectCityPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Anchor anchor",
        desc: "Anchor Tab sliding instance",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ScrollActorTabExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Guide",
        desc: "Strong Guide & Weak Guide",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return GuideEntryPage();
            },
          ));
        }));
    return GroupInfo(groupName: "Navigation", children: children);
  }

  ///button
  static GroupInfo _getButtonGroup() {
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "NormalButton normal button",
        desc: "Primary button, secondary button, button set",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ButtonEntryPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "BottomButtonPanel 吸底按钮",
        desc: "吸底按钮集合",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return BottomButtonEntryWidget();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "ButtonPanel button collection",
        desc: "Button Collection",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ButtonPanelEntryPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "IconButton graphic button",
        desc: "Arbitrarily combined button and picture",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return WaveIconBtnExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Radio 单选按钮",
        desc: "单选按钮",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return RadioExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Checkbox multiple choice button",
        desc: "Multiple Choice Button",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return CheckboxExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "SwitchButton normal button",
        desc: "Switch button",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return WaveSwitchButtonExample();
            },
          ));
        }));
    return GroupInfo(groupName: "Button", children: children, isExpand: false);
  }

  ///content
  static GroupInfo _getContentGroup() {
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "Tag label",
        desc: "Various styles of labels",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return TagExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "RatingBar 星级",
        desc: "星级评分条",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return RatingExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "DashedLine Dashed Line",
        desc: "Custom dashed line",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return DashedLineExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "ShadowCard Shadow Card",
        desc: "WaveShadowCard",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return WaveShadowExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Title Title",
        desc: "Examples of various titles",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return TitleExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "AbnormalCard abnormal card",
        desc: "Multiple abnormal page display",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return AbnormalStatesEntryPage("Example of abnormal page");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Bubble",
        desc: "Normal Bubbles & Expandable Bubbles",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return BubbleEntryPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "StepBar step bar",
        desc: "horizontal & vertical step bar",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return StepExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Notification",
        desc: "Various notification styles, support setting icons and colors",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return WaveNoticeBarExample();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Text Text Content",
        desc: "Multi-style text content",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return TextContentEntryPage();
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Calendar Calendar",
        desc: "Calendar Component",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return CalendarViewExample("Calendar Component");
            },
          ));
        }));
    children.add(GroupInfo(
        groupName: "Gallery Pictures",
        desc: "Picture Selection & Picture View",
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return GalleryExample();
            },
          ));
        }));
    return GroupInfo(groupName: "Content", children: children);
  }

  ///city selection
  static Widget _buildSingleSelectCityPage() {
    List<WaveSelectCityModel> hotCityList = [];
    hotCityList.addAll([
      WaveSelectCityModel(name: "Beijing"),
      WaveSelectCityModel(name: "Guangzhou City"),
      WaveSelectCityModel(name: "Chengdu"),
      WaveSelectCityModel(name: "Shenzhen"),
      WaveSelectCityModel(name: "Hangzhou City"),
      WaveSelectCityModel(name: "Wuhan City"),
    ]);
    return WaveSingleSelectCityPage(
      appBarTitle: 'City Radio',
      hotCityTitle: 'Here is the recommended city',
      hotCityList: hotCityList,
    );
  }
}
