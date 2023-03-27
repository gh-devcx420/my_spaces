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
      backgroundColor: kMySpacesWhite,
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
              color: kMySpacesWhite,
            ),
          ),
        ),
        child: NavigationBar(
          elevation: 0,
          height: 60,
          backgroundColor: kMySpacesWhite,
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
                color: Theme.of(context).primaryColor,
              ),
              selectedIcon: const Icon(
                Icons.space_dashboard_rounded,
                color: kMySpacesWhite,
              ),
              label: "Dashboard",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              selectedIcon: const Icon(
                Icons.home,
                color: kMySpacesWhite,
              ),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
              ),
              selectedIcon: const Icon(
                Icons.settings,
                color: kMySpacesWhite,
              ),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
