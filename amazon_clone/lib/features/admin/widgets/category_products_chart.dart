import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../models/sales.dart';

class CategoryProductCharts extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const CategoryProductCharts({super.key, required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}
