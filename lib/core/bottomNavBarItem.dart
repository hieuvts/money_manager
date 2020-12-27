import 'package:flutter/material.dart';

class NavBarItem {
  static final List<BottomNavigationBarItem> getNavBarItems = [
    BottomNavigationBarItem(
      icon: new Image.asset(
        'images/transaction.png',
      ),
      label: 'Giao dịch',
    ),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/graph.png',
        ),
        label: 'Thống kê'),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/add.png',
        ),
        label: 'Thêm'),
    BottomNavigationBarItem(
        icon: new Image.asset(
          'images/settings.png',
        ),
        label: 'Cài đặt'),
  ];
}
