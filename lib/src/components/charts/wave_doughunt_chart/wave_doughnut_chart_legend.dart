import 'package:waveui/src/components/charts/wave_doughunt_chart/wave_doughnut_chart.dart';
import 'package:flutter/material.dart';

enum WaveDoughnutChartLegendStyle {
  /// 横向排列式
  wrap,

  /// 竖向列表式
  list,
}

/// DoughnutChartLegend 组件的图例
/// 饼状图、环状图展示所使用的图例
/// [legendStyle] 图例的样式
/// [data] 图例数据
class DoughnutChartLegend extends StatelessWidget {
  /// [options] 图例的样式
  /// wrap: 横向排列
  /// list: 纵向排列
  /// 默认值为 wrap
  final WaveDoughnutChartLegendStyle legendStyle;

  /// 图例展示所用数据
  final List<WaveDoughnutDataItem> data;

  DoughnutChartLegend(
      {this.legendStyle = WaveDoughnutChartLegendStyle.wrap,
      required this.data});

  @override
  Widget build(BuildContext context) {
    if (WaveDoughnutChartLegendStyle.list == this.legendStyle) {
      List<Widget> items = [];
      this.data.forEach((WaveDoughnutDataItem item) {
        items.add(this.genItem(item));
      });
      return Column(
        children: items,
      );
    } else if (WaveDoughnutChartLegendStyle.wrap == this.legendStyle) {
      List<Widget> items = [];
      this.data.forEach((WaveDoughnutDataItem item) {
        items.add(this.genItem(item));
      });

      return Wrap(
        direction: Axis.horizontal,
        spacing: 20,
        children: items,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget genItem(WaveDoughnutDataItem item) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(1.5)),
          child: Container(
            width: 12,
            height: 3,
            color: item.color,
          ),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          item.title,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
