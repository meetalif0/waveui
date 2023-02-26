import 'package:waveui/src/components/selection/bean/wave_filter_entity.dart';
import 'package:waveui/src/components/selection/bean/wave_selection_common_entity.dart';
import 'package:waveui/src/components/selection/wave_selection_view.dart';
import 'package:waveui/src/constants/wave_constants.dart';
import 'package:flutter/material.dart';

typedef WaveSimpleSelectionOnSelectionChanged = void Function(
    List<ItemEntity> selectedParams);

const String _defaultMenuKey = "defaultMenuKey";

// ignore: must_be_immutable
class WaveSimpleSelection extends StatefulWidget {
  /// 标题文案
  final String menuName;

  /// 回传给服务端key
  final String menuKey;

  /// 默认选中选项值
  final String? defaultValue;

  /// 最大选中个数  默认 radio模式 65535  checkbox模式外部传入
  final int maxSelectedCount;

  /// 选项列表
  final List<ItemEntity> items;

  /// 选择回调
  final WaveSimpleSelectionOnSelectionChanged onSimpleSelectionChanged;

  /// 菜单点击事件
  final Function? onMenuItemClick;

  /// 是否单选  默认 radio模式 is true ， checkbox模式 is false
  final bool isRadio;

  /// 单选构造函数
  WaveSimpleSelection.radio({
    Key? key,
    required this.menuName,
    this.menuKey = _defaultMenuKey,
    this.defaultValue,
    required this.items,
    required this.onSimpleSelectionChanged,
    this.onMenuItemClick,
  })  : this.isRadio = true,
        this.maxSelectedCount = WaveSelectionConstant.maxSelectCount,
        super(key: key);

  /// 多选构造函数
  WaveSimpleSelection.checkbox({
    Key? key,
    required this.menuName,
    this.menuKey = _defaultMenuKey,
    this.defaultValue,
    this.maxSelectedCount = WaveSelectionConstant.maxSelectCount,
    required this.items,
    required this.onSimpleSelectionChanged,
    this.onMenuItemClick,
  })  : this.isRadio = false,
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WaveSimpleSelectionState();
  }
}

class WaveSimpleSelectionState extends State<WaveSimpleSelection> {
  late List<WaveSelectionEntity> selectionEntityList;

  @override
  void initState() {
    super.initState();
    selectionEntityList = _convertFilterToWaveSelection();
  }

  /// 将筛选数据转换成通用筛选数据
  List<WaveSelectionEntity> _convertFilterToWaveSelection() {
    List<WaveSelectionEntity> list = [];
    if (widget.items.isNotEmpty) {
      List<WaveSelectionEntity> children = [];
      for (var filter in widget.items) {
        children.add(WaveSelectionEntity.simple(
            key: filter.key,
            value: filter.value,
            title: filter.name,
            type: widget.isRadio ? "radio" : "checkbox"));
      }

      list.add(WaveSelectionEntity(
          key: widget.menuKey,
          title: widget.menuName,
          maxSelectedCount: widget.maxSelectedCount,
          type: widget.isRadio ? "radio" : "checkbox",
          defaultValue: widget.defaultValue,
          children: children));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return WaveSelectionView(
      originalSelectionData: selectionEntityList,
      onSelectionChanged:
          (menuIndex, selectedParams, customParams, setCustomTitleFunction) {
        List<ItemEntity> results = [];
        String valueStr = selectedParams[widget.menuKey] ?? '';
        List<String> values = valueStr.split(',');

        ///遍历获取选中的items
        for (String value in values) {
          for (ItemEntity item in widget.items) {
            if (item.value != null && item.value == value) {
              results.add(item);
              break;
            }
          }
        }
        widget.onSimpleSelectionChanged(results);
      },
      onMenuClickInterceptor: (index) {
        if (widget.onMenuItemClick != null) {
          widget.onMenuItemClick!();
        }
        return false;
      },
    );
  }
}
