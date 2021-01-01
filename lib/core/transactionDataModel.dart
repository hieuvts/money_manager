class TransactionDate {
  String name;
  String icon;
  String change;
  String changeColor;
  String date;

  TransactionDate(
      {this.name, this.icon, this.change, this.changeColor, this.date});

  TransactionDate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    change = json['change'];
    changeColor = json['changeColor'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['change'] = this.change;
    data['changeColor'] = this.changeColor;
    data['date'] = this.date;
    return data;
  }
}
