import 'package:flutter/material.dart';
import 'package:meta_app/presentation/Resources/color_manager.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/account/account_page.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/home/home_page.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/maket/market_page.dart';
import 'package:meta_app/presentation/views/app_nav_bottom_bar/wallet/wallet_page.dart';

class AppNavBottomBar extends StatefulWidget {
  const AppNavBottomBar({super.key});

  @override
  State<AppNavBottomBar> createState() => _AppNavBottomBarState();
}

class _AppNavBottomBarState extends State<AppNavBottomBar> {
  int curIndex = 0;
  List<Widget> pages = [
    Homepage(),
    WalletPage(),
    MarketPage(),
    AccountPage(),
  ];
  void setPage(int val) {
    setState(() {
      curIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bodyLight,
      body: pages[curIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          child: Container(
            height: 120,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
                onTap: (val) {
                  setPage(val);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled,
                          color: ColorManager.dark, size: 40),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.wallet,
                          color: ColorManager.dark, size: 40),
                      label: 'wallet'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart,
                          color: ColorManager.dark, size: 40),
                      label: 'Market'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person,
                          color: ColorManager.dark, size: 40),
                      label: 'Account'),
                ]),
          ),
        ),
      ),
    );
  }
}
