import 'package:waveui/src/components/picker/base/wave_picker_title.dart';
import 'package:waveui/src/components/picker/base/wave_picker_title_config.dart';
import 'package:waveui/src/components/picker/wave_picker_cliprrect.dart';
import 'package:waveui/src/components/picker/multi_range_picker/bean/wave_multi_column_picker_entity.dart';
import 'package:waveui/src/components/picker/multi_range_picker/wave_multi_column_converter.dart';
import 'package:waveui/src/components/picker/multi_range_picker/wave_multi_column_list.dart';
import 'package:waveui/src/components/picker/multi_range_picker/wave_multi_column_picker_util.dart';
import 'package:waveui/src/theme/wave_theme_configurator.dart';
import 'package:waveui/src/theme/configs/wave_picker_config.dart';
import 'package:waveui/src/utils/wave_tools.dart';
import 'package:flutter/material.dart';

/// 单个数据项被点击的回调，
/// [columnIndex] 数据项所在列
/// [rowIndex] 数据项所在列中的位置
/// [entity] 被点击的数据项
typedef WaveOnEntityTap = void Function(
    int columnIndex, int rowIndex, WavePickerEntity entity);

/// 单个数据项被点击的回调，
/// [results] 选中的数据项
/// [firstIndex] 第一列被选中数据的位置
/// [secondIndex] 第二列被选中数据的位置
/// [thirdIndex] 第三列被选中数据的位置
typedef WaveOnPickerConfirm = void Function(
    Map<String, List<WavePickerEntity>> results,
    int? firstIndex,
    int? secondIndex,
    int? thirdIndex);

/// 从屏幕下方弹起的多级筛选选择器
/// 可设置筛项的层级、多选、单选等筛选相关功能
/// ignore: must_be_immutable
class WaveMultiColumnPicker extends StatefulWidget {
  /// 筛选数据源
  final WavePickerEntity entity;

  /// 初始化时的选中选项
  final List<int>? defaultFocusedIndexes;

  /// Picker展示最大高度，默认 280
  final double maxHeight;

  /// 展示选中的条目的个数，默认 false
  final bool showSelectedCount;

  /// 当选中”不限“的时候，返回的 result 结果是否包含 “不限” 选项
  /// “不限” 选项 value 字段不能为空，上一级 key 字段不能为空，默认 false
  final bool isIncludeUnLimit;

  /// 选择数据后回调函数
  final WaveOnPickerConfirm? onConfirm;

  /// 选择项目后回调函数
  final WaveOnEntityTap? onEntityTap;

  /// 当前选项是否可以被选中:返回 true 可以被选中 false 不可以被选中
  final WaveOnSelectEntityInterceptor? canSelectEntryInterceptor;

  /// 主题定制，只有 Picker Title 部分样式生效
  WavePickerConfig? themeData;

  /// Picker Title 数据配置
  final WavePickerTitleConfig pickerTitleConfig;

  WaveMultiColumnPicker(
      {Key? key,
      required this.entity,
      this.maxHeight = 280.0,
      this.showSelectedCount = false,
      this.isIncludeUnLimit = false,
      this.onConfirm,
      this.onEntityTap,
      this.canSelectEntryInterceptor,
      this.defaultFocusedIndexes,
      this.pickerTitleConfig = WavePickerTitleConfig.Default,
      this.themeData})
      : super(key: key) {
    this.themeData ??= WavePickerConfig();
    this.themeData = this
        .themeData!
        .merge(WaveThemeConfigurator.instance.getConfig().pickerConfig);
  }

  @override
  _WaveSelectionGroupViewState createState() => _WaveSelectionGroupViewState();
}

class _WaveSelectionGroupViewState extends State<WaveMultiColumnPicker> {
  static const WaveMultiRangeSelConverter defaultConverter =
      const WaveMultiRangeSelConverter();
  List<WavePickerEntity> _firstList = [];
  List<WavePickerEntity>? _secondList = [];
  List<WavePickerEntity>? _thirdList = [];
  List<WavePickerEntity> _originalSelectedItemsList = [];
  int? _firstIndex;
  int? _secondIndex;
  int? _thirdIndex;

  int get _columnCount {
    return WaveMultiColumnPickerUtil.getTotalColumnCount(widget.entity);
  }

  /// 未选中状态颜色，默认 Color(0Xff4a4e59)
  late Color _normalColor;

  /// 选中状态颜色，默认 Color(0xff41bc6a)
  late Color _selectedColor;

