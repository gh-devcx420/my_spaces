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
              color: kPrimaryColour,
            ),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          height: 60,
          backgroundColor: kPrimaryColour,
          selectedIndex: _index,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() {
            _index = index;
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.space_dashboard_rounded,
                color: kSecondaryColour,
              ),
              selectedIcon: Icon(
                Icons.space_dashboard_rounded,
                color: kPrimaryColour,
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
                color: kPrimaryColour,
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
                color: kPrimaryColour,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
