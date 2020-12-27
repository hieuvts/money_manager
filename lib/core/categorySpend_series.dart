import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class CategorySpendSeries {
  final String categoryName;
  final double spendAmount;
  final charts.Color barColor;

  CategorySpendSeries(
      {@required this.categoryName,
      @required this.spendAmount,
      @required this.barColor});
}
