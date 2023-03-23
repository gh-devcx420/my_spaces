import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/screens/pages/dashboard_page.dart';
import 'package:myspaces/screens/pages/home_page.dart';
import 'package:myspaces/screens/pages/settings_page.dart';

class MySpacesHome extends StatefulWidget {
  const MySpacesHome({Key? key}) : super(key: key);

  @override
  State<MySpacesHome> createState() => _MySpacesHomeState();
}

class _MySpacesHomeState extends State<MySpacesHome> {
  int _index = 1;
  final screens = const [
    DashboardBody(),
    HomeBody(),
    SettingsBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColour,
      body: SafeArea(
        child: screens[_index],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: kSecondaryColour,
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: kTertiaryColour,
            ),
          ),
        ),
        child: NavigationBar(
          height: 50,
          backgroundColor: kPrimaryColour,
          selectedIndex: _index,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() {
            _index = index;
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.space_dashboard_rounded,
                color:kSecondaryColour,
              ),
              selectedIcon: Icon(
                Icons.space_dashboard_rounded,
                color: kTertiaryColour,
              ),
              label: "Dashboard",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: kSecondaryColour,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: kTertiaryColour,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings,
                color: kSecondaryColour,
              ),
              selectedIcon: Icon(
                Icons.settings,
                color: kTertiaryColour,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
