import 'package:finance/private/core/constants/colors.dart';
import 'package:finance/private/utils/data_formatter.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../private/src/category1/model/category1_fetch_with_average_model.dart';
import '../../../../private/src/category1/model/category_2_average.dart';

class CategoryChart extends StatefulWidget {
  final Category1FetchWithAverageModel category;
  final bool showTitle;

  const CategoryChart({
    super.key,
    required this.category,
    this.showTitle = true,
  });


  @override
  State<CategoryChart> createState() => _CategoryChartState();
}

class _CategoryChartState extends State<CategoryChart> {
  final int unSelectedIndex = -1;
  late final double categoryTotal = widget.category.total;
  final String categoryTotalName = "Total";

  late String categoryName = categoryTotalName;
  late double categoryValue = categoryTotal;
  late int indexTipped = unSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent.color,
      child: SfCircularChart(
        title: widget.showTitle ? ChartTitle(
          text: widget.category.name,
          textStyle: const TextStyle(
            fontSize: 12
          )
        ) : const ChartTitle(),
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryName),
                Text(currencyFormatBr(categoryValue))
              ],
            )
          )
        ],
        margin: const EdgeInsets.all(0.0),
        series: <DoughnutSeries<Category2Average, String>>[
          DoughnutSeries<Category2Average, String>(
            dataSource: widget.category.categories2Averages,
            xValueMapper: (data, _) => data.name,
            yValueMapper: (data, _) => data.avegare,
            innerRadius: "75%",
            radius: "70%",
            animationDuration: 0,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.line,
                width: 1,
                length: "2"
              ),
              labelPosition: ChartDataLabelPosition.outside,
              builder: (data, _, __, ___, ____) {
                return Text(
                  (data as Category2Average).percentage(total: categoryTotal),
                  style: const TextStyle(
                    fontSize: 10
                  ),
                );
              },
            ),
            onPointTap: (pointInteractionDetails) => 
              setState(() {
                categoryValue = categoryTotal;
                categoryName = categoryTotalName;
                final pointIndex = pointInteractionDetails.pointIndex;
                if (indexTipped != pointIndex) {
                  ChartPoint point = pointInteractionDetails.dataPoints![pointIndex!];
                  categoryValue = point.y!.toDouble();
                  categoryName = point.x;
                  indexTipped = pointIndex;
                } else {
                  indexTipped = unSelectedIndex;
                }
              }),
          )
        ],
      ),
    );
  }
}