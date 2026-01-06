import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'rewards_screen.dart';
import 'finance_screen.dart';
import 'cards_screen.dart';
import 'me_screen.dart';
import '../models/user_info.dart';
import '../services/user_info_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _isInfoReceived = false;

  UserInfo? userInfo;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    userInfo = await UserInfoService().getUserInfo();
    if (userInfo != null) {
      setState(() {
        _isInfoReceived = true;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // the children widgets need to be configured per build, not statically
    final List<Widget> _screens = [
      HomeScreen(userInfo: userInfo),
      const RewardsScreen(),
      const FinanceScreen(),
      CardsScreen(userInfo: userInfo),
      MeScreen(userInfo: userInfo),
    ];

    return Scaffold(
      body: Visibility(
        visible: _isInfoReceived,
        replacement: const Center(child: CircularProgressIndicator()),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00C853),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.diamond), label: 'Rewards'),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
        ],
      ),
    );
  }
}
