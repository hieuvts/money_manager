import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter/material.dart';

class CustomSnakeNavBar extends StatefulWidget {
  CustomSnakeNavBar({@required this.items});
  List<BottomNavigationBarItem> items;

  @override
  _CustomSnakeNavBarState createState() => _CustomSnakeNavBarState();
}

class _CustomSnakeNavBarState extends State<CustomSnakeNavBar> {
  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(10),
    topRight: Radius.circular(0),
    bottomLeft: Radius.circular(10),
  );
  ShapeBorder bottomBarShape = new Border();
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);
  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.rectangle;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;
  Color selectedColor = Colors.blueAccent[100];
  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Color unselectedColor = Colors.blueGrey;
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);
  Color containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  Widget build(BuildContext context) {
    return SnakeNavigationBar.color(
      behaviour: snakeBarStyle,
      snakeShape: snakeShape,
      shape: bottomBarShape,

      ///configuration for SnakeNavigationBar.color
      snakeViewColor: selectedColor,
      selectedItemColor:
          snakeShape == SnakeShape.indicator ? selectedColor : null,
      unselectedItemColor: Colors.blueGrey,

      ///configuration for SnakeNavigationBar.gradient
      // snakeViewGradient: selectedGradient,
      // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
      // unselectedItemGradient: unselectedGradient,

      showUnselectedLabels: showUnselectedLabels,
      showSelectedLabels: showSelectedLabels,

      currentIndex: _selectedItemPosition,
      onTap: (index) {
        setState(() => _selectedItemPosition = index);
        onTabTapped(index);
        print('tapped page $index');
      },

      selectedLabelStyle: const TextStyle(fontSize: 14),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      items: [
        BottomNavigationBarItem(
            icon: new Image.asset('images/transaction.png'),
            label: 'Giao dịch'),
        BottomNavigationBarItem(
            icon: new Image.asset('images/graph.png'), label: 'Thống kê'),
        BottomNavigationBarItem(
            icon: new Image.asset('images/add.png'), label: 'Thêm'),
        BottomNavigationBarItem(
            icon: new Image.asset('images/settings.png'), label: 'Cài đặt'),
      ],
    );
  }
}
