import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_framework/responsive_framework.dart';

//Navigation Bottom Bar
class NavBottomBarClass extends StatefulWidget {
  const NavBottomBarClass({super.key});

  @override
  State<NavBottomBarClass> createState() => _NavBottomBarClassState();
}

class _NavBottomBarClassState extends State<NavBottomBarClass> {
  int currentPage = 0;
  static final List<Widget>  _selector = <Widget>[
    const Text("Home Page"),
    const Text("Explore Page"),
    const Text("Market Page"),
    const Text("Settings Page"),
  ];

  void selectorPage (int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _selector.elementAt(currentPage),
      ),
      bottomNavigationBar: GNav(
        tabs: const <GButton>[
          GButton(icon: Icons.home_filled),
          GButton(icon: Icons.explore),
          GButton(icon: Icons.shopping_bag),
          GButton(icon: Icons.settings),
        ],
        onTabChange: selectorPage,
        color: Colors.black26,
        activeColor: Colors.black,
      ),
    );
  }
}

//Layout Home
class AppLayoutClass extends StatelessWidget {
  const AppLayoutClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP)
        ],
      ),
      home: const NavBottomBarClass(),
    );
  }
}
