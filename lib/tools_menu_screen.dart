import 'package:flutter/material.dart';
import 'baby_names_screen.dart';
import 'diary_screen.dart';
import 'moments_screen.dart';
import 'appointments_screen.dart';

class ToolsMenuScreen extends StatefulWidget {
  const ToolsMenuScreen({Key? key}) : super(key: key);

  @override
  State<ToolsMenuScreen> createState() => _ToolsMenuScreenState();
}

class _ToolsMenuScreenState extends State<ToolsMenuScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools Menu'),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.child_friendly), label: 'Baby Names'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Diary'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Moments'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 1:
        return const BabyNamesScreen();
      case 2:
        return const DiaryScreen();
      case 3:
        return const MomentsScreen();
      case 4:
        return const AppointmentsScreen();
      default:
        return const Center(child: Text('Home Screen'));
    }
  }
}
