import 'package:flutter/material.dart';

class AiTherapistScreen extends StatefulWidget {
  const AiTherapistScreen({Key? key}) : super(key: key);

  @override
  State<AiTherapistScreen> createState() => _AiTherapistScreenState();
}

class _AiTherapistScreenState extends State<AiTherapistScreen> {
  List<Map<String, String>> messages = [
    {
      'sender': 'bot',
      'text': 'Hi there! I\'m your Sukoon AI companion. Ask me anything about your motherhood journey 😊'
    },
  ];

  final List<Map<String, String>> predefinedQuestions = [
    {
      'question': 'How can I manage sleep with a newborn?',
      'answer':
          'Try to sleep when your baby sleeps and don’t hesitate to ask for help from your partner or family.'
    },
    {
      'question': 'Is it normal to feel overwhelmed as a new mom?',
      'answer': 'Absolutely. You’re doing your best, and it’s okay to take breaks and seek support.'
    },
    {
      'question': 'What are simple ways to boost my mood?',
      'answer':
          'Take a walk, talk to a friend, or spend 10 quiet minutes to yourself. Little things can help a lot.'
    },
  ];

  void _handleUserQuestion(String question) {
    final answer = predefinedQuestions
        .firstWhere((q) => q['question'] == question)['answer'];
    setState(() {
      messages.add({'sender': 'user', 'text': question});
      messages.add({'sender': 'bot', 'text': answer!});
    });
  }

  void _showQuestionOptions() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ListView.builder(
            itemCount: predefinedQuestions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(predefinedQuestions[index]['question']!),
                onTap: () {
                  Navigator.pop(context);
                  _handleUserQuestion(predefinedQuestions[index]['question']!);
                },
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0F5), // very light pink
      appBar: AppBar(
        title: const Text('AI Therapist'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['sender'] == 'user';
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.pink,
                      ),
                    if (!isUser) SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser
                              ? Colors.blue[100]
                              : Colors.pink[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(msg['text']!),
                      ),
                    ),
                    if (isUser) SizedBox(width: 8),
                    if (isUser)
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.blue,
                      ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            child: Row(
              children: [
                Icon(Icons.mic, color: Colors.grey),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showQuestionOptions,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                    ),
                    child: Text("Type Here"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
