import 'dart:math';

import 'package:waveui/src/components/button/wave_big_main_button.dart';
import 'package:waveui/src/components/selection/bean/wave_selection_common_entity.dart';
import 'package:waveui/src/components/selection/wave_selection_util.dart';
import 'package:waveui/src/components/selection/widget/wave_selection_menu_widget.dart';
import 'package:waveui/src/components/selection/widget/wave_selection_single_list_widget.dart';
import 'package:waveui/src/constants/wave_asset_constants.dart';
import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:waveui/src/theme/configs/wave_selection_config.dart';
import 'package:waveui/src/utils/wave_tools.dart';
import 'package:flutter/material.dart';

typedef SingleListItemSelect = void Function(
    int listIndex, int index, WaveSelectionEntity entity);

// ignore: must_be_immutable
class WaveListSelectionGroupWidget extends StatefulWidget {
  final WaveSelectionEntity entity;
  final double maxContentHeight;
  final bool showSelectedCount;
  final VoidCallback? bgClickFunction;
  final WaveOnRangeSelectionConfirm? onSelectionConfirm;
  WaveSelectionConfig themeData;

  WaveListSelectionGroupWidget({
    Key? key,
    required this.entity,
    this.maxContentHeight = DESIGN_SELECTION_HEIGHT,
    this.showSelectedCount = false,
    this.bgClickFunction,
    this.onSelectionConfirm,
    required this.themeData,
  }) : super(key: key);

  @override
  _WaveSelectionGroupViewState createState() => _WaveSelectionGroupViewState();
}

class _WaveSelectionGroupViewState extends State<WaveListSelectionGroupWidget> {
  final int maxShowCount = 6;

  List<WaveSelectionEntity> _firstList = [];
  List<WaveSelectionEntity> _secondList = [];
  List<WaveSelectionEntity> _thirdList = [];
  List<WaveSelectionEntity> _originalSelectedItemsList = [];
  int _firstIndex = -1;
  int _secondIndex = -1;
  int _thirdIndex = -1;

  int totalLevel = 0;

