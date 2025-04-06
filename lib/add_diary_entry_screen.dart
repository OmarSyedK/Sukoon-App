import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'diary_screen.dart';

class AddDiaryEntryScreen extends StatefulWidget {
  const AddDiaryEntryScreen({Key? key, required this.onSave}) : super(key: key);

  final Function(DiaryEntry) onSave;

  @override
  _AddDiaryEntryScreenState createState() => _AddDiaryEntryScreenState();
}

class _AddDiaryEntryScreenState extends State<AddDiaryEntryScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController noteController = TextEditingController();
  File? image;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Diary Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue[200],
              ),
              child: Text(
                'Select Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: noteController,
              decoration: const InputDecoration(
                hintText: 'Add a note',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SafeArea(
                      child: Wrap(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.photo_library),
                            title: const Text('Choose from Gallery'),
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.camera_alt),
                            title: const Text('Take a Photo'),
                            onTap: () {
                              _pickImage(ImageSource.camera);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Add photo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final entry = DiaryEntry(date: selectedDate, note: noteController.text);
                widget.onSave(entry);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue[200],
              ),
              child: const Text('Save entry'),
            ),
          ],
        ),
      ),
    );
  }
}
