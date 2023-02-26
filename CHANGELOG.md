## [3.3.0] - 2023-2-1

### Changed

- fix the NullPointerException caused by not configuring <code>WaveIntl</code> [#398](https://github.com/LianjiaTech/waveui/issues/398).
- optimize internal import references.
- adapt flutter sdk 3.7.0 to fix badge reference conflict [#406](https://github.com/LianjiaTech/waveui/issues/406).



## [3.2.0] - 2022-12-29

### Changed

#### base 

- support for localization capabilities.
- add pad theme configuration.
- expend title click area in pickers [#369](https://github.com/LianjiaTech/waveui/issues/369).

#### components

- <code>WaveMultiSelectListPicker</code> : add generics for more flexible data transfer  [#336](https://github.com/LianjiaTech/waveui/issues/336) .
- <code>WaveLinePainter</code> : add the limit of  yDialMax > yDialMin to fix the NaN error when calculating the path [359](https://github.com/LianjiaTech/waveui/issues/359).
- <code>WaveTabBar</code> : fix the overflow error when setting <code>WaveTabBarBadgeMode.origin</code> mode [#340](https://github.com/LianjiaTech/waveui/issues/340).
- <code>WaveAppraise</code>: fix  gif file error [#372](https://github.com/LianjiaTech/waveui/issues/372).
- <code>WaveTextInputFormItem</code>: fix attribute <code>textInputAction</code>  does not take effect and add attribute <code>obscureText</code>, thank to **echo-LuGuang**.
- <code>WaveAppBar</code>: expand <code>WaveTextAction</code> click area.
- <code>WaveEnhanceNumberCard</code>: fix  the number card is not centered [#380](https://github.com/LianjiaTech/waveui/issues/380).



## [3.1.0] - 2022-9-30

### Changed

#### base 

- Adapt flutter sdk 3.3.0 and update dart sdk version to >=2.17.0.
- add <code>WaveSafeDialog[dismiss]</code>  instead of Navigator.pop to close the Dialog [#317](https://github.com/LianjiaTech/waveui/issues/317).
- optimize the upper font of form items [#330](https://github.com/LianjiaTech/waveui/issues/330).

#### components

- <code>WavePageLoading</code> : calculated the range of loading based on screen width [#295](https://github.com/LianjiaTech/waveui/issues/295) .
- <code>WaveBottomTabBar</code> : fix attributes <code>selectedTextStyle </code>and <code>unSelectedTextStyle</code>  do not take effectc [#285](https://github.com/LianjiaTech/waveui/issues/285) , thanks to **JunCaiLi** .
- <code>WaveSearchText</code> : fix an abnormal display when WaveSearchText sets the innerColor property [#275](https://github.com/LianjiaTech/waveui/issues/275), thanks to **xyhuangjia**.
- <code>WaveBrokenLine</code>: xDial support selected style [#282](https://github.com/LianjiaTech/waveui/issues/282).
- <code>WaveMultiSelectTagsPicker</code>: fix when setting properties layoutStyle value of <code>WaveMultiSelectTagsLayoutStyle. Auto</code> display abnormal [#316](https://github.com/LianjiaTech/waveui/issues/316), thanks to **JunCaiLi**.
- <code>WaveCommonCardTitle</code>: fix the theme customization does not take effect, thanks to **JunCaiLi**.
- <code>WaveMiddleInputDialog</code>: add attribute <code>keyboardType</code>, thanks to **moqi2011**.
- <code>WaveCheckbox</code>: fix unsynchronized internal and external check states [#333](https://github.com/LianjiaTech/waveui/issues/333), thanks to **moqi2011**.
- <code>WaveTextInputFormItem</code>: add attribute <code>focusNode</code>, thanks to **Ives7**.
- <code>WaveProgressChart</code>: fix invalid setting color, background color, and animation [#322](https://github.com/LianjiaTech/waveui/pull/322).
- <code>WaveToast</code>: fix default value error in attribute <code>gravity</code> [#341](https://github.com/LianjiaTech/waveui/issues/341).
- <code>WaveTextInputFormItem</code>: add attribute <code>textInputAction</code> , thanks to **Ives7**.
- <code>WaveIconButton</code>: fix setting attribute <code>fontsize</code> does not take effect [#345](https://github.com/LianjiaTech/waveui/issues/345) and tag deprecated it use <code>style</code> is recommended.
- .<code>WaveSingleSelectCityPage</code>: add attribute <code>emptyImage</code> [#329](https://github.com/LianjiaTech/waveui/issues/329) and optimize default images of <code>WaveAbnormalStateWidget</code>.



## [3.0.0] - 2022-7-8

### Changed

#### base 

- Adapt flutter sdk 3.0.3.
- Add the attribute <code>backgroundColor</code>  to the form item and fix issue [#260](https://github.com/LianjiaTech/waveui/issues/260) , thanks to **Kingtous** find it.
- <code>pubspec.yaml</code> : upgrade <code>photo_view</code> version to v0.14.0 and remove <code>provider</code>.

#### components

- <code>WaveBottomPicker</code> : fix the title setting in the <code>show</code> method does not take effect [#212](https://github.com/LianjiaTech/waveui/issues/212) , thanks to **laiiihz** .
- <code>WaveStepInputFormItem</code> : fix cursor confusion [#235](https://github.com/LianjiaTech/waveui/issues/235) , thanks to **jixiaoyong** .
- <code>WaveSmallOutlineButton</code> : fix attribute <code>lineColor</code> does not take effect,thanks to **Story5** .
- <code>WaveAddLabel</code> : support theme config.
- <code>WaveBigMainButton</code> : fix the theme configuration <code>borderRadius</code> and <code>fontSize</code> does not take effect [#214](https://github.com/LianjiaTech/waveui/issues/214) .
- <code>WaveCalendarView</code> : optimize the time range selection supports selecting the same day [#200](https://github.com/LianjiaTech/waveui/issues/200) .
- <code>WaveProgressBarChart</code>：remove useless attribute <code>hasMark</code> in class <code>ChartAxis</code>.
- <code>WaveSmallOutlineButton</code> : fix attribute <code>fontWeight</code> does not take effect [#233](https://github.com/LianjiaTech/waveui/issues/233) .
- <code>WaveDialog</code> : fix <code>themeData</code>  does not take effec [#259](https://github.com/LianjiaTech/waveui/issues/259) .



## [2.2.0] - 2022-4-29

### Changed

#### base 
- Adapt flutter sdk 2.10.5.
- Fix flutter analyze issues.
- Fixed  some component theme configurations customization not taking effect  [#177](https://github.com/LianjiaTech/waveui/issues/177)  . 

#### components

**New components** <code>WaveSwitchFormItem</code> <code>WaveGeneralFormItem</code> <code>WaveSwitchButton</code>.

- <code>WaveTitleFormItem</code>: fix  <code>isRequire</code> parameter invalid [#179](https://github.com/LianjiaTech/waveui/issues/179).
- <code>WaveTextBlockInputFormItem</code> : change the <code>minLines</code> and <code>maxLines</code> attributes  to be nullable [#181](https://github.com/LianjiaTech/waveui/pull/181) thanks to **xiao luobei**.
- <code>WaveSelectionView</code> : fix "unlimited" option not taking effect .
- <code>WaveBottomTabBar</code>: remove the restriction on <code> type</code>  by <code> item.length</code> in the construction method.
- <code>WavePairInfoTable</code> adds a callback attribute <code>onFolded</code> for expanding and collapsing state changes.
- <code>WaveCheckbox</code>:  add attribute <code>crossAxisAlignment</code>.
- <code>WaveRadioButton</code>: add attribute <code>crossAxisAlignment</code>.
- <code>WaveMiddleInputDialog</code>: add attribute <code>themeData</code> support theme.
- <code>WaveTextButtonPanel</code>: optimize button display, fix the space cannot be filled in some cases.
- <code>WaveCommonCardTitle</code>: add attribute <code>titleMaxLines</code> and <code>titleOverflow</code>.
- <code>WaveMultiSelectDialog</code>: uses the default contentStyle of WaveDialogConfig.
- <code>WaveScrollableTextDialog</code>: optimize ScrollBar placement and styling.
- <code>WaveSingleSelectDialog</code>: Add click callback for closeIcon.
- <code>WaveSelectionView</code>: optimizes the data display of the [More] filter page, and supports the display of up to 2 rows.
- <code>WaveTextInputFormItem</code> <code>WaveTextBlockInputFormItem</code> <code>WaveTitleSelectInputFormItem</code> : add attribute <code>autofocus</code> and default value is false.
- <code>WaveAppBar</code> theme customization <code>WaveAppBarConfig</code> supports the attribute <code>showDefaultBottom</code> to control the bottom dividing line of the AppBar
- <code>WaveMultiDataPicker</code>:  add default delegate implementation<code>WaveDefaultMultiDataPickerDelegate</code>.
- <code>WaveStepInputFormItem</code>: add attribute <code>canManualInput</code> and <code>controller</code> to support manual input function.
- <code>WaveSearchText</code>: add attribute <code>inputFormatters</code><code>textInputType</code>.
- <code>WaveAnchorTab</code>: support content dynamic change.
- <code>WaveProgressBarChart</code>: when <code>barChartStyle</code> is  <code>BarChartStyle.horizontal</code> support item click callback.



## [2.1.1] - 2022-4-1

### Changed

#### base

- **Breaking change**: Sound null safety support, thanks to  @leftcoding #39#33 @donywan #20 @laiiihz #80#64#59#32#14  @kalifun #36 @jojinshallar #81#75#65#62#56#42 @junlandroid #73 @Kenneth #53 @HappyImp #55 @kkkman22 #23 @AlexV525 #30
- **Breaking change**: Refer to the dart language specification to optimized constant and enum naming.
- Replace <code>DIN Font</code> with <code>Bebas Font</code> .

#### components

- **Breaking change**: remove <code>WaveHorizontalStepsManager</code> and put function <code>forwardStep()</code>  <code>backStep()</code> into <code>WaveStepsController</code> thanks to leftcoding.
- **Breaking change**:  remove <code>WaveDialogStyle</code> and replace with <code>WaveDialogConfig</code>.
- <code>WaveCalendarView</code>: add <code>WaveCalendarView.single()</code> and <code>WaveCalendarView.range()</code> constructor and had its argument <code>startEndDateChange</code> removed.
- <code>WaveSelectionEntityListBean</code>: <code>fromMap</code> is renamed to <code>fromJson</code>.
- <code>WaveRadioButton</code>: optimize click area [#31](https://github.com/LianjiaTech/waveui/pull/31) , thanks to **a1017480401** .
- <code>WaveScrollableTextDialog</code>: remove Navigator.pop(context) in <code>onSubmit()</code> and hand it over to external processing (user).
- <code>WaveBubbleText</code>: add attribute <code>bgColor</code> and <code>textStyle</code>.
- <code>WavePairInfoTable</code>: add attribute <code>defaultVerticalAlignment</code>.
- <code>WaveSingleSelectDialog</code> : add attribute <code>messageText</code> and <code>messageWidget</code>.




### Fixed

- Fix example error [#71](https://github.com/LianjiaTech/waveui/issues/71) thanks to **leftcoding** fixing this issue.
- Fix <code>WavePickerTitleConfig</code>  <code>titleContent</code> setting is invalid  [#70](https://github.com/LianjiaTech/waveui/issues/70).
- Optimize <code>WavePopupWindow </code> <code>onItemClick</code>  logic  [#57 ](https://github.com/LianjiaTech/waveui/issues/57) .
- Fix <code>WaveDialog</code>  is obscured  by keyboard  [#7](https://github.com/LianjiaTech/waveui/issues/7) .
- Fix <code>WaveTextSelectFormItem</code> set <code>titlePaddingLg</code> doesn't work [#108](https://github.com/LianjiaTech/waveui/issues/108).
- Fix  the bottom text of <code>WaveBottomTabBar</code>  cannot be displayed in some cases [#141](https://github.com/LianjiaTech/waveui/issues/141).

Thanks again to **leftcoding**,  **jojinshallar**,  **laiiihz**,  **donywan**,  **kalifun**,  **junlandroid**, **Kenneth**, **HappyImp**,  **kkkman22** , **a1017480401** and  **Alex**.



## [2.0.0] - 2021-12-8

- Adapt flutter sdk 2.2.2

## [1.0.0] - 2021-12-7

- First publish adapt flutter sdk 1.22.4

