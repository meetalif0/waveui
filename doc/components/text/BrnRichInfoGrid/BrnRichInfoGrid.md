---
title: WaveRichInfoGrid
group:
  title: Card
  order: 7
---

# WaveRichInfoGrid

## 一、效果总览

<img src="./img/WaveRichInfoGridDemo1.png" style="zoom:67%;" />
<br />
<img src="./img/WaveRichInfoGridDemo2.png" style="zoom:67%;" />

## 二、描述

### 适用场景

1. 常用于详情页中两列的信息展示

2. 兼容了非通栏的情况，如果使用 Row 包裹，则使用 Expanded 将其包裹

## 三、构造函数及参数说明

### 构造函数

```dart
WaveRichInfoGrid({
  Key? key,
  this.pairInfoList,
  this.padding,
  this.rowSpace,
  this.space,
  this.itemHeight,
  this.crossAxisCount = 2,
  this.themeData,
}) : super(key: key);
```

### 参数说明

| **参数名**     | **参数类型**               | **描述**          | **是否必填** | **默认值**       |
| -------------- | -------------------------- | ----------------- | ------------ | ---------------- |
| pairInfoList   | `List<WaveRichGridInfo>?`   | 待展示的文本信息  | 是           | 无               |
| padding        | EdgeInsetsGeometry?        | 字体大小          | 否           | 无               |
| rowSpace       | double?                    | 纵向间距          | 否           | 4                |
| space          | double?                    | 横向间距          | 否           | 2                |
| itemHeight     | double?                    | item 的高度       | 否           | 和文字相关的行高 |
| crossAxisCount | int                        | GridView 分为几列 | 否           | 2                |
| themeData      | WavePairRichInfoGridConfig? | 主题定制属性      | 否           | 无               |

## 四、代码演示

### 效果 1

<img src="./img/WaveRichInfoGridDemo1.png" style="zoom:50%;" />

```dart
WaveRichInfoGrid(
  pairInfoList: [
    WaveRichGridInfo('名称:', '25-30平'),
    WaveRichGridInfo('户型:', '1-0-0-1'),
    WaveRichGridInfo('朝向:', '南北/西/北'),
    WaveRichGridInfo('窗户:', '无窗'),
    WaveRichGridInfo('供暖:', '集体供暖'),
    WaveRichGridInfo('装修:', '精装修'),
    WaveRichGridInfo('车位:', '可租 300元/月'),
  ],
)
```

### 效果 2：复杂元素

<img src="./img/WaveRichInfoGridDemo2.png" style="zoom:67%;" />

```dart
WaveRichInfoGrid(
  pairInfoList: <WaveRichGridInfo>[
    WaveRichGridInfo("名称：", '内容内容内容内容'),
    WaveRichGridInfo("名称：", '内容内容内容'),
    WaveRichGridInfo("名称：", '内容内容'),
    WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
        keyQuestionCallback: (value) {
      WaveToast.show(value, context);
    }),
    WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
        valueQuestionCallback: (value) {
      WaveToast.show(value, context);
    }),
    WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
        valueQuestionCallback: (value) {
          WaveToast.show(value, context);
        },
        clickTitle: "可点击内",
        clickCallback: (value) {
          WaveToast.show(value, context);
        }),
    WaveRichGridInfo.valueLastClickInfo('名称', '内容内容',
        clickTitle: "可点击内容", clickCallback: (value) {
      WaveToast.show(value, context);
    }),
  ],
)
```
