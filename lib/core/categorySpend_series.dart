import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';

class SubscriberSeries {
  final String categoryName;
  final double spendAmount;
  final charts.Color barColor;

  SubscriberSeries(
      {@required this.categoryName,
      @required this.spendAmount,
      @required this.barColor});
}
