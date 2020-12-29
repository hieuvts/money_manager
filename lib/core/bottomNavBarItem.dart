import 'package:flutter/material.dart';

class NavBarItem {
  static final List<BottomNavigationBarItem> getNavBarItems = [
    BottomNavigationBarItem(
      icon: new Image.asset(
        'images/BWbill.png',
        width: 35,
        height: 35,
      ),
      label: 'Giao dịch',
    ),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/BWpie_chart.png',
          width: 35,
          height: 35,
        ),
        label: 'Thống kê'),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/BWadd.png',
          width: 35,
          height: 35,
        ),
        label: 'Thêm'),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/BWsettings.png',
          width: 35,
          height: 35,
          alignment: Alignment.center,
        ),
        label: 'Cài đặt'),
  ];
}
