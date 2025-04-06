import 'package:flutter/material.dart';

class AiTherapistScreen extends StatelessWidget {
  const AiTherapistScreen({Key? key}) : super(key: key);

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Coming Soon"),
          content: Text(
              "We are working hard to bring this feature to this app. Please check again at a later time."),
          actions: <Widget>[
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Therapist'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showComingSoonDialog(context);
          },
          child: Text('AI Therapist'),
        ),
      ),
    );
  }
}
