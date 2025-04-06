import 'package:flutter/material.dart';
import 'add_child_screen.dart';

class Child {
  final String name;
  final String gender;
  final DateTime birthDate;

  Child({required this.name, required this.gender, required this.birthDate});
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Child> _children = [];

  void _addChild(Child child) {
    setState(() {
      _children.add(child);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mother\'s Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Father\'s Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'You are the...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              items: <String>['Mother', 'Father', 'Parent', 'Partner', 'Single Mother', 'Uncle', 'Aunt']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle dropdown value change
              },
              decoration: const InputDecoration(
                hintText: 'Select your role',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your Age',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter your age',
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddChildScreen()),
                );
                if (result is Child) {
                  _addChild(result);
                }
              },
              child: const Text('Add Children'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Children:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _children.isEmpty
                ? const Text('No children added yet.')
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _children.map((child) => Text(
                        '${child.name} (${child.gender}), Birthdate: ${child.birthDate.day}/${child.birthDate.month}/${child.birthDate.year}')).toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