  bool _isConfirmClick = false;

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  void dispose() {
    if (!_isConfirmClick) {
      _resetSelectionData(widget.entity);
      _restoreOriginalData();
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
          )),
    );
  }

  //pragma mark -- config widgets

  List<Widget> _configWidgets() {
    List<Widget> widgetList = [];

    widgetList.add(_listWidget());
    // TODO ?????????????????? Bottom
    if (totalLevel == 1 &&
        widget.entity.filterType == WaveSelectionFilterType.radio) {
    } else {
      widgetList.add(_bottomWidget());
    }
    return widgetList;
  }

  Widget _listWidget() {
    List<Widget> widgets = [];

    if (!WaveUITools.isEmpty(_firstList) &&
        WaveUITools.isEmpty(_secondList) &&
        WaveUITools.isEmpty(_thirdList)) {
      /// 1????????????????????????
      /// 1.1 ???????????? && ??????????????????????????????
      widgets.add(WaveSelectionSingleListWidget(
          items: _firstList,
          themeData: widget.themeData,
          backgroundColor: _getBgByListIndex(1),
          selectedBackgroundColor: _getSelectBgByListIndex(1),
          maxHeight: widget.maxContentHeight,
          flex: _getFlexByListIndex(1),
          focusedIndex: _firstIndex,
          singleListItemSelect:
              (int listIndex, int index, WaveSelectionEntity entity) {
            _setFirstIndex(index);
            if (totalLevel == 1 &&
                widget.entity.filterType == WaveSelectionFilterType.radio) {
              _confirmButtonClickEvent();
            }
          }));
    } else if (!WaveUITools.isEmpty(_firstList) &&
        !WaveUITools.isEmpty(_secondList) &&
        WaveUITools.isEmpty(_thirdList)) {
      /// 2?????????????????????
      widgets.add(WaveSelectionSingleListWidget(
          items: _firstList,
          themeData: widget.themeData,
          backgroundColor: _getBgByListIndex(1),
          selectedBackgroundColor: _getSelectBgByListIndex(1),
          flex: _getFlexByListIndex(1),
          focusedIndex: _firstIndex,
          singleListItemSelect:
              (int listIndex, int index, WaveSelectionEntity entity) {
            _setFirstIndex(index);
          }));

      widgets.add(WaveSelectionSingleListWidget(
          items: _secondList,
          themeData: widget.themeData,
          backgroundColor: _getBgByListIndex(2),
          selectedBackgroundColor: _getSelectBgByListIndex(2),
          flex: _getFlexByListIndex(2),
          focusedIndex: _secondIndex,
          singleListItemSelect:
              (int listIndex, int index, WaveSelectionEntity entity) {
            _setSecondIndex(index);
          }));
    } else if (!WaveUITools.isEmpty(_firstList) &&
        !WaveUITools.isEmpty(_secondList) &&
        !WaveUITools.isEmpty(_thirdList)) {
      /// 3?????????????????????
      widgets.add(WaveSelectionSingleListWidget(
          items: _firstList,
          themeData: widget.themeData,
          backgroundColor: _getBgByListIndex(1),
          selectedBackgroundColor: _getSelectBgByListIndex(1),
          flex: _getFlexByListIndex(1),
          focusedIndex: _firstIndex,
          singleListItemSelect:
              (int listIndex, int index, WaveSelectionEntity entity) {
            _setFirstIndex(index);
          }));

      widgets.add(WaveSelectionSingleListWidget(
          items: _secondList,
          themeData: widget.themeData,
          backgroundColor: _getBgByListIndex(2),
          selectedBackgroundColor: _getSelectBgByListIndex(2),
          flex: _getFlexByListIndex(2),
          focusedIndex: _secondIndex,
          singleListItemSelect:
              (int listIndex, int index, WaveSelectionEntity entity) {
            _setSecondIndex(index);
          }));
      widgets.add(WaveSelectionSingleListWidget(
          items: _thirdList,
          themeData: widget.themeData,
          backgroundColor: _getBgByListIndex(3),
          selectedBackgroundColor: _getSelectBgByListIndex(3),
          flex: _getFlexByListIndex(3),
          focusedIndex: _thirdIndex,
          singleListItemSelect:
              (int listIndex, int index, WaveSelectionEntity entity) {
            if (entity.isSelected) {
              _thirdIndex = index;
            } else {
              _thirdIndex = -1;
            }
            setState(() {});
          }));
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          color: Colors.white,
          constraints: BoxConstraints(maxHeight: widget.maxContentHeight),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: widgets,
          ),
        ),
        // ??????????????????????????? 240????????? Item ????????? 40??????????????????????????? 6????????? 6 ??????????????????
        _getListMaxCount(widgets.length) > maxShowCount
            ? IgnorePointer(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0),
                        Colors.white,
                      ],
                      stops: [0, 1.0],
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Widget _bottomWidget() {
    return Column(
      children: <Widget>[
        Divider(
          height: 0.3,
          color: widget.themeData.commonConfig.dividerColorBase,
        ),
        Container(
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
                        child: WaveUITools.getAssetImage(
                            WaveAsset.iconSelectionReset),
                      ),
                      Text(
                        WaveIntl.of(context).localizedResource.reset,
                        style:
                            widget.themeData.resetTextStyle.generateTextStyle(),
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
        )
      ],
    );
  }

  //pragma mark -- event responder

  void _confirmButtonClickEvent() {
    _isConfirmClick = true;

    /// ??????????????? ???????????????????????????????????????????????????
    _processFilterDataOnConfirm();
    if (widget.onSelectionConfirm != null) {
      //????????????tips??????????????????????????????????????????selectedLastColumnArray
      widget.onSelectionConfirm!(
          widget.entity, _firstIndex, _secondIndex, _thirdIndex);
    }
  }

  void _clearAllSelectedItems() {
    _resetSelectionData(widget.entity);
    setState(() {
      _configDefaultInitSelectIndex();
      _refreshDataSource();
    });
  }

  //pragma mark -- private methods

  /// ???????????????
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
    _firstIndex = _secondIndex = _thirdIndex = -1;
  }

  // ??????3???ListView????????????
  void _refreshDataSource() {
    _firstList = widget.entity.children;
    if (_firstIndex >= 0 && _firstList.length > _firstIndex) {
      _secondList = _firstList[_firstIndex].children;
      if (_secondIndex >= 0 && _secondList.length > _secondIndex) {
        _thirdList = _secondList[_secondIndex].children;
      } else {
        _thirdList = [];
      }
    } else {
      _secondList = [];
      _thirdList = [];
    }
  }

  void _configDefaultSelectedData() {
    _firstList = widget.entity.children;
    //??????????????????item?????????????????????
    if (_firstList.isEmpty) {
      _secondIndex = -1;
      _secondList = [];

      _thirdIndex = -1;
      _thirdList = [];

      return;
    }
    _firstIndex = _getInitialSelectIndex(_firstList);

    if (_firstIndex >= 0 && _firstIndex < _firstList.length) {
      _secondList = _firstList[_firstIndex].children;
      _secondIndex = _getInitialSelectIndex(_secondList);
    }

    if (_secondList.isEmpty) {
      _thirdIndex = -1;
      _thirdList = [];
      return;
    }
    if (_secondIndex >= 0 && _secondIndex < _secondList.length) {
      _thirdList = _secondList[_secondIndex].children;
      if (_thirdList.isNotEmpty) {
        _thirdIndex = _getInitialSelectIndex(_thirdList);
      }
    }
  }

  ///????????????????????????
  void _resetSelectionData(WaveSelectionEntity entity) {
    entity.isSelected = false;
    entity.customMap = Map();
    if (WaveSelectionFilterType.range == entity.filterType) {
      entity.title = '';
    }
    for (WaveSelectionEntity subEntity in entity.children) {
      _resetSelectionData(subEntity);
    }
  }

  ///????????????
  void _restoreOriginalData() {
    for (WaveSelectionEntity commonEntity in _originalSelectedItemsList) {
      commonEntity.isSelected = true;
      commonEntity.customMap = Map.from(commonEntity.originalCustomMap);
    }
  }

  void _setFirstIndex(int firstIndex) {
    _firstIndex = firstIndex;
    _secondIndex = -1;
    if (widget.entity.children.length > _firstIndex) {
      List<WaveSelectionEntity> seconds =
          widget.entity.children[_firstIndex].children;
      _secondIndex = _getInitialSelectIndex(seconds);
      if (_secondIndex >= 0) {
        _setSecondIndex(_secondIndex);
      }
    }
    setState(() {
      _refreshDataSource();
    });
  }

  void _setSecondIndex(int secondIndex) {
    _secondIndex = secondIndex;
    _thirdIndex = -1;
    List<WaveSelectionEntity> seconds =
        widget.entity.children[_firstIndex].children;
    if (seconds.length > _secondIndex) {
      List<WaveSelectionEntity> thirds = seconds[_secondIndex].children;
      if (thirds.isNotEmpty) {
        _thirdIndex = _getInitialSelectIndex(thirds);
      }
    }
    setState(() {
      _refreshDataSource();
    });
  }

  int _getInitialSelectIndex(List<WaveSelectionEntity> levelList) {
    int index = -1;
    if (levelList.isEmpty) {
      return index;
    }

    for (WaveSelectionEntity entity in levelList) {
      if (entity.isSelected) {
        index = levelList.indexOf(entity);
        break;
      }
    }

    /// ?????????????????????????????????????????????????????? index
    if (index < 0) {
      for (WaveSelectionEntity entity in levelList) {
        if (entity.isUnLimit() &&
            WaveSelectionUtil.getTotalLevel(entity) > 1 &&
            !(entity.parent?.hasCheckBoxBrother() ?? false)) {
          index = levelList.indexOf(entity);
          break;
        }
      }
    }
    return index;
  }

  /// ??????????????? 1???
  /// ????????????????????????????????????????????? 1
  /// ???????????????????????????????????? listIndex ????????????????????? 3???3???4 ????????????????????????
  int _getFlexByListIndex(int listIndex) {
    int flex = 1;
    if (totalLevel == 1 || totalLevel == 2) {
      flex = 1;
    } else if (totalLevel == 3) {
      if (listIndex == 1) {
        flex = 3;
      } else if (listIndex == 2) {
        if (_thirdList.isEmpty) {
          flex = 7;
        } else {
          flex = 3;
        }
      } else if (listIndex == 3) {
        flex = 4;
      }
    }
    return flex;
  }

  Color _getSelectBgByListIndex(int listIndex) {
    Color deepSelectBgColor = widget.themeData.deepSelectBgColor;
    Color middleSelectBgColor = widget.themeData.middleSelectBgColor;
    Color lightSelectBgColor = widget.themeData.lightSelectBgColor;
    if (totalLevel == 1) {
      return lightSelectBgColor;
    } else if (totalLevel == 2) {
      if (listIndex == 1) {
        return middleSelectBgColor;
      } else {
        return lightSelectBgColor;
      }
    } else {
      if (listIndex == 1) {
        return deepSelectBgColor;
      } else if (listIndex == 2) {
        return middleSelectBgColor;
      } else if (listIndex == 3) {
        return lightSelectBgColor;
      }
    }
    return lightSelectBgColor;
  }

  Color _getBgByListIndex(int listIndex) {
    Color deepNormalBgColor = widget.themeData.deepNormalBgColor;
    Color middleNormalBgColor = widget.themeData.middleNormalBgColor;
    Color lightNormalBgColor = widget.themeData.lightNormalBgColor;
    if (totalLevel == 1) {
      return lightNormalBgColor;
    } else if (totalLevel == 2) {
      if (listIndex == 1) {
        return middleNormalBgColor;
      } else {
        return lightNormalBgColor;
      }
    } else {
      if (listIndex == 1) {
        return deepNormalBgColor;
      } else if (listIndex == 2) {
        return middleNormalBgColor;
      } else if (listIndex == 3) {
        return lightNormalBgColor;
      }
    }
    return lightNormalBgColor;
  }

  void _backgroundTap() {
    //????????????????????????????????????????????????????????????????????????
    _resetSelectStatus();
    if (widget.bgClickFunction != null) {
      //????????????
      widget.bgClickFunction!();
    }
  }

  void _resetSelectStatus() {
    _clearAllSelectedItems();
    //????????????
    for (WaveSelectionEntity commonEntity in _originalSelectedItemsList) {
      commonEntity.isSelected = true;
      commonEntity.customMap = Map.from(commonEntity.originalCustomMap);
    }
  }

  /// ?????????????????????????????????????????????
  /// !!! ???????????????????????????????????? Item ????????????????????? true???
  void _processFilterDataOnConfirm() {
    _processSelectedStatus(widget.entity);
  }

  _processSelectedStatus(WaveSelectionEntity entity) {
    if (entity.children.isNotEmpty) {
      entity.children.forEach((f) => _processSelectedStatus(f));
      if (entity.hasCheckBoxBrother()) {
        entity.isSelected =
            entity.children.where((_) => _.isSelected).isNotEmpty;
      }
    }
  }

  int _getListMaxCount(int length) {
    int mostCount = 0;
    if (length == 1) {
      mostCount = _firstList.length;
    } else if (length == 2) {
      int firstCount = _firstList.length;
      int secondCount = _secondList.length;
      mostCount = max(firstCount, secondCount);
    } else if (length == 3) {
      int firstCount = _firstList.length;
      int secondCount = _secondList.length;
      int thirdCount = _secondList.length;
      mostCount = max(firstCount, max(secondCount, thirdCount));
    }
    return mostCount;
  }
}
