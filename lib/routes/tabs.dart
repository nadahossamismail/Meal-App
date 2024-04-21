import 'package:flutter/material.dart';
import 'package:meal_app/routes/categories_screen.dart';
import 'package:meal_app/routes/favorites_screen.dart';
import 'package:meal_app/routes/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int screenIndex = 0;
  List<Widget> tabs = [const CategoriesScreen(), const FavoritesScreen()];
  List<String> screenTitle = ["Categories", "Favorites"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          screenTitle[screenIndex],
        ),
      ),
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(255, 234, 231, 231),
        child: MyDrawer(),
      ),
      body: tabs[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 133, 128, 128),
          currentIndex: screenIndex,
          onTap: (index) {
            setState(() {
              screenIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 26,
          items: const [
            BottomNavigationBarItem(
              label: "Categories",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
                label: "Favorites",
                icon: Icon(
                  Icons.favorite,
                )),
          ]),
    );
  }
}
