class MMCategory {
  int categoryId;
  String categoryName;
  String categoryIcon;

  MMCategory(this.categoryId, this.categoryName, this.categoryIcon);

  MMCategory.fromMap(dynamic obj) {
    this.categoryId = obj['categoryId'];
    this.categoryName = obj['categoryName'];
    this.categoryIcon = obj['categoryIcon'];
  }

  int get getCategoryId => categoryId;
  String get getCategoryName => categoryName;
  String get getCategoryIcon => categoryIcon;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["categoryId"] = categoryId;
    map["categoryName"] = categoryName;
    map["categoryIcon"] = categoryIcon;
    return map;
  }
}

//Do 'Transaction' trùng tên với class có sẵn trong thư viện sqflite nên dùng tên khác
//MM -> MoneyManager
class MMTransaction {
  int transactionId;
  int transactionCategory;
  String transactionName;
  double transactionAmount;
  String transactionIcon;
  String transactionDate;
  String transactionNote;

  MMTransaction(
      this.transactionId,
      this.transactionCategory,
      this.transactionName,
      this.transactionAmount,
      this.transactionIcon,
      this.transactionDate,
      this.transactionNote);

  MMTransaction.fromMap(dynamic obj) {
    this.transactionId = obj['transactionId'];
    this.transactionCategory = obj['transactionCategory'];
    this.transactionName = obj['transactionName'];
    this.transactionAmount = obj['transactionAmount'];
    this.transactionIcon = obj['transactionIcon'];
    this.transactionDate = obj['transactionDate'];
    this.transactionNote = obj['transactionNote'];
  }

  int get getTransactionId => transactionId;
  int get getTransactionCategory => transactionCategory;
  String get getTransactionName => transactionName;
  double get getTransactionAmount => transactionAmount;
  String get getTransactionIcon => transactionIcon;
  String get getTransactionDate => transactionDate;
  String get getTransactionNote => transactionNote;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["transactionId"] = transactionId;
    map["transactionCategory"] = transactionCategory;
    map["transactionName"] = transactionName;
    map["transactionAmount"] = transactionAmount;
    map["transactionIcon"] = transactionIcon;
    map["transactionDate"] = transactionDate;
    map["transactionNote"] = transactionNote;
    return map;
  }
}
