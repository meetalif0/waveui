import 'package:waveui/src/components/charts/wave_progress_bar_chart/wave_progress_bar_chart_painter.dart';
import 'package:flutter/material.dart';

/// WaveProgressBarChart
/// 柱形数据图表
/// 展示一组或者多组数据，方便数据的查看以及对比
/// ignore: must_be_immutable
class WaveProgressBarChart extends StatefulWidget {
  /// 图表最小宽度，默认0
  final double minWidth;

  /// 内边距，默认 EdgeInsets.all(20)
  final EdgeInsetsGeometry padding;

  /// x轴数据，必传
  final ChartAxis xAxis;

  /// y轴数据，必传
  final ChartAxis yAxis;

  /// 柱形数据，必传
  final List<WaveProgressBarBundle> barBundleList;

  /// 柱形图间的间距，默认 30
  final double barGroupSpace;

  /// 单个柱形宽度，默认 30
  final double singleBarWidth;

  /// 柱状图的最大值，柱状图的宽/高会依此值计算，默认 0，为0时自动计算柱状图最大值
  final double barMaxValue;

  /// 柱状图方向，默认 BarChartStyle.vertical
  final BarChartStyle barChartStyle;

  /// 选中柱状图时条形文案颜色，默认 Colors.white
  final Color selectedHintTextColor;

  /// 选中柱状图时条形文案背景颜色，默认 Colors.black
  final Color selectedHintTextBackgroundColor;

  /// 是否可点击回调
  final OnBarItemClickInterceptor? onBarItemClickInterceptor;

  /// 选中柱状图时候的回调(暂仅支持垂直柱状图)
  final WaveProgressBarChartSelectCallback? barChartSelectCallback;

  /// 图表高度，竖直柱状图有效，默认300
  final double height;

  WaveProgressBarChart(
      {Key? key,
      this.minWidth = 0,
      this.padding = const EdgeInsets.all(20),
      this.barChartStyle = BarChartStyle.vertical,
      required this.xAxis,
      required this.yAxis,
      required this.barBundleList,
      this.barGroupSpace = 30,
      this.singleBarWidth = 30,
      this.barMaxValue = 0,
      this.selectedHintTextColor = Colors.white,
      this.selectedHintTextBackgroundColor = Colors.black,
      this.onBarItemClickInterceptor,
      this.barChartSelectCallback,
      this.height = 300})
      : super(key: key) {
    if (BarChartStyle.horizontal == barChartStyle) {
      assert(barBundleList[0].barList.length == yAxis.axisItemList.length,
          '水平柱状图个数与Y轴坐标数目要相等');
    } else if (BarChartStyle.vertical == barChartStyle) {
      assert(barBundleList[0].barList.length == xAxis.axisItemList.length,
          '竖直柱状图个数与X轴坐标数目要相等');
    }
  }

  @override
  State<StatefulWidget> createState() {
    return WaveProgressBarChartState();
  }
}

class WaveProgressBarChartState extends State<WaveProgressBarChart> {
  WaveProgressBarItem? _selectedBarItem;

  Size chartSize() {
    int barBundleCount = widget.barBundleList.length;
    int numberOfBars = widget.barBundleList[0].barList.length;
    if (BarChartStyle.horizontal == widget.barChartStyle) {
      double height = widget.yAxis.leadingSpace +
          (widget.singleBarWidth * barBundleCount + widget.barGroupSpace) *
              numberOfBars;

      ///有 x 轴 需要加上 x 轴占用的高度
      if (widget.xAxis.axisItemList.isNotEmpty) {
        height += 22;
      }
      double width = MediaQuery.of(context).size.width;
      return Size(width, height);
    } else if (BarChartStyle.vertical == widget.barChartStyle) {
      double width = widget.xAxis.leadingSpace +
          (widget.singleBarWidth * barBundleCount + widget.barGroupSpace) *
              numberOfBars;

      /// 有 y 轴需要加上 y 轴占用的宽度
      if (widget.yAxis.axisItemList.isNotEmpty) {
        width += WaveProgressBarChartPainter.maxYAxisWidth(widget.yAxis);
      }
      return Size(
          widget.minWidth > width ? widget.minWidth : width, widget.height);
    } else {
      return Size.zero;
    }
  }

  @override
  void didUpdateWidget(WaveProgressBarChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    this.clearSelectedBarItem(oldWidget);
  }

