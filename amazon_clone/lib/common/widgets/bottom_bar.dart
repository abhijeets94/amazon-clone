import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screens.dart';
import 'package:amazon_clone/utils/bottom_navagation_item.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual_home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart Page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          BottomNavigationBarItem(
            icon: BottomNavigationItems(
              page: _page,
              bottomBarBorderWidth: bottomBarBorderWidth,
              bottomNavigationBarWidth: bottomNavigationBarWidth,
              icons: Icons.home_outlined,
              color: _page == 0
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: BottomNavigationItems(
              page: _page,
              bottomBarBorderWidth: bottomBarBorderWidth,
              bottomNavigationBarWidth: bottomNavigationBarWidth,
              icons: Icons.person_outline,
              color: _page == 1
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Container(
                width: bottomNavigationBarWidth,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    ),
                  ),
                ),
                child: Badge(
                  elevation: 0,
                  badgeContent: const Text("2"),
                  badgeColor: Colors.white,
                  child: Icon(Icons.shopping_cart_outlined),
                ),
              ))
        ],
      ),
    );
  }
}
