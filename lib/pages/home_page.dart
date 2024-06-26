// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter6_nike_store/components/bottom_nav_bar.dart';
import 'package:flutter6_nike_store/pages/cart_page.dart';
import 'package:flutter6_nike_store/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //this selected index is to control the bottom navigation
  int _selectedIndex = 0;

  //this method will update the selected index
  //when the user taps on the bottom bar
  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
          onPressed: () => {
            Scaffold.of(context).openDrawer()
          }, 
          icon: const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              ),
          )
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset(
                    'lib/images/nike.png',
                    color: Colors.white,
                    width: 150,
                    height: 150,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),

                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),              
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),              
                    ),
                  ),
                ),
              ],
              
            ),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),              
                ),
              ),
            )

          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}