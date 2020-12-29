import 'package:intl/intl.dart';

String moneyFormater(String data) {
  var amount = int.parse(data);
  return NumberFormat.currency(locale: 'vi')
      .format(amount); //Format theo kiểu tiền Việt nam
}
//String 10000
//Kqua trả ra 10.000
