import 'package:amazon_clone/constants/global_variable.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/admin/screens/analytics_screen.dart';
import 'package:amazon_clone/features/admin/screens/orders_screen.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screens.dart';
import 'package:amazon_clone/utils/bottom_navagation_item.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const AnalyticsScreen(),
    const OrdersScreen(),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Text(
                'Admins',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          //POSTS
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
          //ANALYTICS
          BottomNavigationBarItem(
            icon: BottomNavigationItems(
              page: _page,
              bottomBarBorderWidth: bottomBarBorderWidth,
              bottomNavigationBarWidth: bottomNavigationBarWidth,
              icons: Icons.analytics_outlined,
              color: _page == 1
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
            ),
            label: '',
          ),
          //INBOX
          BottomNavigationBarItem(
            icon: BottomNavigationItems(
              page: _page,
              bottomBarBorderWidth: bottomBarBorderWidth,
              bottomNavigationBarWidth: bottomNavigationBarWidth,
              icons: Icons.all_inbox_outlined,
              color: _page == 2
                  ? GlobalVariables.selectedNavBarColor
                  : GlobalVariables.backgroundColor,
            ),
            label: '',
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}