  @override
  void initState() {
    _normalColor =
        WaveThemeConfigurator.instance.getConfig().commonConfig.colorTextBase;
    _selectedColor =
        WaveThemeConfigurator.instance.getConfig().commonConfig.brandPrimary;
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        height: widget.maxHeight + 48,
        child: WavePickerClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.themeData!.cornerRadius),
            topRight: Radius.circular(widget.themeData!.cornerRadius),
          ),
          child: Column(
            children: _configWidgets(),
          ),
        ));
  }

  //pragma mark -- config widgets

  List<Widget> _configWidgets() {
    List<Widget> widgetList = [];
    widgetList.add(
      Offstage(
        offstage: !widget.pickerTitleConfig.showTitle,
        child: WavePickerTitle(
          themeData: widget.themeData,
          pickerTitleConfig: widget.pickerTitleConfig,
          onConfirm: () {
            _confirmButtonClickEvent();
            Navigator.of(context).pop();
          },
          onCancel: () {
            _resetSelectStatus();
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    widgetList.add(_listWidget());
    return widgetList;
  }

  Widget _listWidget() {
    List<Widget> widgets = [];

    if (!WaveUITools.isEmpty(_firstList) &&
        WaveUITools.isEmpty(_secondList) &&
        WaveUITools.isEmpty(_thirdList)) {
      /// 1、仅有一级的情况
      /// 1.1 一级单选 && 没有自定义范围的情况
      widgets.add(WaveMultiColumnListWidget(
          items: _firstList,
          onSelectEntityInterceptor: widget.canSelectEntryInterceptor,
          normalColor: _normalColor,
          selectedColor: _selectedColor,
          backgroundColor: getBgColorByColumnIndex(1),
          selectedBackgroundColor: _getSelectBgColorByColumnIndex(1),
          maxHeight: widget.maxHeight,
          flex: _getFlexByColumnIndex(1),
          focusedIndex: _firstIndex,
          singleListItemPick:
              (int listIndex, int index, WavePickerEntity entity) {
            _setFirstIndex(index);
            if (_columnCount == 1 &&
                widget.entity.filterType == PickerFilterType.radio) {
              _confirmButtonClickEvent();
            }
            if (widget.onEntityTap != null) {
              widget.onEntityTap!(0, index, entity);
            }
          }));
    } else if (!WaveUITools.isEmpty(_firstList) &&
        !WaveUITools.isEmpty(_secondList) &&
        WaveUITools.isEmpty(_thirdList)) {
      /// 2、有二级的情况
      widgets.add(WaveMultiColumnListWidget(
          items: _firstList,
          onSelectEntityInterceptor: widget.canSelectEntryInterceptor,
          normalColor: _normalColor,
          selectedColor: _selectedColor,
          backgroundColor: getBgColorByColumnIndex(1),
          selectedBackgroundColor: _getSelectBgColorByColumnIndex(1),
          flex: _getFlexByColumnIndex(1),
          focusedIndex: _firstIndex,
          singleListItemPick:
              (int listIndex, int index, WavePickerEntity entity) {
            _setFirstIndex(index);
            if (widget.onEntityTap != null) {
              widget.onEntityTap!(0, index, entity);
            }
          }));

      widgets.add(WaveMultiColumnListWidget(
          items: _secondList,
          onSelectEntityInterceptor: widget.canSelectEntryInterceptor,
          normalColor: _normalColor,
          selectedColor: _selectedColor,
          backgroundColor: getBgColorByColumnIndex(2),
          selectedBackgroundColor: _getSelectBgColorByColumnIndex(2),
          flex: _getFlexByColumnIndex(2),
          focusedIndex: _secondIndex,
          singleListItemPick:
              (int listIndex, int index, WavePickerEntity entity) {
            _setSecondIndex(index);
            if (widget.onEntityTap != null) {
              widget.onEntityTap!(1, index, entity);
            }
          }));
    } else if (!WaveUITools.isEmpty(_firstList) &&
        !WaveUITools.isEmpty(_secondList) &&
        !WaveUITools.isEmpty(_thirdList)) {
      /// 3、有三级的情况
      widgets.add(WaveMultiColumnListWidget(
          items: _firstList,
          onSelectEntityInterceptor: widget.canSelectEntryInterceptor,
          normalColor: _normalColor,
          selectedColor: _selectedColor,
          backgroundColor: getBgColorByColumnIndex(1),
          selectedBackgroundColor: _getSelectBgColorByColumnIndex(1),
          flex: _getFlexByColumnIndex(1),
          focusedIndex: _firstIndex,
          singleListItemPick:
              (int listIndex, int index, WavePickerEntity entity) {
            _setFirstIndex(index);
            if (widget.onEntityTap != null) {
              widget.onEntityTap!(0, index, entity);
            }
          }));

      widgets.add(WaveMultiColumnListWidget(
          items: _secondList,
          onSelectEntityInterceptor: widget.canSelectEntryInterceptor,
          normalColor: _normalColor,
          selectedColor: _selectedColor,
          backgroundColor: getBgColorByColumnIndex(2),
          selectedBackgroundColor: _getSelectBgColorByColumnIndex(2),
          flex: _getFlexByColumnIndex(2),
          focusedIndex: _secondIndex,
          singleListItemPick:
              (int listIndex, int index, WavePickerEntity entity) {
            _setSecondIndex(index);
            if (widget.onEntityTap != null) {
              widget.onEntityTap!(1, index, entity);
            }
          }));
      widgets.add(WaveMultiColumnListWidget(
          items: _thirdList,
          onSelectEntityInterceptor: widget.canSelectEntryInterceptor,
          normalColor: _normalColor,
          selectedColor: _selectedColor,
          backgroundColor: getBgColorByColumnIndex(3),
          selectedBackgroundColor: _getSelectBgColorByColumnIndex(3),
          flex: _getFlexByColumnIndex(3),
          focusedIndex: _thirdIndex,
          singleListItemPick:
              (int listIndex, int index, WavePickerEntity entity) {
            if (entity.isSelected) {
              _thirdIndex = index;
            } else {
              _thirdIndex = -1;
            }
            setState(() {});
            if (widget.onEntityTap != null) {
              widget.onEntityTap!(2, index, entity);
            }
          }));
    }

    return Container(
      color: const Color(0xFFF0F0F0),
      height: widget.maxHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: widgets,
      ),
    );
  }

  //pragma mark -- event responder

  void _confirmButtonClickEvent() {
    if (widget.onConfirm != null) {
      //更多和无tips等外部调用的多选需要传递此值selectedLastColumnArray
      Map<String, List<WavePickerEntity>> result = defaultConverter
          .convertPickedData([widget.entity],
              includeUnlimitSelection: widget.isIncludeUnLimit);
      widget.onConfirm!(result, _firstIndex, _secondIndex, _thirdIndex);
    }
  }

  void _clearAllSelectedItems() {
    _resetSelectionDatas(widget.entity);
    setState(() {
      _configDefaultInitSelectIndex();
      _refreshDataSource();
    });
  }

  //pragma mark -- private methods

  // 初始化数据

  void _initData() {
    // 生成筛选节点树
    _originalSelectedItemsList = widget.entity.selectedList();
    for (WavePickerEntity entity in _originalSelectedItemsList) {
      entity.isSelected = true;
    }

    // 初始化每列的选中 index 为 -1，未选中。
    _configDefaultInitSelectIndex();
    // 遍历数据源，设置真正选中的index
    _configDefaultSelectedData();
    // 使用真正选中的index来刷新数组
    _refreshDataSource();
  }

  // 设置默认无选中项的时候默认选择index
  void _configDefaultInitSelectIndex() {
    _firstIndex = _secondIndex = _thirdIndex = -1;
  }

  // 刷新3个ListView的数据源
  void _refreshDataSource() {
    _firstList = widget.entity.children;
    if (_firstIndex! >= 0 && _firstList.length > _firstIndex!) {
      _secondList = _firstList[_firstIndex!].children;
      if (_secondIndex! >= 0 && _secondList!.length > _secondIndex!) {
        _thirdList = _secondList![_secondIndex!].children;
      } else {
        _thirdList = null;
      }
    } else {
      _secondList = null;
      _thirdList = null;
    }
  }

  void _configDefaultSelectedData() {
    _firstList = widget.entity.children;
    _firstIndex = _getInitialSelectIndex(_firstList);

    if (_firstIndex == -1) {
      if (widget.defaultFocusedIndexes != null) {
        for (int index = 0;
            index < widget.defaultFocusedIndexes!.length;
            index++) {
          if (index == 0 && widget.defaultFocusedIndexes![index] >= 0) {
            _firstIndex = widget.defaultFocusedIndexes![index];
          }

          if (index == 1 && _firstIndex! >= 0) {
            _secondIndex = widget.defaultFocusedIndexes![index];
          }

          if (index == 2 && _secondIndex! >= 0) {
            _thirdIndex = widget.defaultFocusedIndexes![index];
          }
        }
      }

      if (_firstIndex! >= 0 && _firstIndex! < _firstList.length) {
        _secondList = _firstList[_firstIndex!].children;
      }
      if (_secondList == null) {
        _thirdIndex = -1;
        _thirdList = null;
        return;
      }
      if (_secondIndex! >= 0 && _secondIndex! < _secondList!.length) {
        _thirdList = _secondList![_secondIndex!].children;
      }
    } else {
      if (_firstIndex! >= 0 && _firstIndex! < _firstList.length) {
        _secondList = _firstList[_firstIndex!].children;
        if (_secondList != null) {
          _secondIndex = _getInitialSelectIndex(_secondList);
        }
      }

      if (_secondList == null) {
        _thirdIndex = -1;
        _thirdList = null;
        return;
      }
      if (_secondIndex! >= 0 && _secondIndex! < _secondList!.length) {
        _thirdList = _secondList![_secondIndex!].children;
        if (_thirdList != null) {
          _thirdIndex = _getInitialSelectIndex(_thirdList);
        }
      }
    }
  }

  //设置数据为未选中状态
  void _resetSelectionDatas(WavePickerEntity entity) {
    entity.isSelected = false;
    for (WavePickerEntity subEntity in entity.children) {
      _resetSelectionDatas(subEntity);
    }
  }

  //pragma mark -- getter and setter

  void _setFirstIndex(int firstIndex) {
    _firstIndex = firstIndex;
    _secondIndex = -1;
    if (widget.entity.children.length > _firstIndex!) {
      List<WavePickerEntity> seconds =
          widget.entity.children[_firstIndex!].children;
      _secondIndex = _getInitialSelectIndex(seconds);

      if (_secondIndex! >= 0) {
        _setSecondIndex(_secondIndex);
      }
    }
    setState(() {
      _refreshDataSource();
    });
  }

  void _setSecondIndex(int? secondIndex) {
    _secondIndex = secondIndex;
    _thirdIndex = -1;
    List<WavePickerEntity> seconds =
        widget.entity.children[_firstIndex!].children;
    if (seconds.length > _secondIndex!) {
      List<WavePickerEntity> thirds = seconds[_secondIndex!].children;
      _thirdIndex = _getInitialSelectIndex(thirds);
    }
    setState(() {
      _refreshDataSource();
    });
  }

  int _getInitialSelectIndex(List<WavePickerEntity>? levelList) {
    int index = -1;
    if (levelList == null || levelList.isEmpty) {
      return index;
    }

    for (WavePickerEntity entity in levelList) {
      if (entity.isSelected) {
        index = levelList.indexOf(entity);
        break;
      }
    }

    if (index < 0) {
      for (WavePickerEntity entity in levelList) {
        // 当上一级为多选时，当前级不应有默认焦点，
        // 例如1级为多选，不应该默认选中2级的不限
        // 否则每选中任意一个1级选项，就默认有了一个2级的不限
        if (entity.isUnLimit() &&
            entity.parent!.filterType != PickerFilterType.checkbox) {
          index = levelList.indexOf(entity);
          break;
        }
      }
    }
    return index;
  }

  /// 默认占比为 1，
  /// 其中一列、两列情况下，占比都是 1
  /// 当为三列数据时，占比随着 listIndex 增加而增大。为 3：3：4 比例水平占据屏幕
  int _getFlexByColumnIndex(int listIndex) {
    int flex = 1;
    if (_columnCount == 1 || _columnCount == 2) {
      flex = 1;
    } else if (_columnCount == 3) {
      if (listIndex == 1) {
        flex = 3;
      } else if (listIndex == 2) {
        if (_thirdList == null) {
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

  Color _getSelectBgColorByColumnIndex(int listIndex) {
    Color deepSelectBgColor = Color(0xFFF8F8F8);
    Color middleSelectBgColor = Colors.white;
    Color lightSelectBgColor = Colors.white;
    if (_columnCount == 1) {
      return lightSelectBgColor;
    } else if (_columnCount == 2) {
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

  Color getBgColorByColumnIndex(int listIndex) {
    Color deepNormalBgColor = Color(0xFFF0F0F0);
    Color middleNormalBgColor = Color(0xFFF8F8F8);
    Color lightNormalBgColor = Colors.white;
    if (_columnCount == 1) {
      return lightNormalBgColor;
    } else if (_columnCount == 2) {
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

  void _resetSelectStatus() {
    _clearAllSelectedItems();
    //数据还原
    for (WavePickerEntity commonEntity in _originalSelectedItemsList) {
      commonEntity.isSelected = true;
    }
  }
}
