import 'package:intl/intl.dart';

//Format theo kiểu tiền Việt nam
//String 10000
//Kết quả trả về 10.000

String moneyFormater(String data) {
  var amount = int.parse(data);
  return NumberFormat.currency(locale: 'vi').format(amount);
}
