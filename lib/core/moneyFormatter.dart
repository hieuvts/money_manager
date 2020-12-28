class MoneyFormater(var data){
  var amount = int.parse('${data['value']}');
    String moneyData = NumberFormat.currency(locale: 'vi')
        .format(amount);
}