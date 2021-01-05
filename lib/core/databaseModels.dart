class MMCategory {
  int categoryId;
  String categoryName;
  String categoryIcon;
  int transactionAmount;
  MMCategory(this.categoryId, this.categoryName, this.categoryIcon,
      this.transactionAmount);

  MMCategory.fromMap(dynamic obj) {
    this.categoryId = obj['categoryId'];
    this.categoryName = obj['categoryName'];
    this.categoryIcon = obj['categoryIcon'];
  }
  MMCategory.fromIDandAmount(dynamic obj) {
    this.categoryName = obj['categoryName'];
    this.transactionAmount = obj['transactionAmount'];
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

  Map<String, dynamic> toMapOnlyNameAmount() {
    // var map = new Map<String, dynamic>();
    // return {
    //   'categoryName': categoryName,
    //   'transactionAmount': transactionAmount,
    // };
    var map = new Map<String, dynamic>();
    map["categoryName"] = categoryName;
    map["transactionAmount"] = transactionAmount;
    return map;
  }
}

class MMsubCategory {
  int subCategoryId;
  String subCategoryName;
  String subCategoryIcon;
  int categoryIdFK;

  MMsubCategory(this.subCategoryId, this.subCategoryName, this.subCategoryIcon,
      this.categoryIdFK);

  MMsubCategory.fromMap(dynamic obj) {
    this.subCategoryId = obj['subCategoryId'];
    this.subCategoryName = obj['subCategoryName'];
    this.subCategoryIcon = obj['subCategoryIcon'];
    this.categoryIdFK = obj['categoryIdFK'];
  }

  int get getsubCategoryId => subCategoryId;
  String get getsubCategoryName => subCategoryName;
  String get getsubCategoryIcon => subCategoryIcon;
  int get getcategoryIdFK => categoryIdFK;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["subCategoryId"] = subCategoryId;
    map["subCategoryName"] = subCategoryName;
    map["subCategoryIcon"] = subCategoryIcon;
    map["categoryIdFK"] = categoryIdFK;
    return map;
  }
}

//Do 'Transaction' trùng tên với class có sẵn trong thư viện sqflite nên dùng tên khác
//MM -> MoneyManager
class MMTransaction {
  int transactionId;
  int transactionSubCategoryId;
  String transactionAmount;
  String transactionIcon;
  String transactionDate;
  String transactionNote;

  MMTransaction(
      this.transactionId,
      this.transactionSubCategoryId,
      this.transactionAmount,
      this.transactionIcon,
      this.transactionDate,
      this.transactionNote);

  MMTransaction.fromMap(dynamic obj) {
    this.transactionId = obj['transactionId'];
    this.transactionSubCategoryId = obj['transactionSubCategoryId'];
    this.transactionAmount = obj['transactionAmount'];
    this.transactionIcon = obj['transactionIcon'];
    this.transactionDate = obj['transactionDate'];
    this.transactionNote = obj['transactionNote'];
  }
  MMTransaction.fromMapDateOnly(dynamic obj) {
    this.transactionDate = obj['transactionDate'];
  }
  int get getTransactionId => transactionId;
  int get getTransactionSubCategory => transactionSubCategoryId;
  String get getTransactionAmount => transactionAmount;
  String get getTransactionIcon => transactionIcon;
  String get getTransactionDate => transactionDate;
  String get getTransactionNote => transactionNote;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["transactionId"] = transactionId;
    map["transactionSubCategoryId"] = transactionSubCategoryId;
    map["transactionAmount"] = transactionAmount;
    map["transactionIcon"] = transactionIcon;
    map["transactionDate"] = transactionDate;
    map["transactionNote"] = transactionNote;
    return map;
  }
}
