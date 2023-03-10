import 'dart:ui';

import 'package:waveui/src/components/button/wave_big_main_button.dart';
import 'package:waveui/src/components/calendar/wave_calendar_view.dart';
import 'package:waveui/src/components/line/wave_line.dart';
import 'package:waveui/src/components/picker/time_picker/wave_date_time_formatter.dart';
import 'package:waveui/src/components/selection/bean/wave_selection_common_entity.dart';
import 'package:waveui/src/components/selection/wave_selection_util.dart';
import 'package:waveui/src/components/selection/widget/wave_selection_date_range_item_widget.dart';
import 'package:waveui/src/components/selection/widget/wave_selection_menu_widget.dart';
import 'package:waveui/src/components/selection/widget/wave_selection_range_input_item_widget.dart';
import 'package:waveui/src/components/selection/widget/wave_selection_range_tag_widget.dart';
import 'package:waveui/src/components/tabbar/normal/wave_tab_bar.dart';
import 'package:waveui/src/components/toast/wave_toast.dart';
import 'package:waveui/src/constants/wave_asset_constants.dart';
import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:waveui/src/theme/configs/wave_selection_config.dart';
import 'package:waveui/src/utils/wave_event_bus.dart';
import 'package:waveui/src/utils/wave_text_util.dart';
import 'package:waveui/src/utils/wave_tools.dart';
import 'package:flutter/material.dart';

class WaveRangeSelectionGroupWidget extends StatefulWidget {
  static final double screenWidth =
      window.physicalSize.width / window.devicePixelRatio;

  final WaveSelectionEntity entity;
  final double maxContentHeight;
  final bool showSelectedCount;
  final VoidCallback? bgClickFunction;
  final WaveOnRangeSelectionConfirm? onSelectionConfirm;

  final int? rowCount;

  final double marginTop;

  final WaveSelectionConfig themeData;

  WaveRangeSelectionGroupWidget(
      {Key? key,
      required this.entity,
      this.maxContentHeight = DESIGN_SELECTION_HEIGHT,
      this.rowCount,
      this.showSelectedCount = false,
      this.bgClickFunction,
      this.onSelectionConfirm,
      this.marginTop = 0,
      required this.themeData})
      : super(key: key);

  @override
  _WaveRangeSelectionGroupWidgetState createState() =>
      _WaveRangeSelectionGroupWidgetState();
}

