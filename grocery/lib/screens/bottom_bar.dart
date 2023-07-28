import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/screens/cart/cart_screen.dart';
import 'package:grocery/screens/categories.dart';
import 'package:grocery/screens/home_screen.dart';
import 'package:grocery/screens/user.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme.dart';

class BottomBarTab extends StatefulWidget {
  const BottomBarTab({super.key});

  @override
  State<BottomBarTab> createState() => _BottomBarTabState();
}

class _BottomBarTabState extends State<BottomBarTab> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': CategoriesScreen(), 'title': 'Categories Screen'},
    {'page': const CartScreen(), 'title': 'Cart Screen'},
    {'page': const UserScreen(), 'title': 'User Screen'}
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(title: Text(_pages[_selectedIndex]['title'])),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: _isDark ? Colors.blueGrey : Colors.black,
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.black87,
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category),
                label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
                label: "user")
          ]),
    );
  }
}
