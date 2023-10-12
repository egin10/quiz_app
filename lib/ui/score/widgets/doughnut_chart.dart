import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../app/theme/app_text_theme.dart';
import '../score_viewmodel.dart';

class DoughnutChart extends StackedHookView<ScoreViewModel> {
  const DoughnutChart({super.key});

  @override
  Widget builder(BuildContext context, ScoreViewModel model) {
    final List<ChartData> chartData = [
      ChartData('Correct', 38, Colors.green),
      ChartData('Incorrect', 25, Colors.red),
    ];

    return SizedBox(
      height: 200.h,
      width: double.maxFinite,
      child: Stack(
        children: [
          SizedBox(
            height: 200.h,
            child: SfCircularChart(
              series: <CircularSeries>[
                // Renders doughnut chart
                DoughnutSeries<ChartData, String>(
                  animationDuration: 0,
                  dataSource: chartData,
                  pointColorMapper: (ChartData data, _) => data.color,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  dataLabelMapper: (datum, index) =>
                      '${datum.y.toStringAsFixed(0)}%',
                  explodeIndex: 1,
                  innerRadius: "90%",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200.h,
            width: double.maxFinite,
            child: Center(
              child: Text(
                '3/5',
                style: AppTextTheme.getThemeText()
                    .bodyLarge
                    ?.copyWith(letterSpacing: 6.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