class _WaveRangeSelectionGroupWidgetState
    extends State<WaveRangeSelectionGroupWidget>
    with SingleTickerProviderStateMixin {
  List<WaveSelectionEntity> _originalSelectedItemsList = [];
  List<WaveSelectionEntity> _firstList = [];
  List<WaveSelectionEntity> _secondList = [];
  int _firstIndex = -1;
  int _secondIndex = -1;
  int totalLevel = 0;

  late TabController _tabController;

  TextEditingController _minTextEditingController = TextEditingController();
  TextEditingController _maxTextEditingController = TextEditingController();

  bool _isConfirmClick = false;

  @override
  void initState() {
    _initData();
    _tabController = TabController(vsync: this, length: _firstList.length);
    if (_firstIndex >= 0) {
      _tabController.index = _firstIndex;
    }
    _tabController.addListener(() {
      _clearAllSelectedItems();
      _clearNotTagItem(totalLevel == 1
          ? _firstList
          : _firstList[_tabController.index].children);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    if (!_isConfirmClick) {
      _resetSelectionDatas(widget.entity);
      _clearNotTagItem(totalLevel == 1
          ? _firstList
          : _firstList[_tabController.index].children);
      _resetCustomMapData();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    totalLevel = WaveSelectionUtil.getTotalLevel(widget.entity);
    return GestureDetector(
      onTap: () {
        _backgroundTap();
      },
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onTap: () {},
          child: Column(
            children: _configWidgets(),
          ),
        ),
      ),
    );
  }

  //pragma mark -- config widgets

  List<Widget> _configWidgets() {
    List<Widget> widgetList = [];
    widgetList.add(_listWidget());
    return widgetList;
  }

  Widget _listWidget() {
    Widget? rangeWidget;

    if (_firstList.isNotEmpty && _secondList.isEmpty) {
      /// 1????????????????????????
      /// 1.2 ???????????? || ??????????????????????????????
      rangeWidget = _createNewTagAndRangeWidget(_firstList, Colors.white);
    } else if (_firstList.isNotEmpty && _secondList.isNotEmpty) {
      /// 2?????????????????????
      rangeWidget = _createNewTagAndRangeWidget(_firstList, Colors.white);
    }

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      constraints: _hasCalendarItem(widget.entity)
          ? BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.bottom -
                  widget.marginTop)
          : BoxConstraints(
              maxHeight: widget.maxContentHeight + DESIGN_BOTTOM_HEIGHT),
      child: rangeWidget,
    );
  }

  Widget _createNewTagAndRangeWidget(
      List<WaveSelectionEntity> firstList, Color white) {
    if (firstList.isNotEmpty &&
        WaveSelectionUtil.getTotalLevel(widget.entity) == 1) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: _getOneTabContent(widget.entity)),
            ),
          ),
          WaveLine(
            height: 0.5,
          ),
          _bottomWidget()
        ],
      );
    } else if (firstList.isNotEmpty &&
        WaveSelectionUtil.getTotalLevel(widget.entity) == 2) {
      var tabBar = WaveTabBar(
        tabHeight: 50,
        controller: _tabController,
        tabs: firstList.map((f) => BadgeTab(text: f.title)).toList(),
      );
      var tabContent = SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: _getOneTabContent(firstList[_tabController.index])));

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          tabBar,
          Flexible(
            child: tabContent,
          ),
          WaveLine(
            height: 0.5,
          ),
          _bottomWidget()
        ],
      );
    } else {
      return Container();
    }
  }

  List<Widget> _getOneTabContent(WaveSelectionEntity filterItem) {
    List<WaveSelectionEntity> subFilterList = filterItem.children;

    /// TODO ???????????? Date  DateRange ??????????????????
    List<WaveSelectionEntity> tagFilterList = subFilterList
        .where((f) =>
            f.filterType != WaveSelectionFilterType.range &&
            f.filterType != WaveSelectionFilterType.date &&
            f.filterType != WaveSelectionFilterType.dateRange &&
            f.filterType != WaveSelectionFilterType.dateRangeCalendar)
        .toList();
    Size maxWidthSize = Size.zero;
    for (WaveSelectionEntity entity in subFilterList) {
      Size size = WaveTextUtil.textSize(entity.title,
          widget.themeData.tagNormalTextStyle.generateTextStyle());
      if (maxWidthSize.width < size.width) {
        maxWidthSize = size;
      }
    }

    int tagWidth;

    ///??????????????????????????????????????????????????????????????????????????????????????????????????????
    if (widget.rowCount == null) {
      int oneCountTagWidth =
          (WaveRangeSelectionGroupWidget.screenWidth - 40 - 12 * (1 - 1)) ~/ 1;
      int twoCountTagWidth =
          (WaveRangeSelectionGroupWidget.screenWidth - 40 - 12 * (2 - 1)) ~/ 2;
      int threeCountTagWidth =
          (WaveRangeSelectionGroupWidget.screenWidth - 40 - 12 * (3 - 1)) ~/ 3;
      int fourCountTagWidth =
          (WaveRangeSelectionGroupWidget.screenWidth - 40 - 12 * (4 - 1)) ~/ 4;
      if (maxWidthSize.width > twoCountTagWidth) {
        tagWidth = oneCountTagWidth;
      } else if (threeCountTagWidth < maxWidthSize.width &&
          maxWidthSize.width <= twoCountTagWidth) {
        tagWidth = twoCountTagWidth;
      } else if (fourCountTagWidth < maxWidthSize.width &&
          maxWidthSize.width <= threeCountTagWidth) {
        tagWidth = threeCountTagWidth;
      } else {
        tagWidth = fourCountTagWidth;
      }
    } else {
      tagWidth = (WaveRangeSelectionGroupWidget.screenWidth -
              40 -
              12 * (widget.rowCount! - 1)) ~/
          widget.rowCount!;
    }

    var tagContainer = tagFilterList.isNotEmpty
        ? Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: WaveSelectionRangeTagWidget(
                tagWidth: tagWidth,
                tagFilterList: tagFilterList,
                initFocusedIndex: _getInitFocusedIndex(subFilterList),
                themeData: widget.themeData,
                onSelect: (index, isSelected) {
                  setState(() {
                    _setFirstIndex(_tabController.index);
                    _setSecondIndex(index);
                    _clearNotTagItem(totalLevel == 1
                        ? _firstList
                        : _firstList[_tabController.index].children);
                    _clearEditRangeText();
                  });
                }),
          )
        : Container();

    Widget? content;
    for (WaveSelectionEntity item in subFilterList) {
      if (item.filterType == WaveSelectionFilterType.range) {
        content = WaveSelectionRangeItemWidget(
            item: item,
            minTextEditingController: _minTextEditingController,
            maxTextEditingController: _maxTextEditingController,
            themeData: widget.themeData,
            onFocusChanged: (bool focus) {
              item.isSelected = focus;
              if (focus) {
                setState(() {
                  _clearTagSelectStatus(subFilterList);
                });
              }
            });
        break;
      } else if (item.filterType == WaveSelectionFilterType.dateRange) {
        content = WaveSelectionDateRangeItemWidget(
            item: item,
            minTextEditingController: _minTextEditingController,
            maxTextEditingController: _maxTextEditingController,
            themeData: widget.themeData,
            onTapped: () {
              setState(() {
                _clearTagSelectStatus(subFilterList);
              });
            });
        break;
      } else if (item.filterType == WaveSelectionFilterType.date) {
        DateTime? initialStartDate =
            DateTimeFormatter.convertIntValueToDateTime(item.value);
        DateTime? initialEndDate =
            DateTimeFormatter.convertIntValueToDateTime(item.value);
        content = WaveCalendarView.single(
          key: GlobalKey(),
          initStartSelectedDate: initialStartDate,
          initEndSelectedDate: initialEndDate,
          initDisplayDate: initialEndDate,
          dateChange: (DateTime date) {
            item.value = date.millisecondsSinceEpoch.toString();
            item.isSelected = true;
            setState(() {
              _clearTagSelectStatus(subFilterList);
            });
          },
        );
      } else if (item.filterType == WaveSelectionFilterType.dateRangeCalendar) {
        DateTime? initialStartDate = item.customMap == null
            ? null
            : DateTimeFormatter.convertIntValueToDateTime(
                item.customMap!['min']);
        DateTime? initialEndDate = item.customMap == null
            ? null
            : DateTimeFormatter.convertIntValueToDateTime(
                item.customMap!['max']);
        content = WaveCalendarView.range(
          key: GlobalKey(),
          initStartSelectedDate: initialStartDate,
          initEndSelectedDate: initialEndDate,
          rangeDateChange: (DateTimeRange range) {
            item.customMap = {};
            item.customMap = {
              'min': range.start.millisecondsSinceEpoch.toString(),
              'max': range.end.millisecondsSinceEpoch.toString()
            };
            item.isSelected = true;
            setState(() {
              _clearTagSelectStatus(subFilterList);
            });
          },
        );
      }
    }
    var widgets = <Widget>[tagContainer];
    if (content != null) {
      widgets.add(content);
    }
    return widgets;
  }

  Widget _bottomWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(8, 11, 20, 11),
      child: Row(
        children: <Widget>[
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 24,
                    width: 24,
                    child:
                        WaveUITools.getAssetImage(WaveAsset.iconSelectionReset),
                  ),
                  Text(
                    WaveIntl.of(context).localizedResource.reset,
                    style: widget.themeData.resetTextStyle.generateTextStyle(),
                  )
                ],
              ),
            ),
            onTap: _clearAllSelectedItems,
          ),
          Expanded(
            child: WaveBigMainButton(
              title: WaveIntl.of(context).localizedResource.ok,
              onTap: () {
                _confirmButtonClickEvent();
              },
            ),
          )
        ],
      ),
    );
  }

  //pragma mark -- event responder

  /// ???????????????????????????????????????
  ///
  void _confirmButtonClickEvent() {
    _isConfirmClick = true;

    if (totalLevel == 2) {
      List<WaveSelectionEntity> subFilterList =
          widget.entity.children[_tabController.index].children;
      List<WaveSelectionEntity> selectItems =
          subFilterList.where((f) => f.isSelected).toList();
      if (selectItems.isNotEmpty) {
        _firstList[_tabController.index].isSelected = true;
      } else {
        _firstList[_tabController.index].isSelected = false;
      }
    }

    // ??????Range???????????????
    WaveSelectionEntity? rangeEntity = _getSelectRangeItem(totalLevel == 1
        ? _firstList
        : _firstList[_tabController.index].children);
    if (rangeEntity != null) {
      if (rangeEntity.customMap != null &&
          (!WaveUITools.isEmpty(rangeEntity.customMap!['min']) ||
              !WaveUITools.isEmpty(rangeEntity.customMap!['max']))) {
        if (!rangeEntity.isValidRange()) {
          FocusScope.of(context).requestFocus(FocusNode());
          if (rangeEntity.filterType == WaveSelectionFilterType.range) {
            WaveToast.show(
                WaveIntl.of(context).localizedResource.enterRangeError,
                context);
          } else if (rangeEntity.filterType ==
                  WaveSelectionFilterType.dateRange ||
              rangeEntity.filterType ==
                  WaveSelectionFilterType.dateRangeCalendar) {
            WaveToast.show(
                WaveIntl.of(context).localizedResource.selectRangeError,
                context);
          }
          return;
        }
      } else {
        rangeEntity.isSelected = false;
      }
    }

    if (widget.onSelectionConfirm != null) {
      widget.onSelectionConfirm!(widget.entity, _firstIndex, _secondIndex, -1);
    }
  }

  void _clearAllSelectedItems() {
    _resetSelectionDatas(widget.entity);
    _clearNotTagItem(totalLevel == 1
        ? _firstList
        : _firstList[_tabController.index].children);
    _clearEditRangeText();
    setState(() {
      _configDefaultInitSelectIndex();
      _refreshDataSource();
    });
  }

  // ???????????????
  void _initData() {
    // ?????????????????????
    _originalSelectedItemsList = widget.entity.selectedList();
    for (WaveSelectionEntity entity in _originalSelectedItemsList) {
      entity.isSelected = true;
      if (entity.customMap != null) {
        entity.originalCustomMap = Map.from(entity.customMap!);
      }
    }
    // ???????????????????????? index ??? -1???????????????
    _configDefaultInitSelectIndex();
    // ???????????????????????????????????????index
    _configDefaultSelectedData();
    // ?????????????????????index???????????????
    _refreshDataSource();
  }

  // ?????????????????????????????????????????????index
  void _configDefaultInitSelectIndex() {
    _firstIndex = _secondIndex = -1;
  }

  void _setFirstIndex(int firstIndex) {
    _firstIndex = firstIndex;
    _secondIndex = -1;
    if (widget.entity.children.length > _firstIndex) {
      List<WaveSelectionEntity> seconds =
          widget.entity.children[_firstIndex].children;
      if (seconds.isNotEmpty) {
        for (WaveSelectionEntity entity in seconds) {
          if (entity.isSelected) {
            _setSecondIndex(seconds.indexOf(entity));
            break;
          }
        }
      }
    }
    setState(() {
      _refreshDataSource();
    });
  }

  void _setSecondIndex(int secondIndex) {
    _secondIndex = secondIndex;
    setState(() {
      _refreshDataSource();
    });
  }

  // ??????3???ListView????????????
  void _refreshDataSource() {
    _firstList = widget.entity.children;
    if (_firstIndex >= 0 && _firstList.length > _firstIndex) {
      _secondList = _firstList[_firstIndex].children;
    } else {
      _secondList = [];
    }
  }

  void _configDefaultSelectedData() {
    _firstList = widget.entity.children;
    //??????????????????item?????????????????????
    if (_firstList.isEmpty) {
      _secondIndex = -1;
      _secondList = [];
      return;
    }
    for (WaveSelectionEntity entity in _firstList) {
      if (entity.isSelected) {
        _firstIndex = _firstList.indexOf(entity);
        break;
      }
    }

    if (_firstIndex >= 0 && _firstIndex < _firstList.length) {
      _secondList = _firstList[_firstIndex].children;
      if (_secondList.isNotEmpty) {
        for (WaveSelectionEntity entity in _secondList) {
          if (entity.isSelected) {
            _secondIndex = _secondList.indexOf(entity);
            break;
          }
        }
      }
    }
  }

  //??????????????????????????????
  void _resetSelectionDatas(WaveSelectionEntity entity) {
    entity.isSelected = false;
    entity.customMap = Map();
    for (WaveSelectionEntity subEntity in entity.children) {
      _resetSelectionDatas(subEntity);
    }
  }

  void _clearNotTagItem(List<WaveSelectionEntity> subFilterList) {
    subFilterList
        .where((f) =>
            f.filterType == WaveSelectionFilterType.range ||
            f.filterType == WaveSelectionFilterType.date ||
            f.filterType == WaveSelectionFilterType.dateRange ||
            f.filterType == WaveSelectionFilterType.dateRangeCalendar)
        .forEach((f) {
      f.isSelected = false;
      f.customMap = Map();
      f.value = null;
    });
  }

  void _clearEditRangeText() {
    _minTextEditingController.text = "";
    _maxTextEditingController.text = "";
    EventBus.instance.fire(ClearSelectionFocusEvent());
  }

  void _clearTagSelectStatus(List<WaveSelectionEntity> subFilterList) {
    subFilterList
        .where((f) => f.filterType != WaveSelectionFilterType.range)
        .where((f) => f.filterType != WaveSelectionFilterType.date)
        .where((f) => f.filterType != WaveSelectionFilterType.dateRange)
        .where((f) => f.filterType != WaveSelectionFilterType.dateRangeCalendar)
        .forEach((f) {
      f.isSelected = false;
      f.customMap = Map();
    });
  }

  /// ???????????? Range ????????????value ????????? DateRange???DateRangeCalendar ???????????????????????????????????????????????????????????????????????????????????????
  WaveSelectionEntity? _getSelectRangeItem(
      List<WaveSelectionEntity> filterList) {
    List<WaveSelectionEntity> ranges = filterList
        .where((f) =>
            (f.filterType == WaveSelectionFilterType.range ||
                f.filterType == WaveSelectionFilterType.dateRange ||
                f.filterType == WaveSelectionFilterType.dateRangeCalendar) &&
            f.isSelected)
        .toList();

    if (ranges.isNotEmpty) {
      return ranges[0];
    }
    return null;
  }

  void _backgroundTap() {
    _resetSelectStatus();
    if (widget.bgClickFunction != null) {
      widget.bgClickFunction!();
    }
  }

  void _resetSelectStatus() {
    _clearAllSelectedItems();
    _resetCustomMapData();
  }

  ///????????????
  void _resetCustomMapData() {
    for (WaveSelectionEntity commonEntity in _originalSelectedItemsList) {
      commonEntity.isSelected = true;
      commonEntity.customMap = Map.from(commonEntity.originalCustomMap);
    }
  }

  /// ???????????????????????????????????????????????????????????????????????????????????????????????? Tag???
  int _getInitFocusedIndex(List<WaveSelectionEntity> subFilterList) {
    bool isCustomInputSelected = false;
    for (WaveSelectionEntity entity in subFilterList) {
      if (WaveSelectionFilterType.range == entity.filterType ||
          WaveSelectionFilterType.dateRange == entity.filterType ||
          WaveSelectionFilterType.dateRangeCalendar == entity.filterType) {
        isCustomInputSelected = entity.isSelected;
        break;
      }
    }

    var selectedItem = subFilterList
        .where((f) =>
            f.filterType != WaveSelectionFilterType.range &&
            f.filterType != WaveSelectionFilterType.dateRange &&
            f.filterType != WaveSelectionFilterType.dateRangeCalendar &&
            f.isSelected)
        .toList();
    if (!isCustomInputSelected && WaveUITools.isEmpty(selectedItem)) {
      for (WaveSelectionEntity item in subFilterList) {
        if (item.isUnLimit()) {
          return subFilterList.indexOf(item);
        }
      }
    }

    return -1;
  }

  bool _hasCalendarItem(WaveSelectionEntity entity) {
    bool hasCalendarItem = false;
    hasCalendarItem = entity.children
        .where((_) =>
            _.filterType == WaveSelectionFilterType.date ||
            _.filterType == WaveSelectionFilterType.dateRangeCalendar)
        .toList()
        .isNotEmpty;

    /// ??????????????????
    if (!hasCalendarItem) {
      for (WaveSelectionEntity subItem in entity.children) {
        int count = subItem.children
            .where((_) =>
                _.filterType == WaveSelectionFilterType.date ||
                _.filterType == WaveSelectionFilterType.dateRangeCalendar)
            .toList()
            .length;
        if (count > 0) {
          hasCalendarItem = true;
          break;
        }
      }
    }
    return hasCalendarItem;
  }
}
