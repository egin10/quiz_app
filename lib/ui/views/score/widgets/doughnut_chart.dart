import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app/theme/app_text_theme.dart';

class DoughnutChart extends StatelessWidget {
  final double correct, incorrect, total;

  const DoughnutChart({
    super.key,
    this.correct = 0,
    this.incorrect = 0,
    this.total = 0,
  });

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Correct', correct, Colors.green),
      ChartData('Incorrect', incorrect, Colors.red),
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
                '${correct.toStringAsFixed(0)}/${total.toStringAsFixed(0)}',
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
