import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:propertycp/screens/favourite/favourite_screen.dart';
import 'package:propertycp/screens/leads/lead_screen.dart';
import 'package:propertycp/screens/profile/profile_screen.dart';
import '../home/home_screen.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key});
  static const String routePath = '/homeContainer';

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int _selectedIndex = 0;

  switchTabs(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: _selectedIndex,
        showElevation: true,
        onItemSelected: (index) => switchTabs(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(
              LineAwesomeIcons.home,
            ),
            title: const Text('Home'),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.real_estate_agent_outlined),
            title: const Text('Leads'),
          ),
          FlashyTabBarItem(
            icon: const Icon(LineAwesomeIcons.heart),
            title: const Text('Favourite'),
          ),
          FlashyTabBarItem(
            icon: const Icon(LineAwesomeIcons.user),
            title: const Text('Profile'),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: getBody(),
  //     bottomNavigationBar: BottomNavigationBar(
  //       type: BottomNavigationBarType.fixed,
  //       currentIndex: _selectedIndex,

  //       selectedLabelStyle: const TextStyle(color: primary),
  //       onTap: (index) => switchTabs(index),
  //       items: const [
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             LineAwesomeIcons.home,
  //           ),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             LineAwesomeIcons.home,
  //           ),
  //           label: 'Leads',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             LineAwesomeIcons.home,
  //           ),
  //           label: 'Favourite',
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(
  //             LineAwesomeIcons.home,
  //           ),
  //           label: 'Profile',
  //         ),
  //       ],
  //     ),
  //   );
  // }

  getBody() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(switchTabs: switchTabs);
      case 1:
        return LeadScreen(switchTabs: switchTabs);
      case 2:
        return FavouriteScreen(switchTabs: switchTabs);
      case 3:
        return ProfileScreen(switchTabs: switchTabs);
      default:
        return defaultWidget();
    }
  }

  Center defaultWidget() {
    return const Center(
      child: Text('This page is under construction'),
    );
  }
}
