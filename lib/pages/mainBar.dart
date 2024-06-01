import 'package:flutter/material.dart';
import 'package:jobsheet4/pages/homepages.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            print(index);
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

  Widget pages() {
    switch (currentIndex) {
      case 0:
        return HomePages();
      case 1:
        return const Center(
          child: Text('Favorite'),
        );

      case 2:
        return const Center(
          child: Text('Profile'),
        );
      default:
        return HomePages();
    }
  }
}
