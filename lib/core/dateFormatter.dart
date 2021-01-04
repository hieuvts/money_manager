import 'package:intl/intl.dart';

String getVietnameseDateTime(String date) {
  var getDateTime =
      DateFormat("yyyy-MM-dd", "vi_VN").parse(date); //date: 2021-01-05
  return DateFormat("dd-MM-yyyy", "vi_VN").format(getDateTime); //return 01
}
