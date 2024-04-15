import 'package:flutter/material.dart';
import 'package:keyboard/Favourite/fav_screen.dart';

import 'package:keyboard/Pages/Product.dart';
import 'package:keyboard/Pages/homepage.dart';
import '../cart/my_cart_view.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          _NavBarItem(
            icon: Icons.list,
            text: 'List',
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Product()));
            },
          ),
          _NavBarItem(
            icon: Icons.favorite_outline_rounded,
            text: 'Favorites',
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavoritePage()));
            },
          ),
          _NavBarItem(
            icon: Icons.shopping_cart,
            text: 'Cart',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MyCart(),
              ));
            },
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _NavBarItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black, // Set icon color to black
            size: 32,
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
