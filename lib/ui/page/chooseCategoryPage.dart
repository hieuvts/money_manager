import 'package:flutter/material.dart';
import 'package:money_manager/ui/customWidget/customImageFromAsset.dart';

class ChooseCategoryPage extends StatelessWidget {
  final _biggerFont = TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn danh mục"),
      ),
      body: Padding(
        padding: EdgeInsets.all(1),
        child: Card(
          elevation: 3,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    FlatButton.icon(
                      onPressed: () {},
                      color: Colors.white,
                      icon: customImageFromAsset('images/foodAndBeverage.png'),
                      label: Text(
                        "Ăn uống                                                  ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 1);
                      },
                      icon: customImageFromAsset('images/burger.png'),
                      label: Text(
                        "Thực phẩm                                          ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 2);
                      },
                      icon: customImageFromAsset('images/drink.png'),
                      label: Text(
                        "Đồ uống                                          ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                //Category 2
                Row(
                  children: [
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {},
                      icon: customImageFromAsset('images/transportation.png'),
                      label: Text(
                        "Di chuyển                                                  ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 3);
                      },
                      icon: customImageFromAsset('images/gasStation.png'),
                      label: Text(
                        "Nhiên liệu                                          ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 4);
                      },
                      icon: customImageFromAsset('images/parking.png'),
                      label: Text(
                        "Phí gửi xe                                         ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 5);
                      },
                      icon: customImageFromAsset('images/maintenance.png'),
                      label: Text(
                        "Sửa chữa & bảo dưỡng                    ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 6);
                      },
                      icon: customImageFromAsset('images/taxi.png'),
                      label: Text(
                        "Tiền vé BUS, Taxi.....                        ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                //Category 3
                Row(
                  children: [
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {},
                      icon: customImageFromAsset('images/shopping-cart.png'),
                      label: Text(
                        "Mua sắm                                                 ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 7);
                      },
                      icon: customImageFromAsset('images/clothing.png'),
                      label: Text(
                        "Quần áo                                           ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 8);
                      },
                      icon: customImageFromAsset('images/sneaker.png'),
                      label: Text(
                        "Giày dép                                           ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 9);
                      },
                      icon: customImageFromAsset('images/accessory.png'),
                      label: Text(
                        "Trang sức                                           ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                //Category 4
                Row(
                  children: [
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {},
                      icon: customImageFromAsset('images/bill.png'),
                      label: Text(
                        "Hoá đơn                                             ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 10);
                      },
                      icon: customImageFromAsset('images/electricBill.png'),
                      label: Text(
                        "Hoá đơn điện                                    ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 11);
                      },
                      icon: customImageFromAsset('images/invoice.png'),
                      label: Text(
                        "Hoá đơn nước                                    ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 12);
                      },
                      icon: customImageFromAsset('images/internetBill.png'),
                      label: Text(
                        "Hoá đơn Internet                                ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 13);
                      },
                      icon: customImageFromAsset('images/televisionBill.png'),
                      label: Text(
                        "Hoá đơn truyền hình                         ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 14);
                      },
                      icon: customImageFromAsset('images/rental.png'),
                      label: Text(
                        "Tiền thuê nhà                                ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                //Category 5
                Row(
                  children: [
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {},
                      icon: customImageFromAsset('images/healthAndFitness.png'),
                      label: Text(
                        "Sức khoẻ & Làm đẹp                            ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 15);
                      },
                      icon: customImageFromAsset('images/insurance.png'),
                      label: Text(
                        "Bảo hiểm                                    ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 16);
                      },
                      icon: customImageFromAsset('images/pills.png'),
                      label: Text(
                        "Thuốc chữa bệnh                            ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 17);
                      },
                      icon: customImageFromAsset('images/personalCare.png'),
                      label: Text(
                        "Chăm sóc cá nhân                            ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 18);
                      },
                      icon: customImageFromAsset('images/gym.png'),
                      label: Text(
                        "Thể thao                                        ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 19);
                      },
                      icon: customImageFromAsset('images/hospital.png'),
                      label: Text(
                        "Bệnh viện                                        ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                //Category 6
                Row(
                  children: [
                    FlatButton.icon(
                      color: Colors.white,
                      onPressed: () {
                        _sendValueBack(context, 20);
                      },
                      icon: customImageFromAsset('images/other.png'),
                      label: Text(
                        "Khác                                                ",
                        style: _biggerFont,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendValueBack(BuildContext context, int chosenCategory) {
    Navigator.pop(context, chosenCategory);
  }
}
