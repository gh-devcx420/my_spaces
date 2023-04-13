import 'package:flutter/material.dart';
import 'package:myspaces/screens/my_spaces/dashboard_page.dart';
import 'package:myspaces/screens/my_spaces/my_spaces_page.dart';
import 'package:myspaces/screens/my_spaces/settings_page.dart';
import 'package:myspaces/utils/constants.dart';

class MySpacesHome extends StatefulWidget {
  const MySpacesHome({Key? key}) : super(key: key);

  @override
  State<MySpacesHome> createState() => _MySpacesHomeState();
}

class _MySpacesHomeState extends State<MySpacesHome> {
  int _index = 1;
  final screens = const [
    DashboardPage(),
    MySpacesPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMSWhite,
      body: SafeArea(
        child: screens[_index],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Theme.of(context).primaryColor,
          labelTextStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kMSWhite,
            ),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          height: 60,
          backgroundColor: kMSWhite,
          selectedIndex: _index,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() {
            _index = index;
          }),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.space_dashboard_rounded,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              selectedIcon: const Icon(
                Icons.space_dashboard_rounded,
                color: kMSWhite,
              ),
              label: "Dashboard",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              selectedIcon: const Icon(
                Icons.home,
                color: kMSWhite,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
              selectedIcon: const Icon(
                Icons.settings,
                color: kMSWhite,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}