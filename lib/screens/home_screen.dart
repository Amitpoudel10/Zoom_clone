import 'package:flutter/material.dart';
import 'package:lets_meet/screens/history_meeting_screen.dart';
import 'package:lets_meet/utils/colors.dart';
import 'package:lets_meet/widgets/home_meeting_button.dart';

import 'meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  onItemTapped(int page) {
    setState(() {
      selectedIndex = page;
    });
  }

  List<Widget> pages=[
   MeetingScreen(),
  const HistoryMeetingScreen(),
  const Text('Contacts'),
  const Text('Settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meet & Chat'),
          centerTitle: true,
          backgroundColor: backgroundColor,
          elevation: 0,
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.comment_bank), label: 'Meet & Chat'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Meetings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'Contacts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'Settings'),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: onItemTapped,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

