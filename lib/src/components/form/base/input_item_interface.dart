/// 用于model兼容回调
/// 主要用于各种点击事件

typedef OnWaveFormSelectAll = void Function(int index, bool isSelect);

/// 主要用于各种输入值变化
typedef OnWaveFormRadioValueChanged = void Function(
    String? oldStr, String? newStr);
typedef OnWaveFormSwitchChanged = void Function(bool oldValue, bool newValue);
typedef OnWaveFormValueChanged = void Function(int oldValue, int newValue);
typedef OnWaveFormMultiChoiceValueChanged = void Function(
    List<String> oldValue, List<String> newValue);
typedef OnWaveFormBtnSelectChanged = void Function(
    List<bool> oldValue, List<bool> newValue);

/// 用于model兼容回调 定义等同于 form_interface
/// 主要用于各种点击事件
typedef OnWaveFormTitleSelected = void Function(String title, int index);