  void clearSelectedBarItem(WaveProgressBarChart oldWidget) {
    if (widget.barBundleList.length == oldWidget.barBundleList.length) {
      int bundleCount = widget.barBundleList.length;
      for (int bundleIndex = 0; bundleIndex < bundleCount; bundleIndex++) {
        WaveProgressBarBundle bundle = widget.barBundleList[bundleIndex];
        WaveProgressBarBundle oldBundle = oldWidget.barBundleList[bundleIndex];
        if (bundle.barList.length == oldBundle.barList.length) {
          int barCount = bundle.barList.length;
          for (int barIndex = 0; barIndex < barCount; barIndex++) {
            WaveProgressBarItem barItem = bundle.barList[barIndex];
            WaveProgressBarItem oldBarItem = oldBundle.barList[barIndex];
            if (barItem.text != oldBarItem.text ||
                barItem.value != oldBarItem.value ||
                barItem.hintValue != oldBarItem.hintValue ||
                barItem.selectedHintText != oldBarItem.selectedHintText) {
              _selectedBarItem = null;
              return;
            }
          }
        } else {
          _selectedBarItem = null;
          return;
        }
      }
    } else {
      _selectedBarItem = null;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size chartSize = this.chartSize();
    if (chartSize == Size.zero) {
      return const SizedBox.shrink();
    }
    if (BarChartStyle.vertical == widget.barChartStyle) {
      double yAxisWidth =
          WaveProgressBarChartPainter.maxYAxisWidth(widget.yAxis);
      return Padding(
        padding: widget.padding,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              size: chartSize,
              painter: WaveProgressBarChartPainter(
                drawBar: false,
                drawX: false,
                xAxis: widget.xAxis,
                yAxis: widget.yAxis,
                barChartStyle: widget.barChartStyle,
                singleBarWidth: widget.singleBarWidth,
                barMaxValue: widget.barMaxValue,
                barGroupSpace: widget.barGroupSpace,
                barBundleList: widget.barBundleList,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: yAxisWidth),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: CustomPaint(
                  size: chartSize,
                  painter: WaveProgressBarChartPainter(
                      drawY: false,
                      xAxis: widget.xAxis,
                      yAxis: widget.yAxis,
                      barChartStyle: widget.barChartStyle,
                      singleBarWidth: widget.singleBarWidth,
                      barMaxValue: widget.barMaxValue,
                      barGroupSpace: widget.barGroupSpace,
                      barBundleList: widget.barBundleList,
                      onBarItemClickInterceptor:
                          widget.onBarItemClickInterceptor,
                      selectedBarItem: _selectedBarItem,
                      selectedHintTextColor: widget.selectedHintTextColor,
                      selectedHintTextBackgroundColor:
                          widget.selectedHintTextBackgroundColor,
                      waveProgressBarChartSelectCallback:
                          (WaveProgressBarItem? item) {
                        if (null != widget.barChartSelectCallback) {
                          widget.barChartSelectCallback!(item);
                        }
                        setState(() {
                          _selectedBarItem = item;
                        });
                      }),
                ),
              ),
            )
          ],
        ),
      );
    } else if (BarChartStyle.horizontal == widget.barChartStyle) {
      double yAxisWidth =
          WaveProgressBarChartPainter.maxYAxisWidth(widget.yAxis);
      return Padding(
        padding: widget.padding,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: yAxisWidth),
              child: CustomPaint(
                size: chartSize,
                painter: WaveProgressBarChartPainter(
                  drawBar: false,
                  drawY: false,
                  xAxis: widget.xAxis,
                  yAxis: widget.yAxis,
                  barChartStyle: widget.barChartStyle,
                  singleBarWidth: widget.singleBarWidth,
                  barMaxValue: widget.barMaxValue,
                  barGroupSpace: widget.barGroupSpace,
                  barBundleList: widget.barBundleList,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 22),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: CustomPaint(
                  size: chartSize,
                  painter: WaveProgressBarChartPainter(
                      drawX: false,
                      xAxis: widget.xAxis,
                      yAxis: widget.yAxis,
                      barChartStyle: widget.barChartStyle,
                      singleBarWidth: widget.singleBarWidth,
                      barMaxValue: widget.barMaxValue,
                      barGroupSpace: widget.barGroupSpace,
                      barBundleList: widget.barBundleList,
                      onBarItemClickInterceptor:
                          widget.onBarItemClickInterceptor,
                      selectedBarItem: _selectedBarItem,
                      selectedHintTextColor: widget.selectedHintTextColor,
                      selectedHintTextBackgroundColor:
                          widget.selectedHintTextBackgroundColor,
                      waveProgressBarChartSelectCallback:
                          (WaveProgressBarItem? item) {
                        widget.barChartSelectCallback?.call(item);
                        setState(() {
                          _selectedBarItem = item;
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
