class Category {
  int categoryId;
  String categoryName;
  String categoryIcon;

  Category(this.categoryId, this.categoryName, this.categoryIcon);

  Category.fromMap(dynamic obj) {
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

class Transaction {
  int transactionId;
  int transactionCategory;
  String transactionName;
  double transactionAmount;
  String transactionIcon;
  String transactionDate;
  String transactionNote;

  Transaction(
      this.transactionId,
      this.transactionCategory,
      this.transactionName,
      this.transactionAmount,
      this.transactionIcon,
      this.transactionDate,
      this.transactionNote);

  Transaction.fromMap(dynamic obj) {
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
