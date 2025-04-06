import 'package:flutter/material.dart';
import 'add_diary_entry_screen.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  @override
  _DiaryScreenState createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  List<DiaryEntry> diaryEntries = [];

  void _addDiaryEntry(DiaryEntry entry) {
    setState(() {
      diaryEntries.add(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary'),
      ),
      body: diaryEntries.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No diary entries'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDiaryEntryScreen(
                            onSave: _addDiaryEntry,
                          ),
                        ),
                      );
                      if (result != null && result is DiaryEntry) {
                        _addDiaryEntry(result);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[200],
                    ),
                    child: const Text('Add diary entry'),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: diaryEntries.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date: ${diaryEntries[index].date.day}/${diaryEntries[index].date.month}/${diaryEntries[index].date.year}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(diaryEntries[index].note),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class DiaryEntry {
  DiaryEntry({required this.date, required this.note});

  final DateTime date;
  final String note;
}
