---
title: WaveBubbleText
group:
  title: Card
  order: 7
---

#WaveBubbleText

Bubble background text display, support expand/collapse operation.

## 1. Effect overview

<img src="./img/bubbleTextExpaned.png" style="zoom:50%;" />
<br/>
<img src="./img/bubbleTextCollapsed.png" style="zoom:50%;" />

## 2. Description

### Applicable scene

On the details page, a large block of text is displayed, and the "collapse/expand" operation is supported.

## 3. Constructor and parameter description

### Constructor

```dart
const WaveBubbleText({Key key, this.text, this.maxLines, this.expandable, this.radius = 4})
  : super(key: key);
```

### Parameter Description
| **Parameter Name**| **Parameter Type**| **Description**| **Required**| **Default Value**|
| ----------| ----------------------------------------| --------------------------------------------------| ------------| ----------|
| text | String | displayed text | is | |
| maxLines | int | The maximum number of displayed lines, if the actual number of lines exceeds the limit, the collapsed state will be displayed | No | |
| onExpand | TextExpandedCallback = Function(bool) | expand and collapse callback | no | |
| radius | double | rounded corner size of the bubble | no | 4 |

## 4. Code Demo

### Effect 1

<img src="./img/bubbleTextExpaned.png" style="zoom:50%;" />
<br />
<img src="./img/bubbleTextCollapsed.png" style="zoom:50%;" />

```dart
WaveBubbleText(
  maxLines: 2,
text: 'Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content Content]
  expandable: (isExpanded){
    String str = isExpanded? "Expanded": "Collapsed";
    WaveToast.show("I$str", context);
  },
);
```