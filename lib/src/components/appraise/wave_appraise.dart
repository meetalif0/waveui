import 'package:waveui/src/components/appraise/wave_appraise_emoji_list_view.dart';
import 'package:waveui/src/components/appraise/wave_appraise_header.dart';
import 'package:waveui/src/components/appraise/wave_appraise_star_list_view.dart';
import 'package:waveui/src/components/appraise/wave_mulit_select_tags.dart';
import 'package:waveui/src/components/button/wave_big_main_button.dart';
import 'package:waveui/src/components/input/wave_input_text.dart';
import 'package:waveui/src/components/picker/wave_tags_picker_config.dart';
import 'package:waveui/src/components/appraise/wave_appraise_config.dart';
import 'package:waveui/src/l10n/wave_intl.dart';
import 'package:flutter/material.dart';
import 'package:waveui/src/components/appraise/wave_appraise_interface.dart';

/// /// /// /// /// /// /// /// /// /
/// 描述: 评价组件
/// 1. 支持表情包和星星两种
/// 2. 最多支持5个表情和5颗星
/// 3. 支持自定义title，标签等，在WaveAppraiseConfig里配置
/// 4. 可以用在页面里面也可以使用在弹窗里面，使用在底部弹窗的参考[WaveAppraiseBottomPicker]
/// /// /// /// /// /// /// /// /// /

const WaveAppraiseConfig cConfig = const WaveAppraiseConfig();

class WaveAppraise extends StatefulWidget {
  /// 标题
  final String title;

  /// 标题类型，取值[WaveAppraiseHeaderType]
  /// center 标题居中
  /// spaceBetween 标题和关闭居于两侧
  /// 默认值WaveAppraiseHeaderType.spaceBetween
  final WaveAppraiseHeaderType headerType;

  /// 评分组件类型，取值[WaveAppraiseType]
  /// Emoji 表示使用表情包评价
  /// star 使用星星打分
  /// 默认值 WaveAppraiseType.Star
  final WaveAppraiseType type;

  /// 自定义文案
  /// 若评分组件为表情，则list长度为5，不足5个时请在对应位置补空字符串
  /// 若评分组件为星星，则list长度不能比count小
  List<String>? iconDescriptions;

  /// 标签
  final List<String>? tags;

  ///输入框允许提示文案
  final String inputHintText;

  /// 提交按钮的点击回调
  final WaveAppraiseConfirmClick? onConfirm;

  /// 评价组件的配置项
  final WaveAppraiseConfig config;

  WaveAppraise(
      {Key? key,
      this.title = '',
      this.headerType = WaveAppraiseHeaderType.spaceBetween,
      this.type = WaveAppraiseType.star,
      this.iconDescriptions,
      this.tags,
      this.inputHintText = '',
      this.onConfirm,
      this.config = cConfig})
      : super(key: key);

  @override
  _WaveAppraiseState createState() => _WaveAppraiseState();
}

class _WaveAppraiseState extends State<WaveAppraise> {
  int _appraiseIndex = -1;
  bool? _enable;
  String? _inputText;
  List<String> _selectedTag = [];

  @override
  void initState() {
    _enable = widget.config.isConfirmButtonEnabled;
    super.initState();
  }

  @override
  void didUpdateWidget(WaveAppraise oldWidget) {
    _enable = widget.config.isConfirmButtonEnabled;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _headerArea(context),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _getIconWidget(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _getTags(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _inputArea(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _confirmButton(),
          ),
        ],
      ),
    );
  }

  /// header
  Widget _headerArea(BuildContext context) {
    EdgeInsets defaultPadding =
        (widget.headerType == WaveAppraiseHeaderType.center)
            ? EdgeInsets.only(top: 20, bottom: 20)
            : EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 20);
    return WaveAppraiseHeader(
      showHeader: widget.config.showHeader,
      headerType: widget.headerType,
      title: widget.title,
      maxLines: widget.config.titleMaxLines,
      headPadding: widget.config.headerPadding ?? defaultPadding,
      cancelCallBack: widget.config.onCancel,
    );
  }

  /// 获取评分组件
  Widget _getIconWidget() {
    if (widget.type == WaveAppraiseType.emoji) {
      return WaveAppraiseEmojiListView(
        indexes: widget.config.indexes,
        titles: widget.iconDescriptions ??
            WaveIntl.of(context).localizedResource.appriseLevel,
        onTap: (index) {
          setState(() {
            _appraiseIndex = index;
          });
          if (widget.config.iconClickCallback != null) {
            widget.config.iconClickCallback!(index);
          }
        },
      );
    } else {
      return WaveAppraiseStarListView(
        count: widget.config.count,
        titles: widget.iconDescriptions ??
            WaveIntl.of(context).localizedResource.appriseLevel,
        hint: widget.config.starAppraiseHint,
        onTap: (index) {
          setState(() {
            _appraiseIndex = index;
          });
          if (widget.config.iconClickCallback != null) {
            widget.config.iconClickCallback!(index);
          }
        },
      );
    }
  }

  /// 标签
  Widget _getTags() {
    if (widget.tags?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: WaveMultiSelectTags(
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        tagPickerBean: WaveTagsPickerConfig(
          tagItemSource: string2Tag(widget.tags),
        ),
        tagText: (choice) {
          return choice.name;
        },
        // tagStyle: WaveMultiSelectStyle.auto,
        multiSelect: widget.config.multiSelect,
        waveCrossAxisCount: widget.config.tagCountEachRow,
        selectedTagsCallback: (list) {
          _selectedTag = tag2String(list);
          if (widget.config.tagSelectCallback != null) {
            widget.config.tagSelectCallback!(_selectedTag);
          }
        },
      ),
    );
  }

  /// 输入框
  Widget _inputArea() {
    if (widget.config.showTextInput) {
      return Padding(
        padding: EdgeInsets.only(top: 24),
        child: WaveInputText(
          maxLength: widget.config.maxLength,
          bgColor: Color(0xfff8f8f8),
          hint: widget.inputHintText,
          textString: (_inputText ?? widget.config.inputDefaultText) ?? '',
          maxHeight: widget.config.inputMaxHeight,
          minHeight: 40,
          maxHintLines: widget.config.maxHintLines,
          padding: EdgeInsets.all(12),
          onTextChange: (input) {
            _inputText = input;
            if (widget.config.inputTextChangeCallback != null) {
              widget.config.inputTextChangeCallback!(input);
            }
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }

  /// 提交按钮
  Widget _confirmButton() {
    if (widget.config.showConfirmButton) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: WaveBigMainButton(
          title: widget.config.confirmButtonText ??
              WaveIntl.of(context).localizedResource.submit,
          isEnable: _enable ?? _appraiseIndex != -1,
          onTap: () {
            if (_enable ?? _appraiseIndex != -1) {
              if (widget.onConfirm != null) {
                widget.onConfirm!(
                    _appraiseIndex, _selectedTag, _inputText ?? '');
              }
            }
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }

  List<WaveTagItemBean> string2Tag(List<String>? tags) {
    List<WaveTagItemBean> items = [];
    if (tags?.isNotEmpty ?? false) {
      for (int i = 0; i < tags!.length; i++) {
        items.add(WaveTagItemBean(name: tags[i], code: tags[i], index: i));
      }
    }
    return items;
  }

  List<String> tag2String(List<WaveTagItemBean> tags) {
    List<String> result = [];
    tags.forEach((item) {
      result.add(item.name);
    });
    return result;
  }
}
